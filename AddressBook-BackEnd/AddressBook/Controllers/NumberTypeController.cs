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
    public class NumberTypeController : ControllerBase
    {
      
        [HttpGet]
        public IEnumerable<NumberType> Get()
        {

            using (var context = new Context())
            {
                try
                {
                    IQueryable<NumberType> numberTypes= context.NumberType;
                    return numberTypes.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
    }
}