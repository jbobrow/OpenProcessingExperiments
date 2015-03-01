
Car myCar1;
Car myCar2;
Car myCar3; // Two objects!
int direction = 1;


void setup() {
  size(400,400);
  myCar1 = new Car(color(255,255,255),100,200,2); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,255,255),100,100,2);
  myCar3 = new Car(color(255,255,255),100,10,2);
  myCar1.xspeed = random(5);
  myCar2.xspeed = random(5);
  myCar3.xspeed = random(5);
}

void draw() {
  background(150);
  myCar1.move(direction);
  myCar1.display();
  myCar2.move(direction);
  myCar2.display();
  myCar3.move(direction);
  myCar3.display();

  if(myCar1.xpos>width || myCar1.xpos<0){
    direction = -direction;
    
    myCar1.c = color(random(255),random(255),random(255));
  }
  if(myCar2.xpos > width || myCar2.xpos < 0){
    direction= -direction;
    
    myCar2.c = color(random(255),random(255),random(255));
  }
  if(myCar3.xpos > width || myCar3.xpos < 0){
    direction= -direction;
    
    myCar3.c = color(random(255), random(255), random(255));
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
   }
}
