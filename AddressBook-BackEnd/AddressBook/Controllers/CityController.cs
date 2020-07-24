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
    public class CityController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<City> Get()
        {

            using (var context = new Context())
            {
                try
                {
                    IQueryable<City> cities = context.City;
                    return cities.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
    }
}