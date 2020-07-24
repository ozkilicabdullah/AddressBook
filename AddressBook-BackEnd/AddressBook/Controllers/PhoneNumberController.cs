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
    public class PhoneNumberController : ControllerBase
    {
        // İlişkili tablolardan verileri eşleştirir 

        public List<PhoneNumber> GetPhoneNumbers(params Expression<Func<PhoneNumber, object>>[] includes)
        {
            using (var context = new Context())
            {
                try
                {

                    IQueryable<PhoneNumber> phoneNumbers = context.Set<PhoneNumber>();
                    foreach (var inc in includes)
                    {
                        phoneNumbers = phoneNumbers.Include(inc);
                    }


                    return phoneNumbers.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        [HttpGet]
        public IEnumerable<PhoneNumberDto> Get()
        {

            try
            {
                var model = GetPhoneNumbers(x => x.person, x => x.numberType);
                var phoneNumbers = new List<PhoneNumberDto>();

                using (var context = new Context())
                    //GetAddresses fonksiyonu ile eşleştirilmiş verileri DTO nesnemize atarız ve servis ederiz

                    foreach (var m in model)
                    {
                        var phoneNumber = new PhoneNumberDto();
                        phoneNumber.Id = m.Id;
                        phoneNumber.Name = m.person.Name;
                        phoneNumber.LastName = m.person.LastName;
                        phoneNumber.Number = m.Number;
                        phoneNumber.NumberTypeId = m.NumberTypeId;
                        phoneNumber.PersonId = m.PersonId;
                        phoneNumber.Type = m.numberType.Type;
                        phoneNumbers.Add(phoneNumber);
                      
                    }
                return phoneNumbers;
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpGet]
        [Route("{Id}")]

        public IEnumerable<PhoneNumberDto> GetByPersonId(int Id)
        {

            using (var context = new Context())
            {
                try
                {
                    var model = GetPhoneNumbers(x => x.person, x => x.numberType).Where(x=>x.PersonId==Id);
                    var phoneNumbers = new List<PhoneNumberDto>();


                        foreach (var m in model)
                        {
                            var phoneNumber = new PhoneNumberDto();
                            phoneNumber.Id = m.Id;
                            phoneNumber.Name = m.person.Name;
                            phoneNumber.LastName = m.person.LastName;
                            phoneNumber.Number = m.Number;
                            phoneNumber.NumberTypeId = m.NumberTypeId;
                            phoneNumber.PersonId = m.PersonId;
                            phoneNumber.Type = m.numberType.Type;
                            phoneNumbers.Add(phoneNumber);

                        }
                         return phoneNumbers;


                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        [HttpPost]
        public ActionResult Create([FromBody]PhoneNumber phoneNumber)
        {
            using (var context = new Context())
            {
                try
                {
                    context.PhoneNumber.Add(phoneNumber);
                    context.SaveChanges();
                    return Ok(phoneNumber);
                }
                catch (Exception)
                {

                    throw new Exception("Error occured");
                }
            }

        }
        [HttpDelete("{phoneNumberId}")]
        public ActionResult Delete(int phoneNumberId)
        {
            using (var context = new Context())
            {


                try
                {
                    PhoneNumber record = context.PhoneNumber.First(x => x.Id == phoneNumberId);
                    context.PhoneNumber.Remove(record);
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
        public ActionResult Update([FromBody]PhoneNumber phoneNumber)
        {
            using (var context = new Context())
            {
                try
                {

                    var record = context.PhoneNumber.First(x => x.Id == phoneNumber.Id);
                    record.Number = phoneNumber.Number;
                    record.NumberTypeId = phoneNumber.NumberTypeId;
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