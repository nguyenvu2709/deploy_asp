using ETBE.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ETBE.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]

 
    public class HistoryController : ControllerBase
    {
        private readonly QuizDbContext _context;



        public HistoryController(QuizDbContext context)
        {
            {
                _context = context;
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<Quiz>>> Get(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            var data = await (
                from t1 in _context.Participants
                join t2 in _context.Quizes on t1.QuizId equals t2.QuizId
                join t3 in _context.Users on t1.User_Id equals t3.Id
                where t1.User_Id == user.Id
                select new
                {
                    nickname = t1.Nickname,
                    score = t1.Score,
                    timetaken = t1.TimeTaken,
                    email = t3.Email,
                    QuizName = t2.QuizName,
                   
                })


                .ToListAsync();
            return Ok(data);
        }


    }
}
