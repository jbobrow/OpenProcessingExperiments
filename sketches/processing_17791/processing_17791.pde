
int x, y, l, h;
//boolean dead


Car myCar1;
Car myCar2; 
Car myCar3;

void setup() {
  size(400,400);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(#FF9F00), width, height-height/4, 1, height/4, width/4); 
  myCar2 = new Car(color(#EA0062), width, 0, 2, height/4, width/4); 
  myCar3 = new Car(color(#74E600), 0, height/2-25, 0, height/8, width/8);

  //If dead is true, then stop drawing the ball
  //dead = false;
  
}

void draw() {
  background(100);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();

  //only draw the car if it isn't dead
  //if (dead == false)
//    myCar1.drive();
//  myCar1.display();
  
  myCar3.ypos++;
  
   if (keyPressed) {
    if (key == ' ') {
      myCar3.ypos = myCar3.ypos - 2;
    }
   }

}

//draw the rectangle
//rect(x, y, l, h);

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int h;
  int w;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, int temph, int tempw) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    h = temph;
    w = tempw;
  }

  void display() {
    stroke(#F00049);
    fill(c);
    rectMode(CORNER);
    rect(xpos,ypos, w, h);
  }

  void drive() {
    xpos = xpos - xspeed;

    if (xpos > width || xpos <= -100) {
      xpos = 400;
     // xspeed = -xspeed;
    }
  }
}


