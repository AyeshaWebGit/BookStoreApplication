using BookStoreApplication.Models;
using BookStoreApplication.Repository;
using BookStoreApplication.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Controllers
{
    public class BookController : Controller
    {
        private readonly IBookRepository _bookRepository  = null;
        private readonly ILanguageRepository _languageRepository  = null;
        private readonly IWebHostEnvironment _webHostEnvironment;
        //  private readonly IConfiguration _configuration;
        private readonly NewBookAlertConfig _newBookAlertConfig;
        private readonly NewBookAlertConfig _thirdPartyBookAlertConfig;
        private readonly IMessageRepository _messageRepository;
        private readonly IUserService _userService;
        private readonly IEmailService _emailService;
        public BookController(IBookRepository bookRepository, ILanguageRepository languageRepository,
            IWebHostEnvironment webHostEnvironment, /*IConfiguration configuration,*/ 
            IOptionsSnapshot<NewBookAlertConfig> newBookAlertConfig, IMessageRepository messageRepository,
            IUserService userService, IEmailService emailService
            )
        {
            _bookRepository = bookRepository;
            _languageRepository = languageRepository;
            _webHostEnvironment = webHostEnvironment;
            // _configuration = configuration;
            _newBookAlertConfig = newBookAlertConfig.Get("InternalBook");
            _thirdPartyBookAlertConfig = newBookAlertConfig.Get("ThirdPartBook");
            _messageRepository = messageRepository;
            _userService = userService;
            _emailService = emailService;
        }

       
        public async Task<IActionResult> Index()
        {

            //UserEmailOptions options = new UserEmailOptions
            //{
            //    ToEmails = new List<string>() { "ayeshachandini25@gmail.com" },
            //    PlaceHolders = new List<KeyValuePair<string, string>>()
            //    {
            //        new KeyValuePair<string, string>("{{username}}","ayesha")
            //    }
            //};
            //await _emailService.SendTestEmail(options);
            //var userId = _userService.GetUserId();
            //var isLoggedIn = _userService.IsAuthenticated();
            //var result = _configuration["AppName"];
            //var key1 = _configuration["infoObj:key1"];
            //var key2 = _configuration["infoObj:key2"];
            //var key3 = _configuration["infoObj:key3:key3obj1"];
            //var newBookAlert = new NewBookAlertConfig();
            //_configuration.Bind("NewBookAlert", newBookAlert);
            //bool isDisplay = _newBookAlertConfig.DisplayNewBookAlert;
            //bool isDisplayThird = _thirdPartyBookAlertConfig.DisplayNewBookAlert;
            //  var value = _messageRepository.GetName();
            return View();
        }
        public async Task<ViewResult>  GetAllBooks()
        {
            var data =await _bookRepository.GetAllBooks();
            return View(data);
        }
        //public string GetBook(int Id)
        //{
        //  return $"Get The Book Id + {Id}";
           
        //}
        public async Task<ViewResult>  GetBook(int Id)
        {
           var data= await _bookRepository.GetBookById(Id);
            return View(data);
        }
        public List<BookModel> SearchBook( string Title,string authorName)
        {
            
            return _bookRepository.SearchBook(Title,authorName);
        }
        //[Authorize]
        public async Task<ViewResult> AddNewBook(bool isSuccess = false,int BookId = 0)
        {
            ViewBag.Languages = new SelectList(await _languageRepository.GetLanguages(), "Id", "Name");
            ViewBag.isSuccess = isSuccess;
            ViewBag.BookId = BookId;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddNewBook(BookModel bookModel)
        {
           if(ModelState.IsValid)
            {
                if(bookModel.CoverPhoto != null)
                {
                    string folder = "books/cover/";
                   bookModel.CoverImageUrl= await UploadImage(folder,bookModel.CoverPhoto);
                }
                if (bookModel.BookPdf != null)
                {
                    string folder = "books/pdf/";
                    bookModel.BookPdfUrl = await UploadImage(folder, bookModel.CoverPhoto);
                }
                if (bookModel.GalleryImages != null)
                {
                    string folder = "books/cover/";
                    bookModel.Gallery = new List<GalleryModel>();
                    foreach (var file in bookModel.GalleryImages)
                    {
                        var gallery = new GalleryModel()
                        {
                        Name=file.FileName,
                        URL = await UploadImage(folder, file),

                    };
                        bookModel.Gallery.Add(gallery);
                    }
                  
                }
                int id = await _bookRepository.AddNewBook(bookModel);
                if (id > 0)
                {
                    return RedirectToAction("AddNewBook", new { isSuccess = true, BookId = id });
                }
            }
            ViewBag.Languages =new SelectList(await _languageRepository.GetLanguages(),"Id","Name");



            ModelState.AddModelError("", "This is my Custom Error message");
            return View();
        }

        private async Task<string> UploadImage(string folderPath, IFormFile file)
        {
      
            folderPath += Guid.NewGuid().ToString() + "_" + file.FileName;
            string serverFolder = Path.Combine(_webHostEnvironment.WebRootPath, folderPath);
          
            await file.CopyToAsync(new FileStream(serverFolder, FileMode.Create));
            return "/" + folderPath;
        }

        private List<LanguageModel> GetLanguage()
        {
            return new List<LanguageModel>()
            {
                new LanguageModel(){Id=1},
                new LanguageModel(){Id=2},
                new LanguageModel(){Id=3}
                
            };
        }

    }
}
