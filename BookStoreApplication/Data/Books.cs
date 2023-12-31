﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Data
{
    public class Books
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public int LanguageId { get; set; }
        public string Category { get; set; }
        public string CoverImageUrl { get; set; }
        public string BookpdfUrl { get; set; }
     
        public int TotalPages { get; set; }
        public Language language { get; set; }
        public ICollection<BookGallery> bookGallery { get; set; }
    }
}
