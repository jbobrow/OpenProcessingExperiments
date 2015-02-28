
class Circulo { 
 
float pos1=250;
float pos2=150;
float ang=0;
 
void muestraCirculo () {
 
float pos1=width/2 - (1 * sin(ang));
   float pos2=width/2 + (30 * cos(ang));
noStroke ();
fill(random (255));
ellipse (pos1, pos2, 20, 20);
ang+= 0.03;
}
 
}


