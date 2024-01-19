using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DreamScape.Models
{
    public class ItemOffering
    {
        public int Id { get; set; }
        public int ItemId { get; set; }
        public virtual Item Item { get; set; } // Reference to the Item being sold.
        public int SellerUserId { get; set; }
        public virtual User? Seller { get; set; } // Reference to the User selling the item.
        public OfferStatus Status { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }
        public virtual ICollection<Bid> Bids { get; set; } // List of bids for this offering.
    }

    public enum OfferStatus
    {
        Open,
        Closed
    }
}

