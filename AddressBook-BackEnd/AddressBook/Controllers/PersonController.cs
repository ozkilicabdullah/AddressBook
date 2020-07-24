using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;

namespace AddressBook.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<Person> Get()
        {

            using (var context = new Context())
            {
                try
                {
                    IQueryable<Person> persons = context.Person;
                    return persons.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        [HttpPost]
        public ActionResult Create([FromBody]Person person)
        {
            using (var context = new Context())
            {
                try
                {
                    context.Person.Add(person);
                    context.SaveChanges();
                    return Ok(person);
                }
                catch (Exception)
                {

                    throw new Exception("Error occured");
                }
            }


        }
        [HttpDelete("{personId}")]
        public ActionResult Delete(int personId)
        {
            using (var context = new Context())
            {


                try
                {
                    Person record = context.Person.First(x => x.Id == personId);
                    context.Person.Remove(record);
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
        public ActionResult Update([FromBody]Person person)
        {
            using (var context = new Context())
            {
                try
                {

                    var record = context.Person.First(x => x.Id == person.Id);
                    record.Name = person.Name;
                    record.LastName = person.LastName;
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