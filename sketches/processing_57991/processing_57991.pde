
Car myCar1;
Car myCar2; // Two objects!
int posx;
int posy;
color c;


void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  mouseX=2000;
  mouseY=2000;
   // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,0,0),0,100,1); 
  myCar2 = new Car(color(0,0,255),0,10,1);
}

void draw(){
     translate (mouseX, mouseY);
  fill(0,0,0);

  

  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  if (frameCount % 1 == 0) {
    fill(frameCount * 3 % 100, frameCount * 5 % 100,
      frameCount * 3 % 100);
    pushMatrix();
    translate(0, 0);
    popMatrix();
  }
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
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

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
 
}
//http://www.openprocessing.org/sketch/56635
}


