using Microsoft.EntityFrameworkCore;

namespace ETBE.Models
{
    public class UserDbContext : DbContext
    {
        public UserDbContext(DbContextOptions<UserDbContext> options) : base(options)
        { }

        public DbSet<User> Users { get; set; }

        public DbSet<UserRole> UserRole { get; set; }
    }
}

