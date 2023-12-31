﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Models
{
    public class ChangePasswordModel
    {
        [Required, DataType(DataType.Password),Display(Name ="Current Password")]
        public string CurrentPassword { get; set; }
        [Required, DataType(DataType.Password), Display(Name = "New Password")]
        public string NewPassword { get; set; }
        [Required, DataType(DataType.Password), Display(Name = "Confirm Password")]
        [Compare("NewPassword",ErrorMessage ="Confirm New Password Does not match")]
        public string ConfirmNewPassword { get; set; }
    }
}
