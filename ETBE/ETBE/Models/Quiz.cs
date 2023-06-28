using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ETBE.Models;

public partial class Quiz
{
    [Key]
    public int QuizId { get; set; }

    public string? QuizName { get; set; }

    public string? Decripsion { get; set; }

    public string? Imagename { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
