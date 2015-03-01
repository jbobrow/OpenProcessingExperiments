
// Example 8-2: Two Car objects
int direction = 1;
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;

void setup() {
  size(200,200);
  myCar1 = new Car(color(255),width/5,height/2,random(0,10)); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255),width/5,height/3,random(0,10));  //after color the two numbers represent where the boxes are
  //the third number represents the speed
  myCar3 = new Car(color(255),width/5,height*2/3,random(0,10));
}

void draw() {
  background(255);
  myCar1.move(direction);
  myCar1.display();
  myCar2.move(direction);
  myCar2.display();
  myCar3.move(direction);
  myCar3.display();
  //if(myCar1.xpos > width|| myCar1.xpos < 0){
    //direction = -direction;
    //myCar1.c = color(random(255));
  //}
  //if(myCar2.xpos > width || myCar2.xpos < 0){
    //direction = -direction;
    //myCar2.c = color(random(255));
  //}
  if (myCar1.xpos > width || myCar1.xpos < 0 || myCar2.xpos > width || myCar2.xpos < 0 || myCar3.xpos > width || myCar3.xpos < 0){
    direction = -direction;
  }
  if (myCar3.xpos > 200){
    myCar3.c = color(random(255),random(255),random(255));
 }
  else if(myCar3.xpos < 1){
    myCar3.c = color(random(255),random(255),random(255));
 }
 else if (myCar2.xpos > 200){
    myCar2.c = color(random(255),random(255),random(255));
 }
  else if(myCar2.xpos < 1){
    myCar2.c = color(random(255),random(255),random(255));
 }
  else if (myCar1.xpos > 200){
    myCar1.c = color(random(255),random(255),random(255));
 }
  else if(myCar1.xpos < 1){
    myCar1.c = color(random(255),random(255),random(255));
 }
}


class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
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

  void move(int direction) {
    xpos = xpos + xspeed * direction;
    //if (xpos > width) {
      //xpos = 0;
    //}
  }
}


