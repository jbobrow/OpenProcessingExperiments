
Car myCar1;
Car myCar2;
Car myCar3;
// 3 objects!
int y = 80;
int x = 50;
int spacing = 10;
int len = 50;
int endLegs = 150;
float xpos;
float ypos;
float xspeed;

void setup() {
  size(500,500);
  myCar1 = new Car(255,0,0,0,100,2); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(0,0,255,0,10,1);
  myCar3 = new Car(0,0,255,0,200,3);

  
}

void draw() {
  background(170);
  stroke(255);

  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if ((myCar1.xpos > width)|| (myCar1.xpos < 0 )){
    myCar1.direct();
    myCar2.direct();
    myCar3.direct();
    myCar1.fillin();

    
  }
    
  else if ((myCar2.xpos > width)|| (myCar2.xpos < 0 )){
    myCar1.direct();
    myCar2.direct();
    myCar3.direct();
    myCar2.fillin();

  }
 
 else if ((myCar3.xpos > width)|| (myCar3.xpos < 0 )){
    myCar1.direct();
    myCar2.direct();
    myCar3.direct();
    myCar3.fillin();
 }
    
    
  
}

class Car { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float r;
  float g;
  float b;


Car(float tempR, float tempG, float tempB, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    r = tempR;
    b = tempB;
    g = tempG;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
    fill(r,g,b);
  }

  void move() {
    xpos = xpos + xspeed;
    if ((xpos > width)|| (xpos < 0 )){
  r = random(255);
  g = random(255);
  b = random(255);
        
 }}
 
 void fillin(){
   fill(r,g,b);
 }
      
 void direct() {
   xspeed = xspeed * - 1;
}
}
