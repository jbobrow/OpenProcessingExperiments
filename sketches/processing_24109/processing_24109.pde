
import ddf.minim.*;
PImage b;

float x=10;
float xa=20;
float xb=30;


Minim minim;
AudioSample kick;
void setup()
{
  size(800, 536);
  frameRate(100);
     minim = new Minim(this);
  kick = minim.loadSample("wind.wav", 2048);
}

void draw()
{
background(0);
  b = loadImage("end.jpg");
  image(b, 0, 0);
  fill(0,0);
  stroke(118,6,21, 200);
  strokeWeight(10);
  smooth();
  
  bezier(400, height, mouseX, mouseY, mouseX, mouseY+xb, mouseX+x, mouseY+xa);
  bezier(400, height, mouseX, mouseY, mouseX, mouseY+mouseX, mouseX-xa, mouseY-x);
    bezier(400, height, mouseX, mouseY, mouseX+xb, mouseY+xa, mouseX-x, mouseY+xb);
  bezier(400, height, mouseX, mouseY, mouseX, mouseY-xb, mouseX+xa, mouseY-x);
      bezier(400, height, mouseX, mouseY, mouseX, mouseY+mouseX, mouseX+x, mouseY+x);
  bezier(400, height, mouseX, mouseY, mouseX+xb, mouseY+mouseX, mouseX-xa, mouseY-xb);
      bezier(400, height, mouseX, mouseY, mouseX, mouseY+x++, mouseX-xb, mouseY+xb);
  bezier(400, height, mouseX, mouseY, mouseX, mouseY-xa, mouseX+x, mouseY-x);
      bezier(400, height, mouseX, mouseY, mouseX+xb, mouseY+mouseX, mouseX+xa, mouseY+x);
  bezier(400, height, mouseX, mouseY, mouseX, mouseY+mouseX, mouseX-xa, mouseY-x);
 }
 
 void mousePressed() {kick.trigger(); x++; xa++; xb++;}
  void mouseReleased() {x=10; xa=20; xb=30;}

