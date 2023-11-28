using BookStoreApplication.Data;
using BookStoreApplication.Helpers;
using BookStoreApplication.Models;
using BookStoreApplication.Repository;
using BookStoreApplication.Service;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApplication
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<BookStoreContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
            services.AddIdentity<ApplicationUser, IdentityRole>().AddEntityFrameworkStores<BookStoreContext>().AddDefaultTokenProviders();
            services.Configure<IdentityOptions>(Options =>
            {
                Options.Password.RequiredLength = 5;
                Options.Password.RequiredUniqueChars = 1;
                Options.Password.RequireDigit = false;
                Options.Password.RequireLowercase = false;
                Options.Password.RequireNonAlphanumeric = false;
                Options.Password.RequireUppercase = false;

                Options.SignIn.RequireConfirmedEmail = true;
                Options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(10);
                Options.Lockout.MaxFailedAccessAttempts = 3;
            });

            services.Configure<DataProtectionTokenProviderOptions>(options =>
            {
                options.TokenLifespan = TimeSpan.FromDays(1);
            });
            services.ConfigureApplicationCookie(config =>
            {
                config.LoginPath = Configuration["Application:LoginPath"];
            });
            services.AddControllersWithViews();
            services.AddRazorPages().AddRazorRuntimeCompilation();
            services.AddScoped<IBookRepository, BookRepository>();
            services.AddScoped<ILanguageRepository, LanguageRepository>();
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IEmailService, EmailService>();
            services.AddScoped<IUserClaimsPrincipalFactory<ApplicationUser>,ApplicationUserClaimsPrincipalFactory>();
            services.Configure<SMTPConfigModel>(Configuration.GetSection("SMTPConfig"));
            services.AddSingleton<IMessageRepository, MessageRepository>();
            services.Configure<NewBookAlertConfig>("InternalBook",Configuration.GetSection("NewBookAlert"));
            services.Configure<NewBookAlertConfig>("ThirdPartBook",Configuration.GetSection("ThridPartyBook"));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            //app.UseStaticFiles(new StaticFileOptions()
            //{
            //    FileProvider= new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "MyStaticfiles")),
            //    RequestPath= "/MyStaticfiles"
            //});
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapDefaultControllerRoute();
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Book}/{action=Index}/{id?}");

                //endpoints.MapControllerRoute(
                //   name: "MyArea",
                //   pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

            });
        }
    }
}
