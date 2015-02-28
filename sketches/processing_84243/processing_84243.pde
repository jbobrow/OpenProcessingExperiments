
import ddf.minim.*;
 
float x;
float y;
Minim minim;
AudioInput input;
 
void setup () {
  size (500, 500);
  smooth();
  stroke (random(255),random(255),random(255), 35);
  noFill ();
   
  x = 0;
  y = 20;
   
  // Audiotoolkit anlegen
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
  background (0);
}
 
void draw () {
  float sound = input.mix.level () * width;
  ellipse (mouseX, mouseY, sound ,sound);

  if (x > width) {
    x = 0;
    y += 20;
  }
}
