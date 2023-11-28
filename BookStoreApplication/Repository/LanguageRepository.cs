using BookStoreApplication.Data;
using BookStoreApplication.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication.Repository
{
    public class LanguageRepository : ILanguageRepository
    {
        private readonly BookStoreContext _Context = null;
        public LanguageRepository(BookStoreContext Context)
        {
            _Context = Context;
        }

        public async Task<List<LanguageModel>> GetLanguages()
        {
            return await _Context.Language.Select(x => new LanguageModel()
            {
                Id = x.Id,
                Description = x.Description,
                Name = x.Name
            }).ToListAsync();

        }
    }
}
