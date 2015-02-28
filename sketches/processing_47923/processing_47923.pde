
import ddf.minim.*;
 
Minim minim;
AudioPlayer player;
  
float x;
float y;
 
void setup () {
  // Sketch einstellen
  size (800, 150);
  smooth();
  noFill ();
  stroke (255, 25);
  background (0);
 
  // Startposition festlegen
  x = 0;
  y = 75;
 
   // Audiodatei laden und abspielen
  minim = new Minim (this);
  player = minim.loadFile ("bottom.mp3");
  player.play ();
}
 
void draw () {
  float dimension = player.mix.level () * width;
  // Recheck x-Position verschieben
  x += player.mix.level () * 10;
  // Rechteck zeichnen
  rect (x, y-dimension/2, dimension, dimension);
 
  if (x > width) {
    x = 0;
    y += 40;
  }
}

