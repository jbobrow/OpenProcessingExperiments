
// http://processing.org/tutorials/objects/

// Example: Two Car objects
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;

void setup() {
  size(200,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,2,0); 
  myCar2 = new Car(color(0,0,255),0,10,1,0);
  myCar3 = new Car(color(0,255,0),100,0,0,1);
}

void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void drive() {
    
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if (xpos > width) {
      xpos = 0;
    }
    
    
    
    else if (xpos < 0){
     xpos = width; 
    }
    
    else if (ypos < 0){
     ypos = height; 
    }
    
    else if (ypos > height){
     ypos = 0; 
    }
  }
}
