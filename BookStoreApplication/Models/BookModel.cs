using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using BookStoreApplication.Enum;
using Microsoft.AspNetCore.Http;

namespace BookStoreApplication.Models
{
    public class BookModel
    {
        public int Id { get; set; }
        [StringLength(100, MinimumLength =5)]
        [Required (ErrorMessage ="Please Enter Title")]
        public string Title { get; set; }

        [Required(ErrorMessage = "Please Choose Language")]
        public int Language { get; set; }
        public string LanguageName { get; set; }


        //[Required(ErrorMessage = "Please Choose Languages of your Book")]
        //public List<string> MultiLanguage { get; set; }
        public LanguageEnum LanguageEnum { get; set; }

        [Required(ErrorMessage = "Please Enter Author")]
        public string Author { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string Category { get; set; }
       
        [Required]
        [Display(Name = "Total Pages of Book")]
        public int TotalPages { get; set; }
        [Display(Name ="Choose the Cover photo of your book")]
        [Required]
        public IFormFile CoverPhoto { get; set; }

        [Display(Name = "Choose the Gallery Images of your book")]
        [Required]
        public IFormFileCollection GalleryImages { get; set; }
        public string CoverImageUrl { get; set; }
        public List<GalleryModel> Gallery { get; set; }
        [Display(Name = "Upload Book In pdf Format")]
        [Required]
        public IFormFile BookPdf { get; set; }
        public string BookPdfUrl { get; set; }
    }
}
