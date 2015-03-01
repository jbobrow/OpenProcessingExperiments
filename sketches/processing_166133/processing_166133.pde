
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-2: Two Car objects

Car myCar1;
Car myCar2; // Three objects!
Car myCar3;
int direction = 1;
float carColor = 0;
int changeColor = 0;

void setup() {
  size(200,200);
  myCar1 = new Car(color(255,255,255),width/5,height/2,random(1,3)); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,255,255),width/5,height/3,random(1,3));
  myCar3 = new Car(color(255,255,255),width/5,height*2/3,random(1,3));
}

void draw() {
  background(255);
  myCar1.move(direction);
  myCar1.display();
  myCar2.move(direction);
  myCar2.display();
  myCar3.move(direction);
  myCar3.display();
  
  if (myCar1.xpos+10>width|| myCar1.xpos<10){
    direction = - direction;
    myCar1.r=random(255);
    myCar1.g=random(255);
    myCar1.b=random(255);
     //color(random(0,255),random(0,255),random(0,255));
  }
  
 if (myCar2.xpos+10>width|| myCar2.xpos<10){
    direction = - direction;
    myCar2.r=random(255);
    myCar2.g=random(255);
    myCar2.b=random(255);
 }
 
  if (myCar3.xpos+10>width|| myCar3.xpos<10){
     direction = - direction;
     myCar3.r=random(255);
     myCar3.g=random(255);
     myCar3.b=random(255);
  }
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  float r;
  float g;
  float b;
  float xpos;
  float ypos;
  float xspeed;
 // float direction = 1;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    r = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(r,g,b);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void move(int direction) {
    xpos = xpos + xspeed*direction;
  }
  //void yesColor(int changeColor) {
    //c= c*changeColor;
  //if (xpos>width|| xpos<0) {
  //fill(random(0,255),random(0,255),random(0,255));
}
  //}


