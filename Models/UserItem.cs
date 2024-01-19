using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DreamScape.Models
{
    public class UserItem
    {
        public int UserId { get; set; }
        public virtual User User { get; set; }
        public int ItemId { get; set; }
        public virtual Item Item { get; set; }
        public int Amount { get; set; }
    }
}
