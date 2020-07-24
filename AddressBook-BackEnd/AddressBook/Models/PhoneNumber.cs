using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AddressBook.Models
{
    public class PhoneNumber
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public Person person { get; set; }
        public int NumberTypeId { get; set; }
        public NumberType numberType { get; set; }
        public int Number { get; set; }
    }
}
