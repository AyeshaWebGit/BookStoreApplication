using BookStoreApplication.Data;
using BookStoreApplication.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Repository
{
    public class BookRepository : IBookRepository
    {
        private readonly BookStoreContext _context = null;

        public BookRepository(BookStoreContext context)
        {
            _context = context;
        }
        public async Task<int> AddNewBook(BookModel model)
        {
            var newBook = new Books()
            {
                Author = model.Author,
                // CreatedOn = DateTime.UtcNow,
                Description = model.Description,
                Title = model.Title,
                LanguageId = model.Language,
                Category = model.Category,
                TotalPages = model.TotalPages,
                // UpdatedOn = DateTime.UtcNow,
                CoverImageUrl = model.CoverImageUrl,
                BookpdfUrl = model.BookPdfUrl
            };

            newBook.bookGallery = new List<BookGallery>();

            foreach (var file in model.Gallery)
            {
                newBook.bookGallery.Add(new BookGallery()
                {
                    Name = file.Name,
                    URL = file.URL
                });
            }

            await _context.Books.AddAsync(newBook);
            await _context.SaveChangesAsync();

            return newBook.Id;

        }

        //public async Task<List<BookModel>> GetAllBooks()
        //{
        //    var books = new List<BookModel>();
        //    var Allbooks = await _context.Books.ToListAsync();
        //    if(Allbooks?.Any() == true)
        //    {
        //        foreach (var book in Allbooks)
        //        {
        //            books.Add(new BookModel()
        //            {
        //                Author = book.Author,
        //                Category=book.Category,
        //                Description = book.Description,
        //                Id=book.Id,
        //                Title = book.Title,
        //                Language = book.LanguageId,
        //              //  LanguageName =!string.IsNullOrEmpty(book.language.Name) ? book.language.Name: string.Empty,
        //                TotalPages = book.TotalPages,
        //                CoverImageUrl = book.CoverImageUrl



        //            });
        //        }
        //    }


        //    return books;
        //}
        public async Task<List<BookModel>> GetAllBooks()
        {
            return await _context.Books
                  .Select(book => new BookModel()
                  {
                      Author = book.Author,
                      Category = book.Category,
                      Description = book.Description,
                      Id = book.Id,
                      Language = book.LanguageId,
                      Title = book.Title,
                      TotalPages = book.TotalPages,
                      CoverImageUrl = book.CoverImageUrl
                  }).ToListAsync();
        }

        public async Task<List<BookModel>> GetTopBooksAsync(int count)
        {
            return await _context.Books
                  .Select(book => new BookModel()
                  {
                      Author = book.Author,
                      Category = book.Category,
                      Description = book.Description,
                      Id = book.Id,
                      Language = book.LanguageId,
                      Title = book.Title,
                      TotalPages = book.TotalPages,
                      CoverImageUrl = book.CoverImageUrl
                  }).Take(count).ToListAsync();
        }
        public async Task<BookModel> GetBookById(int Id)
        {
            return await _context.Books.Where(x => x.Id == Id).Select(book => new BookModel()
            {
                Author = book.Author,
                Category = book.Category,
                Description = book.Description,
                Id = book.Id,
                Title = book.Title,
                Language = book.LanguageId,
                LanguageName = book.language.Name,
                TotalPages = book.TotalPages,
                CoverImageUrl = book.CoverImageUrl,
                Gallery = book.bookGallery.Select(g => new GalleryModel()
                {
                    Id = g.Id,
                    Name = g.Name,
                    URL = g.URL
                }).ToList(),
                BookPdfUrl = book.BookpdfUrl
            }).FirstOrDefaultAsync();



        }
        public List<BookModel> SearchBook(string Title, string authorName)
        {
            return DataSource().Where(x => x.Title.Contains(Title) && x.Author.Contains(authorName)).ToList();
        }

        private List<BookModel> DataSource()
        {
            return new List<BookModel>
            {
                new BookModel() {Id=1,Title="Mvc",Author="Ayesha",Description="The Book Description is mvc",Language=1,TotalPages=140,Category="Programming"},
                new BookModel() {Id=2,Title="c#",Author="nithish" ,Description="The Book Description is c#",Language=2,TotalPages=180,Category="Developer"},
                new BookModel() {Id=3,Title="Asp.net",Author="Noori"  ,Description="The Book Description is Asp.net",Language=3,TotalPages=240,Category="Framework"},
                new BookModel() {Id=4,Title="java",Author="Ram" ,Description="The Book Description is java",Language=4,TotalPages=340,Category="Concept" },
                new BookModel() {Id=5,Title="Azure",Author="raju",Description="The Book Description is Azure" ,Language=5,TotalPages=360,Category="Develops" },
                new BookModel() {Id=6,Title="Php",Author="Ramu",Description="The Book Description is Php" ,Language=6,TotalPages=360,Category="Developer" }
            };
        }
    }
}
