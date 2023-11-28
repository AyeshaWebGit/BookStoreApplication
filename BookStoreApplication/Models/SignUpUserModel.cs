using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Models
{
    public class SignUpUserModel
    {
        [Required(ErrorMessage = "Please Enter FirstName")]
        public string FirstName { get; set; }
        public string LastName { get; set; }
        [Required (ErrorMessage ="Please Enter Email")]
        [Display(Name ="Email Address")]
        [EmailAddress(ErrorMessage ="Please Enter Valid Email Address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter a strong password")]
        [Compare("ConfirmPassword", ErrorMessage = "Password does not match")]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please confirm your password")]
        [Display(Name = "Confirm Password")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}
