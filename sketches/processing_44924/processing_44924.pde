
import ddf.minim.*;
Minim minim;
AudioPlayer song;
PImage b,c;
float x=150;
float y=0;
float dy=.5;

void setup()
{
  size(625,625);
}

void draw()
{
  background(255);
    stroke(255);
    line(150,0,150,150);
        stroke(0);
b = loadImage("dynamite.jpg");
  image(b,90,120);
    line(x,y,150,150);
    y+=dy;
  if (y>=150) {
  c= loadImage("boom.jpg");
  image(c,0,0);
  }
  if (y==150) {
   minim = new Minim(this);
  song = minim.loadFile("BOOM.mp3");
  song.play(); 
  }
}
void keyPressed()
{
  if (key=='r')
  y=0;
  else if (key=='g')
  minim = new Minim(this);
  song = minim.loadFile("GOLD.mp3");
  song.play(); 
}

