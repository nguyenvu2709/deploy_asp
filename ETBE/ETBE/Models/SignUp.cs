using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace ETBE.Models
{
        public class SignUpRequest
        {
        //UserName, PassWord, Role
            public string? UserName { get; set; }
            public string? Password { get; set; }
            public string? ConfigPassword { get; set; }
            public string? FullName { get; set; }
            public string? Email { get; set; }
            public string? Phone { get; set; }
            public string? Address { get; set; }
        }

        public class SignUpResponse
        {
            public bool IsSuccess { get; set; }
            public string? Message { get; set; }
        }
    
}
