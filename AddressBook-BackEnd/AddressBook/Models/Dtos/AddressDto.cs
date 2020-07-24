using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AddressBook.Models.Dtos
{
    public class AddressDto
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string AddressTitle { get; set; }
        public int CityId { get; set; }
        public string CityName { get; set; }

    }
}
