


Car rCar1;
Car rCar2;
Car rCar3;


void setup() {
  size(400,200);
  rCar1 = new Car(color(255,0,0),0,150,2);
  rCar2 = new Car(color(0,255,0),0,50,1.5);
  rCar3 = new Car(color(0,0,255),0,100,1);
}

void draw() {
  background(50);
  rCar1.move();
  rCar1.display();
  rCar2.move();
  rCar2.display();
  rCar3.move();
  rCar3.display();
  
  stroke(255);
  line(0,30,400,30);
  line(0,75,400,75);
  line(0,125,400,125);
  line(0,170,400,170);
  
  if ((rCar1.xpos > width)||(rCar1.xpos < 0)){
    rCar1.change();
    rCar2.change();
    rCar3.change();
  }
  if ((rCar2.xpos > width)||(rCar2.xpos < 0)){
    rCar1.change();
    rCar2.change();
    rCar3.change();
  }
   if ((rCar3.xpos > width)||(rCar3.xpos < 0)){
    rCar1.change();
    rCar2.change();
    rCar3.change();
  }
}
  

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color colorStart, float xPosStart, float yPosStart, float xVel) {
    c = colorStart;
    xpos = xPosStart;
    ypos = yPosStart;
    xspeed = xVel;
  }

  void display() {
    stroke(0);
    rectMode(CENTER);
    rect(xpos-5,ypos+7,5,3);
    rect(xpos-5,ypos-5,5,3);
    rect(xpos+5,ypos+7,5,3);
    rect(xpos+5,ypos-5,5,3);
    fill(c);
    rect(xpos,ypos,20,10);
    fill(25);
    noStroke();
    rect(xpos-5,ypos,2,8);
    rect(xpos+5,ypos,2,8);
  }

  void move() {
    xpos = xpos + xspeed;
    if ((xpos > width) || (xpos < 0)) {
     c = color(random(0, 255), random(0, 255), random(0, 255)); 
    }
  }
  
  void change(){
    xspeed = -xspeed;
  }
}


