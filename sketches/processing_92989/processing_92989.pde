
//Lauren Lee
//Creative Computing
//Week 7: Class
//3/14/13

Pattern [] glass = new Pattern [170];

void setup () {
  size(500,500);
  background(0);
  smooth();
 noStroke();
  for(int i = 0; i < glass.length; i +=10) {
  float x = random(width);
  float y = random(height);
  glass[i] = new Pattern(x,y);
  }
}

void draw() {
  for (int i = 0; i <glass.length; i+=10) {
  glass[i].move();
  glass[i].display();
  }
}

class Pattern {
  float x;
  float y;
  float speed =4;
  
  Pattern(float startX, float startY) {
  x=startX;
  y=height/2;
  }
  
  void move() {
  x += random(speed);
  y += random(speed);
  if((x>width) || (x<0)) {
    speed = -speed;
  }
  if((y>height) || (y<0)) {
    speed = -speed;
  }
  }
  
  void display() {
  fill(x,y,random(100,200), 30);
  ellipse(x,y,random(5), random(5));
  rect(x,y, random(10), random (10));
  }
  }






