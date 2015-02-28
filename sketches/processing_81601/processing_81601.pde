
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/42428*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**********************************************************************
  Pluck the string by holding the mouse down and releasing.
  Adjust the speed, damping, and number of harmonics of the simulation.
  The equation for this simulation is due to:
  http://www.oberlin.edu/faculty/brichard/Apples/StringsPage.html
***********************************************************************/
   
import controlP5.*;
import ddf.minim.*;//declare
AudioPlayer player;
Minim minim;

ControlP5 controlP5;
final float PI_SQUARED = PI*PI;
boolean plucked = false;
int t = 0;        // time since pluck
int m_tot = 10;   // harmonics - each harmonic requires more computation
float c = 100;    // speed
float amp = 0;    // amplitude
float d;          // x position of pluck
float damp = 1.1; // damping constant

PImage img0;
PImage img1; 

void setup() {
  img0 = loadImage ("guitar.jpg");
  img1 = loadImage ("guitarpick.png");
  size(470, 350, P2D);
  strokeWeight(4);
  smooth();
  controlP5 = new ControlP5(this);
  controlP5.setColorLabel(0);
   minim=new Minim(this);
 player=minim.loadFile("guitar.wav");
  
  
}

void draw() {
   if (mousePressed==true){// click to play music
  player.play();
   }
  noCursor();
  image(img0, 0, 0);
  noFill();
  stroke(0);
    if (plucked) {
    t++;
    amp/= damp;
  }
  image(img1, mouseX-50, mouseY-50, 100, 100);
  float w = PI*(c/width);
  beginShape();
  if (plucked) {
    for (int x = 0; x < width; x += 5) {
      float sum = 0;
      for (int m = 1; m <= m_tot; ++m)
        sum += (1.0/(m*m)*sin((m*PI_SQUARED*d)/width)*sin((m*PI*x)/width)*cos(m*w*t));
      float y = (1.5*amp*width*width)/(PI_SQUARED*d*(width - d))*sum;
      y += height/2;
      vertex(x, y);
    }
  } 
  else {
    vertex(0, height/2);
    vertex(d, height/2 + amp);
    vertex(width - 5, height/2);
  }
  endShape();
  controlP5.draw();  // we need to manually draw controlP5 when using P2D
}

void mousePressed() {
  if (!controlP5.window().isMouseOver()) {
    plucked = false;
    t = 0;
    amp = mouseY - height/2;
    d = mouseX;
  }
}

void mouseDragged() {
  if (!controlP5.window().isMouseOver()) {
    d = mouseX;
    amp = mouseY - height/2;
  }
}

void mouseReleased() {
  plucked = true;
}

void damp(float value) { damp = value; }
void c(float value) { c = value; }
void m_tot(float value) { m_tot = (int)value; }

