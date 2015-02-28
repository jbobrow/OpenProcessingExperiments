
import ddf.minim.*;

Minim minim;
AudioPlayer player;


void setup() {
  size (400, 400, P3D);
  background (0);
  smooth();
  minim = new Minim(this);
   player = minim.loadFile("rawr.mp3");
  
}
void draw () {
  rect(50, 50, 300, 300);
  if (mousePressed) player.play();
  if (mousePressed) fill(255,0,0);
 
}



