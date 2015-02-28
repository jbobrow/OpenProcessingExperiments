
Car car1;
Car car2; 
Car car3;

color randomColor = (255);
float randomSpeed;

void setup() {
  size(200,200);
  car1 = new Car(randomColor,0,100,random(1,5));
  car2 = new Car(randomColor,0,10,random(1,5));
  car3 = new Car(randomColor,0,50,random(1,5));
}

void draw() {
  background(150);
  car1.move();
  car1.display();
  car2.move();
  car2.display();
  car3.move();
  car3.display();
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
    if (xpos > width || xpos < 0) {
      xspeed *= -1;
      c = color (random(255),random(255),random(255));
    }
  }
}


