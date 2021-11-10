using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Parcial.Data;
using Parcial.Models;

namespace Parcial.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CamasController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CamasController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Camas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cama>>> GetCama()
        {
            return await _context.Cama.ToListAsync();
        }

        // GET: api/Camas/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Cama>> GetCama(int id)
        {
            var cama = await _context.Cama.FindAsync(id);

            if (cama == null)
            {
                return NotFound();
            }

            return cama;
        }

        // PUT: api/Camas/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCama(int id, Cama cama)
        {
            if (id != cama.IdCama)
            {
                return BadRequest();
            }

            _context.Entry(cama).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CamaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Camas
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Cama>> PostCama(Cama cama)
        {
            _context.Cama.Add(cama);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCama", new { id = cama.IdCama }, cama);
        }

        // DELETE: api/Camas/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCama(int id)
        {
            var cama = await _context.Cama.FindAsync(id);
            if (cama == null)
            {
                return NotFound();
            }

            _context.Cama.Remove(cama);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CamaExists(int id)
        {
            return _context.Cama.Any(e => e.IdCama == id);
        }
    }
}
