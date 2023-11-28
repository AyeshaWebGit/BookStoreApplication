using BookStoreApplication.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookStoreApplication.Repository
{
    public interface IBookRepository
    {
        Task<int> AddNewBook(BookModel model);
        Task<List<BookModel>> GetAllBooks();
        Task<BookModel> GetBookById(int Id);
        Task<List<BookModel>> GetTopBooksAsync(int count);
        List<BookModel> SearchBook(string Title, string authorName);
    }
}