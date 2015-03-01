
int [ ]      Edad = {19, 20, 20, 19, 21, 20}; //Declaració + inicialització
int [ ]      Altura = {167, 174, 169, 173, 182, 168};
float [ ]    PR = {52, 73, 55, 60, 62, 70};
float [ ]    PI = new float [6];
float [ ]    DP = new float [6];
float Perder, Ganar;  


for (int i=0; i<6; i++)
  {
    PI [i] = Altura [i] - 100 + (Edad [i]/10) * 0.9;
    DP [i] = abs (PI [i] - PR [i]);
    
      println (i + "Para la edad de "+ Edad [i] +" años y la altura de "+ Altura [i] +" centímetros el PI es "+ PI[i]);
      
        Perder = PR [i] - PI [i]; 
        Ganar = PI [i] - PR [i];
    
          if (PR [i] > PI [i]) {println ("Por tu salud es necesario que pierdas " + Perder);} 
          else           {if (PR [i] == PI [i]) println ("Éstás en tu peso ideal"); 
             else             println ("Es importante que ganes "+ Ganar);} 
  }

  
