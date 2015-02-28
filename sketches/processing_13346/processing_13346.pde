
///Code initialisation
int MAX_BEATS = 700;// number of max beats that can be drawn on the screen
int numbeats = 0;
int p= 0; // integer setting for p=0 which represents the stroke wheight
import processing.opengl.*;//USING OPEN GL FOR IMPORTING THE NIGHT CITY BACKGROUND IN TO MY SKETCH
PImage img;// image importer
Pulse pulses[] = new Pulse[MAX_BEATS];
class Pulse {
  
  int SCALE = 30; //defines the scale of ellipse which represents the pulse
  int x;    // this defines the pulse in the x direction
  int y;    // this defines the pulse in the y direction
  float s;  // size of the pulse
  Pulse(int pulseX, int pulseY) {
    x = pulseX; 
    y = pulseY;

  }

  void draw() { // this draws the pulse and changes its scale
    fill(250,240,33,150);
    ellipse(x, y, cos(s)*SCALE, cos(s)*SCALE);
    s += -0.2;// defines the speed of the pulse
  }
}
///Main setup
void setup() {
size(740,335,OPENGL);//sets the size of the screen
  smooth(); //the transition of pulses appear smooth with this setup
   img = loadImage("sydney_nt.jpg");//image file loader
strokeWeight(p=20);//represent the thickeness of the rim around the ellipse.
 
stroke(155,80,200,98); //color for the rim around the ellipse
}

 ///Drawing Setup
void draw() {
  image(img, 0, 0, width, height);//setting the sydney image to spread along the setup size of the screen


  for (int i=0; i < numbeats; i++) {// this command draws all the pulses
    pulses[i].draw(); 
  }
}

void mousePressed() { // adds a pulse when mouse button is clicked
  addPulse(mouseX, mouseY); 
}

void keyPressed() {
  if (key == 32) {  //PRESS THE SPACEBAR TO CLEAR THE SCREEN//
    numbeats = 0;
  } 
}

void addPulse(int newX, int newY) {//this adds extra pulses whenever the mouse is clicked
  if (numbeats < MAX_BEATS) {
    pulses[numbeats] = new Pulse(newX, newY);
    numbeats++;
  }
}








