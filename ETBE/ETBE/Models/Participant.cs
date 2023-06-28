using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ETBE.Models
{
    public class Participant
    {
        [Key]
        public int ParticipantId { get; set; }


        [Column(TypeName = "varchar(100)")]
        public string? Nickname { get; set; }

        public int Score { get; set; }

        public int TimeTaken { get; set; }

        public int User_Id { get; set; }

        public int QuizId { get; set; }
    }

    public class ParticipantRestult
    {
        public int ParticipantId { get; set; }

        public int Score { get; set; }

        public int TimeTaken { get; set; }

        public int User_Id { get; set; }

        public int QuizId { get; set; }
    }
}
