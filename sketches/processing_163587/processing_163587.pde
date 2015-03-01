
int Talla, Edat;
Talla=175;
Edat=20;
float PI;
PI= Talla-100+(Edat/10)*0.9;
println("Per l'edat "+Edat+" i l'alçada "+Talla+" el PI és "+PI);
float Pes;
Pes= 54;
float n=Pes-PI;
float m=PI-Pes;

if (Pes>PI) {println("Aprima't plis tens "+n+ "kg de més" );}
else 
  {if (Pes==PI) {println("Molt bé, estàs al teu pes ideal! Carpe diem baby!");}
else 
  {println("Engreixa't tens "+m+" kg de menys");} 
}

