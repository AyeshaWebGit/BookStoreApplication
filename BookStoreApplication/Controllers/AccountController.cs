using BookStoreApplication.Models;
using BookStoreApplication.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAccountRepository _accountrepository;
        public AccountController(IAccountRepository accountrepository)
        {
            _accountrepository = accountrepository;
        }
        [Route("Myaccount")]
        public IActionResult Myaccount()
        {
            return RedirectToAction("ChangePassword");
        }

        [Route("SignUp")]
        public IActionResult SignUp()
        {
            return View();
        }
        [Route("signup")]
        [HttpPost]
        public async Task<IActionResult> Signup(SignUpUserModel userModel)
        {
            if (ModelState.IsValid)
            {
                // write your code
                var result = await _accountrepository.CreateUserAsync(userModel);
                if (!result.Succeeded)
                {
                    foreach (var errorMessage in result.Errors)
                    {
                        ModelState.AddModelError("", errorMessage.Description);
                    }

                    return View(userModel);
                }

                ModelState.Clear();
                return RedirectToAction("ConfirmEmail", new { email = userModel.Email });
            }

            return View(userModel);
        }
        [Route("LogIn")]
        public IActionResult LogIn()
        {
            return View();
        }
        [Route("LogIn")]
        [HttpPost]
        public async Task<IActionResult> LogIn(SignInModel signInModel, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var result = await _accountrepository.PasswordSignInAsync(signInModel);
                if (result.Succeeded)
                {
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        return LocalRedirect(returnUrl);
                    }
                    return RedirectToAction("Index", "Book");
                }
                if (result.IsNotAllowed)
                {
                    ModelState.AddModelError("", "Not Allowed to Log-in");
                }
                else if(result.IsLockedOut)
                    {
                    ModelState.AddModelError("", "Account blocked. Try after some times");
                }
                else
                {

             
                ModelState.AddModelError("","Invalid Credential");
                }
            }
            return View();
        }
        [Route("LogOut")]
        public async Task<IActionResult> LogOut()
        {
            await _accountrepository.SignOutAsync();
            return RedirectToAction("Index","Book");
        }
        [Route("change-password")]
        public async Task<IActionResult> ChangePassword()
        {
         
            return View();
        }
        [HttpPost("change-password")]
       
        public async Task<IActionResult> ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await _accountrepository.ChangePasswordAsync(model);
                if (result.Succeeded)
                {
                    ViewBag.IsSuccess = true;
                    ModelState.Clear();
                    return View();
                }
                foreach(var error  in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
            }
            return View(model);
        }
        [HttpGet("confirm-email")]
        public async Task<IActionResult> ConfirmEmail(string uid, string token, string email)
        {
            EmailConfirmModel model = new EmailConfirmModel
            {
                Email = email
            };
            if (!string.IsNullOrEmpty(uid) && !string.IsNullOrEmpty(token))
            {
                token = token.Replace(' ', '+');
              var result = await  _accountrepository.ConfirmEmailAsync(uid, token);
                if (result.Succeeded)
                {
                    model.EmailVerified = true;
                }

            }
            return View(model);
        }

        [HttpPost("confirm-email")]
        public async Task<IActionResult> ConfirmEmail(EmailConfirmModel model)
        {
            var user = await _accountrepository.GetUserByEmailAsync(model.Email);
            if (user != null)
            {
                if (user.EmailConfirmed)
                {
                    model.EmailVerified = true;
                    return View(model);
                }
                await _accountrepository.GenerateEmailConfirmationTokenAsync(user);
                model.EmailSent = true;
                ModelState.Clear();
            }
            else
            {
                ModelState.AddModelError("", "Something Went wronmg");
            }
            return View(model);

        }
    
        [AllowAnonymous, HttpGet("forgot-password")]
        public IActionResult ForgotPassword()
        {
            return View();
        }
        [AllowAnonymous, HttpPost("fotgot-password")]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                // code here
                var user = await _accountrepository.GetUserByEmailAsync(model.Email);
                if (user != null)
                {
                    await _accountrepository.GenerateForgotPasswordTokenAsync(user);
                }

                ModelState.Clear();
                model.EmailSent = true;
            }
            return View(model);
        }

        [AllowAnonymous, HttpGet("reset-password")]
        public IActionResult ResetPassword(string uid, string token)
        {
            ResetPasswordModel resetPasswordModel = new ResetPasswordModel
            {
                Token = token,
                UserId = uid
            };
            return View(resetPasswordModel);
        }

        [AllowAnonymous, HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                model.Token = model.Token.Replace(' ', '+');
                var result = await _accountrepository.ResetPasswordAsync(model);
                if (result.Succeeded)
                {
                    ModelState.Clear();
                    model.IsSuccess = true;
                    return View(model);
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
            }
            return View(model);
        }


    }
}
