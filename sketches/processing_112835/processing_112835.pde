
// declare objects of the Car class
Car myCar1;
Car myCar2; 

void setup() {
  size(200,200);
  
  // initialise the objects.
  // pass parameters to constructor
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,1);
}

void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
}

// create the class
// one class, multiple objects
class Car { 
  color c;
  float xPos;
  float yPos;
  float xSpeed;

  // The Constructor is defined with arguments.
  // Create temp varibales that are used within the function.
  Car(color temp_c, float temp_xPos, float temp_yPos, float temp_xSpeed) { 
    c = temp_c;
    xPos = temp_xPos;
    yPos = temp_yPos;
    xSpeed = temp_xSpeed;
  }

  // show the object on the screen
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xPos,yPos,20,10);
  }

  // move object on the screen
  // use realistic and sensible names
  void drive() {
    xPos = xPos + xSpeed;
    if (xPos > width) {
      xPos = 0;
    }
  }
}



