
// Creation 4 Objects Car
Car myCar1;
Car myCar2; 
Car myCar3;
Car myCar4;
int xpeed=2; // car speed

void setup() {
  size(300,200);
  
  // Car configurations
  myCar1 = new Car(color(31,62,255),0,100,xpeed); 
  myCar2 = new Car(color(31,255,201),300,70,xpeed);
  myCar3 = new Car(color(250,200,18),250,70,xpeed);
  myCar4 = new Car(color(250,157,18),50,100,xpeed);
}

void draw() {
  background(255);
  fill(203,203,203);
  rect(100,100,500,20);
  fill(203,203,203);
  rect(100,70,500,20);
   
   
   // Show cars on display
    myCar1.display();
    myCar2.display();
    myCar3.display();
    myCar4.display();
    
    
   // Cars start moving
if (key == 's'||key == 'S') {
    myCar1.move();
    myCar2.moveRight();
    myCar4.move();
    myCar3.moveRight();

}

   // Cars start moving normal
if (key == 'n'||key == 'N') {
    myCar1.move();
    myCar2.moveRight();
    myCar4.move();
    myCar3.moveRight();

}

   // Cars stops
if (key == 'p'||key == 'P') {
    myCar1.stop(100);
    myCar2.stopRight(70);
    myCar4.stop(70);
    myCar3.stopRight(100);
}

   // Cars start moving fast
if (key == 'f'||key == 'F') {
    myCar3.moveFastRight();
    myCar1.moveFast();
    myCar4.moveFast();
    myCar2.moveFastRight();
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
    if (xpos > width) {
      xpos = 0;
    }}
  void moveRight() {
  xpos = xpos - xspeed;
      if (xpos < 0) {
      xpos = 300;
      }
  
  }
  void moveFastRight() {
  xpos = xpos - xspeed -1;
      if (xpos < 0) {
      xpos = 300;
      }
  
  }
  
  void moveFast() {
    xpos = xpos + xspeed+1;
    if (xpos > width) {
      xpos = 0;
    }}
  void stop(int pos){
    xpos = pos;
    xpeed = 0;
  }
  void stopRight(int pos){
    xpos = pos;
    xpeed = 0;
  }
 
}
                
