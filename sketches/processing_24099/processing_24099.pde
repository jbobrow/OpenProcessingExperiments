
PImage b;
import ddf.minim.*;
Minim minim;
AudioSample kick;

void setup() {
  cursor(CROSS);
  size(800, 600);
  smooth();
  b = loadImage("wall.jpg");
  image(b, 0, 0);
  
     minim = new Minim(this);
  kick = minim.loadSample("spray2.wav", 2048);
}

void draw() {
  
  stroke(118,6,2,200);
  if(mousePressed) {
    variableLine(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void variableLine(float x, float y, float px, float py) 
{
  float speed = abs(x-px) + abs(y-py);
stroke(118,6,2);
strokeWeight(speed/2);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mousePressed()
{
 if(mouseX > 0 ) {
    kick.trigger();
  }
}

void keyReleased()
{
  if ( keyCode == 32) {
    b = loadImage("wall.jpg");
  image(b, 0, 0);
}
}

void stop()
{
   kick.close();
  minim.stop();
  
  super.stop();
}

