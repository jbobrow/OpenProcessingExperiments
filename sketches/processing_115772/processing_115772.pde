
Car myCar1;
Car myCar2; // Two objects!
Car myCar3;

void setup() {
  size(600,600);
  myCar1 = new Car(color(255,0,0),0,300,3); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(0,0,255),50,200,4);
  myCar3 = new Car(color(255,0,0),0,100,2);
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
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
    rect(xpos,ypos,100,10);
  }
  void move() {
    xpos = xpos + xspeed;
   if ((myCar1.xpos > width)||(xpos < 0))
    {
      c = color(random(10,250),random(10,250),random(50,250));
xspeed = xspeed / -1;  }

xpos = xpos + xspeed;
   if ((myCar2.xpos > width)||(xpos < 0))
    {
      c = color(random(10,250),random(10,250),random(50,250));
xspeed = xspeed / -1;  

}  
xpos = xpos + xspeed;
   if ((myCar3.xpos > width)||(xpos < 0))
    {
xspeed = xspeed / -1;  }  
}
}


