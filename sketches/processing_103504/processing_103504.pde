
// Example: Two Car objects, modified from Daniel Shiffman sample code
Car myCar1;
Car myCar2; // Two objects!

void setup() {
  size(400,200);
  // Parameters go inside the parentheses when the object is constructed.
  myCar1 = new Car(color(255,100,100),0,120,2); 
  myCar2 = new Car(color(100,190,255),0,70,1);
}

void draw() {
  background(255);
  drawRoad();
  
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
}

void drawRoad() {
 noStroke();
  fill(130,255,180); 
 rect(0,0,width,height);
 fill(140,160,160);
 rect(0,50,width,100);
 fill(255);
 rect(0,98,30,4);
 rect(50,98,30,4);
 rect(100,98,30,4);
 rect(150,98,30,4);
 rect(200,98,30,4);
 rect(250,98,30,4);
 rect(300,98,30,4);
 rect(350,98,30,4);
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
    rect(xpos,ypos,20,10);
    rect(xpos+3,ypos,12,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
