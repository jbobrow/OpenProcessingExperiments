
Car myCar1;
Car myCar2; 
Car myCar3; 

void setup() {
  size(600,400);
  myCar1 = new Car(); 
  myCar2 = new Car();
  myCar3 = new Car(); 
}

void draw() {
  background(255);
  // Operate Car object.
  myCar1.move(); 
  myCar1.display();
  
  myCar2.move(); 
  myCar2.display();
  
  myCar3.move();
  myCar3.display();
  
    if (myCar1.xpos > width || myCar1.xpos < 0 ||
        myCar2.xpos > width || myCar2.xpos < 0 ||
        myCar3.xpos > width || myCar3.xpos < 0 ){
            myCar1.speed = (myCar1.speed)*-1;
            myCar2.speed = (myCar2.speed)*-1;
            myCar3.speed = (myCar3.speed)*-1;
      }
}
class Car { // Define a class below the rest of the program. made up of variables and fnuctions 
 // Variables.
  float xpos;
  float ypos;
  float speed;
  float r;
  float g;
  float b;
  
  
  Car() { // A constructor.
    xpos = 180 ;
    ypos = random(height);
    speed = random (2,10);
} 
void display() { // Function.
    // The car is just a square
    rectMode(CENTER);
    stroke(0);
    fill(r,g,b);
    rect(xpos,ypos,15,15);
    
    if (xpos > width- 20 || xpos <(width *0)){
    r = (random(255)); 
    g = (random(255));
    b = (random(255));
    }
  }

  void move() { // Function.
    xpos = xpos + speed;
  
    }
  }



