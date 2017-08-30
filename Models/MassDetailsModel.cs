﻿using System;

namespace SimbahanApp.Models
{
    public class MassDetailsModel
    {
        public int Id { get; set; }
        public int TimeStandardId { get; set; }
        public DateTime DateCreated { get; set; }
        public string Time { get; set; }
        public string Language { get; set; }
        public int ScheduleId { get; set; }
        public string Days { get; set; }
    }
}