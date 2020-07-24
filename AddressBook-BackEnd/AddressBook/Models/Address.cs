using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AddressBook.Models
{
    public class Address
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public Person person { get; set; }
        public City City { get; set; }

        public string AddressTitle { get; set; }
        public int CityId { get; set; }
    }
}
