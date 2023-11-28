using Microsoft.EntityFrameworkCore.Migrations;

namespace BookStoreApplication.Migrations
{
    public partial class addednewColumPdf : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "BookpdfUrl",
                table: "Books",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BookpdfUrl",
                table: "Books");
        }
    }
}
