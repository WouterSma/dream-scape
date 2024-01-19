using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DreamScape.Models
{
    public class Bid
    {
        public int Id { get; set; }

        public int BidderId { get; set; }
        public virtual User Bidder { get; set; } // Reference to the User making the bid.

        public int ItemOfferingId { get; set; }
        public virtual ItemOffering ItemOffering { get; set; } // Reference to the ItemOffering being bid on.

        public int BidItemId { get; set; }
        public virtual Item BidItem { get; set; } // Reference to the Item being offered in this bid.

        public BidStatus Status { get; set; } // Status of the bid (e.g., "Pending", "Accepted", "Rejected").

        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? DeletedAt { get; set; } // Nullable for soft delete.
    }
    public enum BidStatus
    {
        Pending,
        Accepted,
        Rejected
    }
}
