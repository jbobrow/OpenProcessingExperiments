
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-2: Two Car objects

Car myCar1;
Car myCar2; // Two objects!
Car myCar3;
  
float r;
float g;
float b;
  
void setup() {
  size(800,600);

  myCar1 = new Car(color(255,255,255),0,50,5); // Parameters go inside the parentheses when the object is constructed.
  myCar2 = new Car(color(255,255,255),0,200,3);
  myCar3 = new Car(color(255,255,255),0,350,3);
}

void draw() {
  background(128);
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
    rect(xpos,ypos,20,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      r=random(255);
      g=random(255);
      b=random(255);
      c = color(r,g,b);
      xspeed = -xspeed; //xspeed = -xspeed;
    } else if (xpos < 0){
      r=random(255);
      g=random(255);
      b=random(255);
      c = color(r,g,b);
      xspeed = xspeed * -1;
    }
  }
}


