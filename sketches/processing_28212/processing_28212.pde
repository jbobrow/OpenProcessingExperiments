
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
  fill(random(130),random(200),random(100), dim);
  rect (x, y+200, dim, dim-mouseX*400, 0,0,0,0);
  
 
  if (x > width) {
    x = 0;
    y += 0;
  }
}





