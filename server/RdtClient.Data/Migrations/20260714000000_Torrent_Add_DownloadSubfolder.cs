using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using RdtClient.Data.Data;

#nullable disable

namespace RdtClient.Data.Migrations;

[DbContext(typeof(DataContext))]
[Migration("20260714000000_Torrent_Add_DownloadSubfolder")]
public partial class Torrent_Add_DownloadSubfolder : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<string>(
            name: "DownloadSubfolder",
            table: "Torrents",
            type: "TEXT",
            nullable: true);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(
            name: "DownloadSubfolder",
            table: "Torrents");
    }
}
