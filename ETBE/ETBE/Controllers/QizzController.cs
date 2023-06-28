using ETBE.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ETBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QizzController : ControllerBase
    {
        private readonly QuizDbContext _context;



        public QizzController(QuizDbContext context)
        {
            {
                _context = context;
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Quiz>>> GetQuizz()
        {
            return await _context.Quizes.ToListAsync();
        }
        [HttpGet ("{id}")]
        public async Task<ActionResult<IEnumerable<Quiz>>> GetAllData(int id)
        {
            var quiz = await _context.Quizes.FindAsync(id);

            if (quiz == null)
            {
                return NotFound();
            }

            var data = await (
                from t1 in _context.Quizes
                join t2 in _context.Questions on t1.QuizId equals t2.QuizId
                where t1.QuizId == quiz.QuizId
                select new 
                {
                     QnId = t2.QnId,
                     QuizID = t1.QuizId,
                     QnInWords = t2.QnInWords,
                     ImageName = t2.ImageName,
                     Options = new string[] { t2.Option1, t2.Option2, t2.Option3, t2.Option4 },
                     Answers = t2.Answer,
                })
                
                
                .ToListAsync();
            return Ok(data);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutQuiz(int id, Quiz quiz)
        {
            if (id != quiz.QuizId)
            {
                return BadRequest();
            }

            _context.Entry(quiz).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuizExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Quiz>> PostQuiz(Quiz quiz)
        {
            var temp = _context.Quizes
                .Where(x => x.QuizName == quiz.QuizName
                && x.Decripsion == quiz.Decripsion && x.Imagename == quiz.Imagename)
                .FirstOrDefault();

            if (temp == null)
            {
                _context.Quizes.Add(quiz);
                await _context.SaveChangesAsync();
            }
            else
                quiz = temp;

            return Ok(quiz);
        }

        private bool QuizExists(int id)
        {
            return _context.Quizes.Any(e => e.QuizId == id);
        }

        // DELETE: api/Question/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteQuiz(int id)
        {
            var quiz = await _context.Quizes.FindAsync(id);
            if (quiz == null)
            {
                return NotFound();
            }

            _context.Quizes.Remove(quiz);
            await _context.SaveChangesAsync();

            return NoContent();
        }

    }
}
