using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace token_generator.Controllers
{
    [Route("api/token")]
    public class TokenController : Controller
    {
        [HttpGet]
        public dynamic Get()
        {
            return new
            {
                Guid = Guid.NewGuid().ToString(),
                Expires = DateTime.UtcNow.AddHours(1),
                Issuer = Environment.MachineName
            };
        }   
    }
}