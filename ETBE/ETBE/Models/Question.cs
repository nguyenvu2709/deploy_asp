using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ETBE.Models;


public partial class Question
{

    [Key]
    public int QnId { get; set; }
    [ForeignKey("QnId")]
    public int? QuizId { get; set; }

    [Column(TypeName = "nvarchar(500)")]
    public string? QnInWords { get; set; }

    [Column(TypeName = "nvarchar(50)")]
    public string? ImageName { get; set; }

    [Column(TypeName = "nvarchar(50)")]
    public string? Option1 { get; set; }

    [Column(TypeName = "nvarchar(50)")]
    public string? Option2 { get; set; }

    [Column(TypeName = "nvarchar(50)")]
    public string? Option3 { get; set; }

    [Column(TypeName = "nvarchar(50)")]
    public string? Option4 { get; set; }

    public int Answer { get; set; }

   
}



