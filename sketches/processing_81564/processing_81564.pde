
import ddf.minim.*;
PImage img;
PImage bg;
AudioPlayer player;
Minim minim;
float rot = PI/3;
int x = 100;
int y = 100;

void setup()
{
  size(550, 550);
  smooth();
  bg = loadImage("TOILET.jpg");
  img = loadImage("TOILET.png");
  noStroke();
  minim=new Minim(this);
  player=minim.loadFile("flush.mp3");
}
void draw () {
  background(bg);
 translate(110, 185);
  rotate (mousePressed?-3*QUARTER_PI:0);
 
  imageMode(CENTER);
  image(img, 0, 0, 120, 51);

  if (mousePressed==true){
    // click to stop music
    player.play();
  }
}






