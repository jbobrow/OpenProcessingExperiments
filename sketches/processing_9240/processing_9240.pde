
//http://processingjs.org/
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

void setup() {
  size(500,500);
  strokeWeight(10);
  frameRate(15);
  X = width /2;
  Y = height /2;
  nX = X;
  nY = Y;
}

//main loop 
void draw() {
  
  radius = radius + sin( frameCount / 4);
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  background(100);
  
  fill (0,121,84);
  
  stroke(255);
  
  ellipse( X, Y, radius, radius);
}

void mouseMoved () {
  nX = mouseX;
  nY = mouseY;
}

