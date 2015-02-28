
import ddf.minim.*;
 
float x;
float y;
Minim minim;
AudioInput input;
 
void setup () {
  // Sketch einstellen
  size (600, 400);
  smooth();
  stroke (255, 25);
  noFill ();
 
  // Startposition festlegen
  x = 0;
  y = 200;
 
  // Audiotoolkit anlegen
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
  background (0);
}
 
void draw () {
  // Kreisgröße Abhängig von Lautstärke
  float dim = input.mix.level () * width;
  // Kreis x-Position verschieben
  x += input.mix.level () * 200;
  // Kreis zeichnen
  fill(random(100),random(255),random(100), dim*2);
  rect (x, y, dim, dim-mouseX, 0,0,0,0);
  
 
  if (x > width) {
    x = 0;
    y += 0;
  }
}





