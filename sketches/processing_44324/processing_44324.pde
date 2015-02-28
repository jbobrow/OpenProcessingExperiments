
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  img = loadImage("hands.JPG");
  minim = new Minim(this);
  player = minim.loadFile("washinghands.mp3", 2048);
  player.play();
  size(425,275);
  smooth();
  noStroke();
  background(255);
  frameRate(10);
}
 
void draw() {
image (img,0,0);
tint(0,0,0,0);
int x = mouseX;
int y = mouseY;
fill(#D9FAF8,50);
ellipse(x,y,20,20);
fill(255,10);
ellipse(x,y,40,40);
fill(#CACECE,20);
ellipse(x,y,10,10);

}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

