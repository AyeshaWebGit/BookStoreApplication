using BookStoreApplication.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
       


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
          
        }

        public IActionResult Index()
        {
            //  var obj = new { Id = "1", Name = "Ayesha" };
            // return View(obj);
            // return View("AboutUs");
            // return View("AboutUs",Obj);

            // return View("~/TempView/TestTempView.cshtml");
            // return View("../../TempView/TestTempView");

            ViewBag.title ="Test";
            return View();
        }
        [Route("About-us")]
       [Route("About-us/{id?}")]
        public ViewResult AboutUs()
        {
            return View();
        }
        [Route("Contact-us")]
        [Authorize(Roles ="admin")]
        public ViewResult ContactUs()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
