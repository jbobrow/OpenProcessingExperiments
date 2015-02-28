
Car myCar1; //Red Car
Car myCar2; //Blue Car
Car myCar3; //Green car

void setup() {
  size(400,300);
  myCar1 = new Car(color(255,0,0),0,100,3); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(0,0,255),0,50,2);
  myCar3 = new Car(color(0,255,0),0,150,5);
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if (myCar1.xpos > width || myCar1.xpos <0 ||
      myCar2.xpos > width || myCar2.xpos <0 ||
      myCar3.xpos > width || myCar3.xpos <0 ) {
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
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
    if (xpos > width || xpos <0){
      c = color(random(20,255), random(20,255), random(20,255));
    }
  }
}


