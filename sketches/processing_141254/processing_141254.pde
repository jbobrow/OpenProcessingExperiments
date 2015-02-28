
import ddf.minim.*;
 
float x;
float y;
Minim minim;
AudioInput input;
 
void setup () {
  size (520, 540);
  smooth();
  stroke (255, 75);
  noFill ();
   
  x = 0;
  y = 70;
   
  // Audiotoolkit anlegen
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
  background (0);
}
 
void draw () {
  // KreisgrÃ¶ÃŸe AbhÃ¤ngig von LautstÃ¤rke
  float dim = input.mix.level () * width;
  // Kreis x-Position verschieben
  x += input.mix.level () * 20;
  // Kreis zeichnen
  ellipse (x, y, dim, dim);
   
  if (x > width) {
    x = 0;
    y += 70;
  }
}

