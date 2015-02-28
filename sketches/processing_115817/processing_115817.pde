
// Car Race

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-2: Two Car objects

Car myCar1;
Car myCar2;
Car myCar3; // Three objects!

void setup() {
  size(400,300);
  myCar1 = new Car(color(255,0,0),0,100,2); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(0,255,0),0,190,3);
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  if (myCar1.xpos > width){
   myCar1.reverse();
  myCar2.reverse();
 myCar3.reverse();
  } 
  if (myCar1.xpos < 0){
    myCar1.reverse();
    myCar2.reverse();
    myCar3.reverse();
  }
 if (myCar2.xpos > width){
   myCar1.reverse();
  myCar2.reverse();
 myCar3.reverse();
  }
if (myCar2.xpos < 0){
    myCar1.reverse();
    myCar2.reverse();
    myCar3.reverse();
}
if (myCar3.xpos > width){
    myCar1.reverse();
    myCar2.reverse();
    myCar3.reverse();
}
if (myCar3.xpos < 0){
    myCar1.reverse();
    myCar2.reverse();
    myCar3.reverse();
}
}


class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with 4 argument parameters.
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
    //if (xpos > width) {
      //xspeed = -xspeed;
      //c = int(random(c));
    }
    //if (xpos < 0){
      //xspeed = -xspeed;
      //c = int(random(c));
  //}
  void reverse() {
  xspeed = -xspeed;
  c = int(random(c));
}
}



