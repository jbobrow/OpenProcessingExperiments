

float dateToRad(String date) {
 
   // Calcs the date to radiant
   // 2*PI rad = 360° = 12 Monate
   // PI       = 180° =  6 Monate
   // PI / 6   =  30° =  1 Monat

   // 2*PI / 365.25 = 1 Tag
   //
   
   int[] zeitangaben = int(split(date, "-"));
   zeitangaben[1] = zeitangaben[1] - 1;
   zeitangaben[2] = zeitangaben[2] - 1;
   
   // don't use the year ([0]
   // =======================
   // eg: 2011-07-01
   // = radiant = 06 * PI / 6 + 0 * 2 * PI / 365.25; = 3.158
   // eg: 2011-01-01
   // = radiant = 00 * PI / 6 + 0 * 2 * PI / 365.25; = 0
   
   float radiant = zeitangaben[1] * PI / 6 + zeitangaben[2] * 2 * PI / 365.25;
  
  return radiant;
}

