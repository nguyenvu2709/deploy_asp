using ETBE.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ETBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly QuizDbContext _context;

        public QuestionController(QuizDbContext context)
        {
            _context = context;
        }

        // GET: api/Question
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Question>>> GetQuestions()
        {
            var random5Qns = await (_context.Questions 
                 .Select(x => new
                 {
                     QnId = x.QnId,
                     QuizID = x.QuizId,
                     QnInWords = x.QnInWords,
                     ImageName = x.ImageName,
                     Options = new string[] { x.Option1, x.Option2, x.Option3, x.Option4 },
                     Answers = x.Answer,
             
                 })
                 
                 
                 ).ToListAsync();

            return Ok(random5Qns);
        }
        // GET: api/Question/5
        [HttpGet("{quizid}")]
        public async Task<ActionResult<Question>> GetQuestion(int quizid)
        {
            var question = await _context.Questions.FindAsync(quizid);

            if (question == null)
            {
                return NotFound();
            }

            return question;
        }



        
        [HttpPut("{id}")]
        public async Task<IActionResult> PutQuestion(int id, Question question)
        {
            if (id != question.QnId)
            {
                return BadRequest();
            }

            _context.Entry(question).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuestionExists(id))
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


        // POST: api/Question/GetAnswers
        [HttpPost]
        [Route("GetAnswers")]
        public async Task<ActionResult<Question>> RetrieveAnswers(int[] qnIds)
        {
            var answers = await (_context.Questions
                .Where(x => qnIds.Contains(x.QnId))
                .Select(y => new
                {
                    QnId = y.QnId,
                    QnInWords = y.QnInWords,
                    ImageName = y.ImageName,
                    Options = new string[] { y.Option1, y.Option2, y.Option3, y.Option4 },
                    Answer = y.Answer
                })).ToListAsync();
            return Ok(answers);
        }
        [HttpPost]
        public async Task<ActionResult<Question>> PostQuestion(Question question)
        {
            var temp = _context.Questions
                .Where(x => x.QnInWords == question.QnInWords
                && x.Answer == question.Answer && x.QuizId == question.QuizId 
                && x.Option1 == question.Option1 && x.Option2 == question.Option2
                && x.Option3 == question.Option3 && x.Option4 == question.Option4
                && x.ImageName == question.ImageName)
                .FirstOrDefault();

            if (temp == null)
            {
                _context.Questions.Add(question);
                await _context.SaveChangesAsync();
            }
            else
                question = temp;

            return Ok(question);
        }

        // DELETE: api/Question/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteQuestion(int id)
        {
            var question = await _context.Questions.FindAsync(id);
            if (question == null)
            {
                return NotFound();
            }

            _context.Questions.Remove(question);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool QuestionExists(int id)
        {
            return _context.Questions.Any(e => e.QnId == id);
        }

    }

}
