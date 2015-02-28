
//Nathan Trevino
//Copyright Nathan Trevino, Carnegie Mellon University
//For use on the Creative Commons
//EMS2

int lastX = 200; //last x value
int lastY = 200; //last y value

void setup() {

  // setup stuff
  size (400, 400);
  stroke(255);
  background(192, 64, 0);
  smooth();
  frameRate(10);
 
}

void draw() {
  
  int randomX;
  int randomY;
  int randomH;
  int randomW;
  
  //generate random size of rect
  randomH = int(random(101));
  randomW = int(random(101));
  
  //gernerate random rect start
  randomX = int(random(400));
  randomY = int(random(400));
  
  //generate random color of rect
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  
  stroke(r, g, b);
  fill (r, g, b);
  arc(randomX, randomY, randomW, randomH, PI, 2*TWO_PI);
}
  

void mousePressed() {
  //variables
  int randomH;
  int randomW;
  
  //generate random size of tri
  randomH = int(random(401));
  randomW = int(random(401));
  
  //awesome triangle thing
  fill(255,255,255);
  triangle(randomH, randomW, mouseX+100, mouseY+28, mouseX, mouseY);
  lastX = mouseX;
  lastY = mouseY;
}
