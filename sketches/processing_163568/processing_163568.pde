
int Talla, Edat;
float PI;
float pes;
float n;
float m;


Edat = 20;
Talla = 170;
pes = 50;
PI = Talla - 100 + (Edat/10)*0.9;
n = PI - pes;
m = pes - PI;


println("Per l'edat "+ Edat +" i alçada "+Talla+" el pes ideal es "+ PI +"Kg"); 

if (pes < PI) 
  { println("T'has d'engreixar " + n + "kg"); }
else {
      if (pes > PI) {println("t'has d'aprimar " + m +"kg");}
      else { println("Ja estàs bé"); }
     }

