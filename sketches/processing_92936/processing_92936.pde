
// Krystofer Dongjae Kim
// Creative Computing
//March 13 

Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;


void setup() {
  size(800, 400);
  background(255);
  myCar1 = new Car(color(random(255)), 0, 300, 1); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(random(255)), width, 10, 2);
  myCar3 = new Car(color(random(255)), width/2, 180, 3);
  myCar4 = new Car(color(random(255)), width-10, 70, 4);
  myCar5 = new Car(color(random(255)), 0, 370, 5);
}

void draw() {
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
  myCar5.move();
  myCar5.display();
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
  color fill;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    fill = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    noStroke();
    fill(fill);
    rectMode(CENTER);
    rect(xpos, ypos, 10, 500);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width || xpos < 0) {
      xspeed *= -1;
    }
  }
}



