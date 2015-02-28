
// loading up images, sound and variables
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
float y = 470;
float x = 230;


//image, sound are imported

void setup() {
  img = loadImage("underwater.jpg");
  size(700, 525, P2D);
  image(img, 0, 0);
  noStroke();
  frameRate(10);
  smooth();
  ellipseMode(CENTER);
  minim = new Minim(this);
  player = minim.loadFile("underwater.mp3");
  player.play();
  loop();

}
// circles will be drawn from this area
  void draw() {
  fill(255, 50);
 
ellipse(x, y, random(30), random(30));
y -= 10;


 
}


void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
  



