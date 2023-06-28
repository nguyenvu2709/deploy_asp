using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ETBE.Models;

public partial class User
{
    [Key]
    public int Id { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? Fullname { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public int RoleId { get; set; }
}


