
Car myCar1;
Car myCar2;
Car myCar3;
int direction = 1;

void setup() {
  size(400,300);
  // Initialize Car object
  myCar1 = new Car(); // Initialize car object in setup() by calling constructor.
  myCar2 = new Car();
  myCar3 = new Car();
}

void draw() {
  background(255);
  // Operate Car object.
  
  myCar1.move(direction); // Operate the car object in draw( ) by calling object methods using the dots syntax.
  myCar1.display();
  myCar2.move(direction); // Operate the car object in draw( ) by calling object methods using the dots syntax.
  myCar2.display();
  myCar3.move(direction); // Operate the car object in draw( ) by calling object methods using the dots syntax.
  myCar3.display();
  
  if (myCar1.xpos > width || myCar1.xpos < 0){ // left and right walls
      direction = -direction;
      myCar1.c = color(random(255),random(255),random(255));
      
    }
  if (myCar2.xpos > width || myCar2.xpos < 0){
      direction = -direction;
      myCar2.c = color(random(255),random(255),random(255));
    
    }
  if (myCar3.xpos > width || myCar3.xpos < 0){
      direction = -direction;
      myCar3.c = color(random(255),random(255),random(255));
     
    }

}



class Car { // Define a class below the rest of the program.
  color c; // Variables.
  float xpos;
  float ypos;
  float xspeed;
  

  Car() { // A constructor.
    c = (255);
    xpos = random(width/2);
    ypos = random(height/2);
    xspeed = random(10);
  }

  void display() { // Function.
    // The car is just a square
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos,ypos,20,10);
    
  }

  void move(int direction) { // Function.
    xpos = xpos + xspeed * direction;
   
    }
      
    



}



