using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic.ApplicationServices;
using Pomelo;

namespace DreamScape.Models
{
    public class AppDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<UserItem> UserItems { get; set; }
        public DbSet<ItemOffering> ItemOfferings { get; set; }
        public DbSet<Bid> Bids { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // Deze lijn uncommenten voor db logs
            optionsBuilder.EnableSensitiveDataLogging();
            var connectionString = "server=localhost;user=root;password=;database=dreamscape";
            var serverVersion = new MySqlServerVersion("8.0.30");

            optionsBuilder.UseMySql(connectionString, serverVersion);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserItem>()
            .HasKey(ui => new { ui.UserId, ui.ItemId });
            // Seed data for Users
            modelBuilder.Entity<User>().HasData(
                new User
                {
                    Id = 1,
                    Username = "admin",
                    Email = "admin",
                    Password = "$2y$10$iYqEwXhP6.jjYaLazEPKr.UUwlnba2EnoeqQ9hZZJU3q2/HWM5686",
                    Role = UserRole.Admin,
                    ImagePath = null,
                    CreatedAt = DateTime.Parse("2023-06-25 18:12:22"),
                    DeletedAt = null
                },
                new User
                {
                    Id = 3,
                    Username = "user",
                    Email = "user",
                    Password = "$2y$10$.Ajcsi6bVAdTKvjJ/0JAGeiwfsc2yvBfaBb8dQbpzb0WkTPiS9ih2",
                    Role = UserRole.User,
                    ImagePath = null,
                    CreatedAt = DateTime.Parse("2023-06-25 18:13:51"),
                    DeletedAt = null
                }
            );

            // Seed data for items
            modelBuilder.Entity<Item>().HasData(
        new Item { Id = 1, Name = "Vlammenzwaard", Description = "Een zwaard doordrenkt met vlammende energie.", Type = ItemType.Weapon, Rarity = 85, Power = 90, Speed = 70, Durability = 80, Magic = 60, ImagePath = "images/vlammenzwaard.png" },
        new Item { Id = 2, Name = "Schaduwkap", Description = "Een mysterieuze kap die de drager in duisternis hult.", Type = ItemType.Armor, Rarity = 40, Power = 20, Speed = 40, Durability = 90, Magic = 50, ImagePath = "images/schaduwkap.png" },
        new Item { Id = 3, Name = "Amulet van Genezing", Description = "Een amulet dat helende krachten bezit.", Type = ItemType.Accessory, Rarity = 15, Power = 10, Speed = 50, Durability = 70, Magic = 90, ImagePath = "images/amulet_van_genezing.png" },
        new Item { Id = 4, Name = "Bliksempistool", Description = "Een vuurwapen dat dodelijke bliksemprojectielen afvuurt.", Type = ItemType.Weapon, Rarity = 80, Power = 70, Speed = 90, Durability = 60, Magic = 30, ImagePath = "images/bliksempistool.png" },
        new Item { Id = 5, Name = "IJzeren Harnas", Description = "Een stevig harnas dat bescherming biedt tegen fysieke aanvallen.", Type = ItemType.Armor, Rarity = 30, Power = 30, Speed = 20, Durability = 100, Magic = 0, ImagePath = "images/ijzeren_harnas.png" },
        new Item { Id = 6, Name = "Ring van Onzichtbaarheid", Description = "Een ring die de drager onzichtbaar maakt voor vijanden.", Type = ItemType.Accessory, Rarity = 90, Power = 0, Speed = 80, Durability = 50, Magic = 50, ImagePath = "images/ring_van_onzichtbaarheid.png" },
        new Item { Id = 7, Name = "Toverstaf van Verwarring", Description = "Een toverstaf die vijanden in verwarring brengt.", Type = ItemType.Weapon, Rarity = 50, Power = 60, Speed = 60, Durability = 50, Magic = 80, ImagePath = "images/toverstaf_van_verwarring.png" },
        new Item { Id = 8, Name = "Drakenschild", Description = "Een schild gemaakt van drakenschubben dat vuuraanvallen absorbeert.", Type = ItemType.Armor, Rarity = 85, Power = 20, Speed = 30, Durability = 90, Magic = 40, ImagePath = "images/drakenschild.png" },
        new Item { Id = 9, Name = "Amulet van Levitatie", Description = "Een amulet waarmee de drager kan zweven.", Type = ItemType.Accessory, Rarity = 60, Power = 10, Speed = 70, Durability = 50, Magic = 70, ImagePath = "images/amulet_van_levitatie.png" },
        new Item { Id = 10, Name = "Zwaard van Licht", Description = "Een zwaard dat stralend licht uitstraalt en duistere wezens schade toebrengt.", Type = ItemType.Weapon, Rarity = 95, Power = 80, Speed = 50, Durability = 70, Magic = 40, ImagePath = "images/zwaard_van_licht.png" },
        new Item { Id = 11, Name = "Kristallen Pantser", Description = "Een pantser gemaakt van glinsterende kristallen dat magische aanvallen afweert.", Type = ItemType.Armor, Rarity = 80, Power = 10, Speed = 40, Durability = 80, Magic = 70, ImagePath = "images/kristallen_pantser.png" },
        new Item { Id = 12, Name = "Amulet van Eeuwig Leven", Description = "Een amulet dat de drager onsterfelijkheid schenkt.", Type = ItemType.Accessory, Rarity = 100, Power = 0, Speed = 60, Durability = 50, Magic = 100, ImagePath = "images/amulet_van_eeuwig_leven.png" },
        new Item { Id = 13, Name = "Giftige Dolk", Description = "Een dolk bedekt met dodelijk gif.", Type = ItemType.Weapon, Rarity = 70, Power = 50, Speed = 90, Durability = 40, Magic = 30, ImagePath = "images/giftige_dolk.png" },
        new Item { Id = 14, Name = "Drakenhuiden", Description = "Een harnas gemaakt van drakenhuid dat vuuraanvallen weerkaatst.", Type = ItemType.Armor, Rarity = 85, Power = 10, Speed = 20, Durability = 90, Magic = 20, ImagePath = "images/drakenhuiden.png" },
        new Item { Id = 15, Name = "Ring van Kracht", Description = "Een ring die de fysieke kracht van de drager vergroot.", Type = ItemType.Accessory, Rarity = 80, Power = 60, Speed = 30, Durability = 40, Magic = 10, ImagePath = "images/ring_van_kracht.png" },
        new Item { Id = 16, Name = "Boog van de Wind", Description = "Een boog die pijlen afvuurt met de kracht van de wind.", Type = ItemType.Weapon, Rarity = 75, Power = 40, Speed = 80, Durability = 50, Magic = 50, ImagePath = "images/boog_van_de_wind.png" },
        new Item { Id = 17, Name = "Schubbenharnas", Description = "Een harnas gemaakt van drakenschubben dat fysieke aanvallen vermindert.", Type = ItemType.Armor, Rarity = 70, Power = 10, Speed = 10, Durability = 100, Magic = 0, ImagePath = "images/schubbenharnas.png" },
        new Item { Id = 18, Name = "Amulet van Wijsheid", Description = "Een amulet dat de wijsheid en kennis van de drager vergroot.", Type = ItemType.Accessory, Rarity = 90, Power = 0, Speed = 40, Durability = 60, Magic = 90, ImagePath = "images/amulet_van_wijsheid.png" },
        new Item { Id = 19, Name = "Vuurzwaard", Description = "Een zwaard dat brandende vuurprojectielen afvuurt.", Type = ItemType.Weapon, Rarity = 50, Power = 70, Speed = 50, Durability = 60, Magic = 30, ImagePath = "images/vuurzwaard.png" },
        new Item { Id = 20, Name = "Betoverde Laarzen", Description = "Laarzen die de snelheid en behendigheid van de drager verhogen.", Type = ItemType.Armor, Rarity = 75, Power = 20, Speed = 90, Durability = 60, Magic = 10, ImagePath = "images/betoverde_laarzen.png" }
    );
        }

    }
}
