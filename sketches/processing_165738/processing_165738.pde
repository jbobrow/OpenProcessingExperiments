


Car myCar1;
Car myCar2; 
Car myCar3;

int direction = 1;

void setup() {
  size(300,300);
  // Initialize Car object
  myCar1 = new Car(color(255),20,50,random(1,6)); 
  myCar2 = new Car(color(255),20,100,random(1,6));
  myCar3 = new Car(color(255),20,150,random(1,6));
}

void draw() {
 background(150);
  myCar1.move(direction);
  myCar1.display();
  myCar2.move(direction);
  myCar2.display();
  myCar3.move(direction);
  myCar3.display();
  if (myCar1.xpos > width-10|| myCar1.xpos < 0+10 || myCar2.xpos > width-10 || myCar2.xpos < 0+10 || myCar3.xpos > width-10 || myCar3.xpos < 0+10){
    direction = - direction;
  }
  if (myCar1.xpos > width-10){
    myCar1.xpos = width-10;
    myCar1.c = color(random(255),random(255),random(255));
  }
  if (myCar1.xpos < 0+10){
    myCar1.xpos = 10;
    myCar1.c = color(random(255),random(255),random(255));
  }
  if (myCar2.xpos > width-10){
    myCar2.xpos = width-10; 
    myCar2.c = color(random(255),random(255),random(255));
  }
  if (myCar2.xpos < 0+10){
    myCar2.xpos = 10;
    myCar2.c = color(random(255),random(255),random(255));
  }
  if (myCar3.xpos > width-10){
    myCar3.xpos = width-10;
    myCar3.c = color(random(255),random(255),random(255));
  }
  if (myCar3.xpos < 0+10){
    myCar3.xpos = 10;
    myCar3.c = color(random(255),random(255),random(255));
  }
 
}




class Car { // Define a class below the rest of the program.
  color c; // Variables.
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

  void move(int dir) {
    direction = dir;
    xpos = xpos + xspeed*direction;
   }

}




