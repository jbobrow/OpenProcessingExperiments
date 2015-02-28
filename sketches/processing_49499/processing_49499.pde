
float xspeed = 10;
float yspeed = 10;
float x = 50;
float y = 50;

void setup() {
  size(400, 400);
  smooth();
  ellipseMode(CENTER);
}

void draw() {
 
  background(150, 40, 100);
  
  drawCircle();  
  moveCircle();
  checkCollisions();
  
}

void moveCircle(){
  if (x > 375) {
    xspeed = -xspeed;
  } 
  else if (x < 25) {
    xspeed = -xspeed;
  }

  if (y > 375) {
    yspeed = -yspeed;
  } 
  else if (y < 25) {
    yspeed = -yspeed;
  }
  
}

void drawCircle(){
  noStroke ();
  fill (0, 150, 255);
  ellipse (x, y, 50, 50);
}

void checkCollisions(){
  x += xspeed;
  y += yspeed;
}

void mousePressed() {
  xspeed = random (-10, 20);
  yspeed = random (20, -10);
}

