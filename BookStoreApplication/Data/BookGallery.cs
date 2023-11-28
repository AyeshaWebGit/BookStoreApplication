using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Data
{
    public class BookGallery
    {
  
        public int Id { get; set; }
        public int BookId { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        [ForeignKey("BookId")]
        public Books Book { get; set; }
    }
}
