
float x = 0;
float y = 0;
float xspeed = 15;
float yspeed = 12;
boolean hitedge = false;

void setup() {
  background(255);
  size(500,500);
  smooth();
  frameRate(15);
}
void draw() {
  moveBox();
  bounceBox();
  drawBox();
  if (mousePressed == true) {
  fill(random(255),random(255), random(255));
  ellipse(pmouseX,pmouseY,x++,x++);
  }
  strokeWeight(random(10));
  stroke(random(255), random(255), random(255), random(255));
  line(500,500,pmouseX,pmouseY);
}

void moveBox() {
  x = x + xspeed;
  y = y + yspeed;
}

void bounceBox() {
  if(x > width || x < 0) {
    xspeed = xspeed * -1;
    hitedge = true;
  }
  if(y > height || y < 0) {
    yspeed = yspeed * -1;
    hitedge = true;
  }
}
void drawBox() {
  background(255);
  fill(0);
  rect(x,y,50,50);
} 


  





