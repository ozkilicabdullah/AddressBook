using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AddressBook.Models.Dtos
{
    public class PhoneNumberDto
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public int NumberTypeId { get; set; }
        public string Type { get; set; }

        public int Number { get; set; }
    }
}
