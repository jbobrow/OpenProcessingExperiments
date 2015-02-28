
class Circulo {
  

float pos1=450;
float pos2=150;
float ang=10;
 
void muestraCirculo () {
  

float pos1=width/2 + (100 * sin(ang));
   float pos2=width/2 + (100 * cos(ang));
noStroke ();
fill (random(0,255), random(0, 255), random(0, 255));
ellipse (pos1,pos2,50,50);
ang+= 0.2;
}
 
}

