
// Create an array of car objects
Car[] myCars = new Car[100]; 

void setup() {
  // set screen size
  size(600, 600);
  frameRate(20);
  
  // instantiate the array of cars
  for (int i = 0; i < myCars.length; i++) {
    myCars[i] = new Car(color(random(255),random(22),random(22)), 
    random(width), random(height), random(60), random(2));
  }
}

void draw() {
  // set background
  background(255);
  
  // draw cars
  for(int i = 0; i < myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}
class Car {
  // Class variables
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float left;
  
  // Constructors
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, float leftTemp) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    left = leftTemp;
  }
  
  // Draw the car
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 40, 20);
    fill(0);
    ellipse(xpos-8, ypos+8, 7,7);
    ellipse(xpos+8, ypos+8, 7,7);
  }
  
  // Give the car motion
  void drive() { // Default to the right
    if ( left <= 1) {
      xpos = xpos + xspeed;
      if (xpos > width) {
        xpos = 0;
      }
    } else { // Move some to the left
      xpos = xpos - xspeed;
      if (xpos < 0) {
        xpos = width;
      }
    }
  }
}


