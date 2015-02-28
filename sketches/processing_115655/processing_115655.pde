
Car[] cars = new Car[300];

void setup() {
  size(500,500);
  frameRate(60);
  for(int i = 0; i < cars.length; i ++){
    cars[i] = new Car(color(random(255), random(255), random(255)),
    random(width), random(height), random(-10, 10));
  }
}

void draw() {
  background(random(255), random(255), random(255));
  for(int i = 0; i < cars.length; i ++) {
  cars[i].move();
  cars[i].display();
  }
}
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
  rectMode(CENTER);
  fill(100);
  ellipse(xpos+7, ypos+7, 8, 4);
  ellipse(xpos-7, ypos+7, 8, 4);
  ellipse(xpos+7, ypos-7, 8, 4);
  ellipse(xpos-7, ypos-7, 8, 4);
  fill(random(255), random(255), random(255));
  rect(xpos,ypos,20,10);
  }
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    } else if(xpos < 0) {
      xpos = width;
    }
  }
}


