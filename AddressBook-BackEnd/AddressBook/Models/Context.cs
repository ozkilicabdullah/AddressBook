using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AddressBook.Models
{
    public class Context:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=desktop-t0opshs; Database=AdresDefteri; Trusted_Connection=true");
            }
        }
        public Context()
        {
        }

        public Context( DbContextOptions<Context>options):base (options)
        {
          
        }
        public DbSet<Address> Address { get; set; }
        public DbSet<City> City { get; set; }
        public DbSet<Person> Person{ get; set; }
        public DbSet<PhoneNumber> PhoneNumber{ get; set; }
        public DbSet<NumberType> NumberType{ get; set; }
    }
}
