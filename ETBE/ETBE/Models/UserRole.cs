using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ETBE.Models;

public partial class UserRole
{

    [Key]
    public int RoleId { get; set; }


    public string? RoleName { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
