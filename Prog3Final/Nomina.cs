//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Prog3Final
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Nomina
    {
        [Key]
        public int id { get; set; }

        [Range(2019,2100, ErrorMessage = "Ingrese un año valido")]
        public int Año { get; set; }

        [Range(1, 12, ErrorMessage = "Ingrese un mes valido")]
        public int Mes { get; set; }
        
        [Required(ErrorMessage ="No hay un monto exacto para exportar")]
        public decimal MontoTotal { get; set; }
    }
}
