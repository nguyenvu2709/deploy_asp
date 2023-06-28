using Microsoft.EntityFrameworkCore;
using System.Xml;

namespace ETBE.Models
{
    public class QuizDbContext : DbContext
    {
        public QuizDbContext(DbContextOptions<QuizDbContext> options) : base(options)
        { }

        public DbSet<Question> Questions { get; set; }
        public DbSet<Participant> Participants { get; set; }
        public DbSet<Quiz> Quizes { get; set; }
        public DbSet<User> Users { get; set; }


          }
    


}
