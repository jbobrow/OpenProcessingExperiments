
int Talla, Edat;

Talla = 176;
Edat = 21;

float PI, Pes, Diferencia;

PI = Talla - 100 + (Edat/10) * 0.9;
Pes = 77.89;
Diferencia = abs(PI - Pes);


println("Per l'edat " +Edat+" i l'alçada " +Talla+ " PI és " +PI +" kg");
if(PI>Pes) {
  println("El seu metge li recomana que s'engreixi " + Diferencia + " kg"); }
else{
  if(Pes == PI){println("Continua així!");}
  else{println("El seu metge li recomana que s'aprimi " + Diferencia + " kg");}
}

  

