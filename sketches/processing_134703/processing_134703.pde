
int radius = 40;
float x = -radius;
float speed = 0.8;

void setup() {
  size(500, 300);
  smooth();
  stroke(0, 102);
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  x += speed; //Increase the value of x
  if (x > width+radius) {
    x = -radius;
  }
  arc(x, 60, radius, radius, 0.52, 5.76);
}

void mousePressed() {
  if(mouseX < width/2) //left
  if(mouseY < height/2) // top left
  fill(255, 0, 0); //red
  else //bottom left
  fill(0, 255, 0); //green
  else //right
  if(mouseY < height/2) //top right
  fill(0, 0, 255); //blue
  else //bottom right
  fill(0); //black
  rect(mouseX, mouseY, 10, 10); //shape
}



