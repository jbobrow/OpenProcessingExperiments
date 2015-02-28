
// Example: 50 cars!
Car[] cars = new Car[50];


void setup() {
  size(500,400);
  for (int i = 0; i < cars.length; i++)
  {
  cars[i] = new Car(color((i*50),0,0),random(width),random(height),random(5)); 
  } 
}

void draw() {
  background(255);
  for (int i = 0; i < cars.length; i++)
  {
  cars[i].drive();
  cars[i].display();
  } 

}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
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

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
