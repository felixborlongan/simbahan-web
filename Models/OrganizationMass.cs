﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Models
{
    public class OrganizationMass
    {
        public int Id { get; set; }
        public int ScheduleId { get; set; }
        public int TimeStandardId { get; set; }
        public int OrganizationId { get; set; }
        public string Day { get; set; }
        public string Time { get; set; }
    }
}