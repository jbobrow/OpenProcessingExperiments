
//Nathan Trevino
//Sept 6 2011
//EMS2

int lastX = 200; //last x value
int lastY = 200; //last y value

void setup() {

  // setup stuff
  size (400, 400);
  stroke(255);
  background(192, 64, 0);
  smooth();
  frameRate(2);
 
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
  rect(randomX, randomY, randomW, randomH);
}
  //creates lines at mouse point when clicked
void mousePressed() {
  line(lastX, lastY, mouseX, mouseY);
  lastX = mouseX;
  lastY = mouseY;
}
