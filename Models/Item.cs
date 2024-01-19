using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DreamScape.Models
{
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public ItemType Type { get; set; }
        public int? Rarity { get; set; }
        public int? Power { get; set; }
        public int? Speed { get; set; }
        public int? Durability { get; set; }
        public int? Magic { get; set; }
        public string? ImagePath { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }
    }

    public enum ItemType
    {
        Weapon,
        Armor,
        Accessory
    }

}
