using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace token_generator.Controllers
{
	public class ValuesController : ApiController
	{
		// GET api/values
		
	
		public string Get ()
		{
			return System.Guid.NewGuid().ToString();
		}

		// POST api/values
		public void Post([FromBody] string value)
		{
		}

		// PUT api/values/5
		public void Put(int id, [FromBody] string value)
		{
		}

		// DELETE api/values/5
		public void Delete(int id)
		{
		}
	}
}
