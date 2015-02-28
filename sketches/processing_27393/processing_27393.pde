
Car[] carzzz = new Car[10];

void setup() {
  size(200,200);
  for (int i = 0; i < carzzz.length; i++) {
    carzzz[i] = new Car(color(random(50,120), random(150,220), random(150,255)),0,(i*20)+10,random(1,4));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < carzzz.length; i++){
    carzzz[i].display();
    carzzz[i].move();
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
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

