

Car myCar1;
Car myCar2; // Two objects!
Car myCar3;

int x1;
int x2;
int x3;


void setup() {
  size(400,400);
  myCar1 = new Car(color(255),50,100,random(5)); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255),50,200,random(5));
  myCar3 = new Car(color(255),50,300,random(5));
}

void draw() {
  background(102);
  myCar1.move();
  myCar1.display();
  x1 = myCar1.tracking();
  myCar1.changeColor();
  
  myCar2.move();
  myCar2.display();
  x2 = myCar2.tracking();
  myCar2.changeColor();
  
  myCar3.move();
  myCar3.display();
  x3 = myCar3.tracking();
  myCar3.changeColor();
 
  if(x1>width || x2>width || x3>width){
    myCar1.changeSpeed();
    myCar2.changeSpeed();
    myCar3.changeSpeed();
      }
  if(x1<0 || x2<0 || x3<0){
    myCar1.changeSpeed();
    myCar2.changeSpeed();
    myCar3.changeSpeed();
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

  void move() {
    xpos = xpos + xspeed;
      
    }
 
  int tracking() {
   // println(xpos);
    return int(xpos);
  }
  void changeSpeed(){
       xspeed=xspeed*-1;
  }
  void changeColor(){
    if (xpos<0 || xpos>width) {
      c = color(random(255),random(255),random(255));
    }
  }
}



