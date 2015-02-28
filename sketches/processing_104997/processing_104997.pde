
int x;
int y;
int xSpeed;
int ySpeed;

void setup() {
  size(800, 600);

  fill(18, 182, 255, 128); //transparent blue

  // start ball in top left
  x = 0;
  y = 0;
  //set initial speed
  xSpeed = 10;
  ySpeed = 10;
}

void draw() {
  //  rectangle(width/2, height/2, 200, 200);  
  background(255); // white background

  x = x + xSpeed;
  y = y + ySpeed;

  //right boundary
  if (x >= width) {
    xSpeed  = xSpeed * -1;
  }
  //left boundary
  if (x <= 0) {  
    xSpeed  = xSpeed * -1;
  }
  // top boundary
  if (y >= height) {
    fill(40, 60, 90);
    ySpeed  = ySpeed * -1;
  }
  // bottom boundary
  if (y <= 0) {
    ySpeed  = ySpeed * -1;
  }
  // top boundary

  if (x <= width/2) {
    fill(18, 182, 255);
    ellipse(x, y, 100, 100);
    ellipse(x, y, 150, 150);
    //this will happen if this is true
  } 
  else {
    fill(18, 182, 255, 128);
    //otherwise do this


    ellipse(x, y, 200, 200);
    fill(18, 182, 255, 110);
    ellipse(x, y, 250, 250);
    fill(18, 182, 255, 90);
    ellipse(x, y, 300, 300);
  }
}
