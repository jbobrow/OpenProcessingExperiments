
//Declare box variables
Box b1;

float vel = 1;

//Initialize the box variables
void setup(){
  size(400,400);
  b1 = new Box(random(50,350), vel, 0.1);
}

//Call functions
void draw(){
  background(205);
  
  b1.display();
  b1.move();
  b1.boundaries();

}

class Box {
  float x = 0;
  float y = 0;
  float yVel = 0;
  float yAcc = 0;
  float yMax = height-5;
  float yMin = 0;

  //Each box has a random x position
  Box(float a, float b, float c) {
    x = a;
    yVel = b;
    yAcc = c;
  }

  //Draw each box
  void display() {
    fill(#3a97ad);
    rect(x, y, 10, 10);
  }

  //Move box with acceleration 
  void move() {
    y += yVel;
    yVel += yAcc;

    if ( y >= yMax ) {
      yVel *= -1 ;
      yMin = yMin + 50;

      if ( yMin >= yMax ) {
        yMin = yMax;
      }
    }

    if ( y <= yMin ) {
      yVel *= 1;
    }
    
    println(y);
  }

  //Boundary check
  void boundaries() {
  }
}



