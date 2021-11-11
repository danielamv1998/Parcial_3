using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Parcial.Models
{
    public class Cama
    {
        // DATOS DE LA CAMA
        [Key]
        public int IdCama { get; set; }
        [Required]
        public int Estado { get; set; }
        [Required]
        public int IdPiso { get; set; }

        // DATOS DEL PACIENTE
        [Required(AllowEmptyStrings = true)]
        public String IdPaciente { get; set; }
        [Required(AllowEmptyStrings = true)]
        public String Nombre { get; set; }
        [Required(AllowEmptyStrings = true)]
        public String FechaHoraIngreso { get; set; }
        [Required(AllowEmptyStrings = true)]
        public String Diagnostico { get; set; }
    }
}
