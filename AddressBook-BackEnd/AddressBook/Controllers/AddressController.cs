using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using AddressBook.Models;
using AddressBook.Models.Dtos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AddressBook.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AddressController : ControllerBase
    {
   
        // İlişkili tablolardan verileri eşleştirir 
        public List<Address>  GetAddresses( params Expression<Func<Address, object>>[] includes)
        {
            using (var context = new Context())
            {
                try
                {

                    IQueryable<Address> addresses = context.Set<Address>();
                    foreach (var inc in includes)
                    {
                        addresses = addresses.Include(inc);
                    }


                    return addresses.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        [HttpGet]
        public IEnumerable<AddressDto> Get()
        {
            try
            {
                using (var context = new Context())
                {
                    var model = GetAddresses(x=>x.person,x=>x.City);
                    var AddressList = new List<AddressDto>();
                    //GetAddresses fonksiyonu ile eşleştirilmiş verileri DTO nesnemize atarız ve servis ederiz
                    foreach (var m in model)
                    {
                        var address = new AddressDto();
                        address.Id = m.Id;
                        address.Name = m.person.Name;
                        address.LastName = m.person.LastName;
                        address.CityName = m.City.CityName;
                        address.AddressTitle = m.AddressTitle;
                        address.PersonId = m.PersonId;
                        AddressList.Add(address);
                    }
                    return AddressList;
                }
            }
             catch (Exception)
            {

                throw;
            }
        }

        [HttpGet]
        [Route("{Id}")]

        public IEnumerable<Address> GetByPersonId(int Id)
        {
            
            using (var context = new Context())
            {
                try
                {
                    IQueryable<Address> addresses = context.Address.Where(x=>x.PersonId==Id);
                    return addresses.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        [HttpPost]
        public ActionResult Create([FromBody]Address address)
        {
            using (var context = new Context())
            {
                try
                {
                    context.Address.Add(address);
                    context.SaveChanges();
                    return Ok(address);
                }
                catch (Exception)
                {

                    throw new Exception("Error occured");
                }
            }
    
        }
        [HttpDelete("{AddressId}")]
        public ActionResult Delete(int addressId)
        {
            using (var context = new Context())
            {

           
                try
                {
                    Address record = context.Address.First(x => x.Id == addressId);
                    context.Address.Remove(record);
                    context.SaveChanges();
                    return Ok();
                }
                catch (Exception)
                {

                    throw new Exception("Error occured");
                }
            }
        }

        [HttpPut]
        public ActionResult Update(Address address)
        {
            using (var context = new Context())
            {
                try
                {
                   
                    var record = context.Address.First(x => x.Id == address.Id);
                    record.AddressTitle = address.AddressTitle;
                    record.CityId = address.CityId;
                    context.SaveChanges();
                    return Ok(record);

                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }

}