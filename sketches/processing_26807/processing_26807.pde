
class Circulo {
 
  float pos1=600;
  float pos2=400;
  float pos3=300;
  float ang=0;
 
  void muestraCirculo () {
   
    float pos1=width/2 + (100 * sin(ang));
    float pos2=width/2 + (100 * cos(ang));

   
    
  noStroke ();
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse (pos1, pos2, 80, 80);
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse (pos1, pos2, 20, 20);
  fill(random(0,255), random(0, 255), random(0, 255));
  ellipse (pos1, pos2, 5, 5);
  
ang+= 0.6;
}

}


