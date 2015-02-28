
Car myCar1;
Car myCar2;
Car myCar3;

void setup(){
  size(400,110);
  myCar1 = new Car(color(255,0,0),0,100,2);
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(0,255,0),0,50,1.5);
}

void draw(){
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if ((myCar1.xpos > width) || (myCar1.xpos <0)){
  myCar1.turn();
  myCar2.turn();
  myCar3.turn();
  }
  
  else if ((myCar2.xpos > width) || (myCar2.xpos <0)){
    myCar1.turn();
    myCar2.turn();
    myCar3.turn();
  }
  
  else if ((myCar3.xpos >width )|| (myCar3.xpos <0)){
    myCar1.turn();
    myCar2.turn();
    myCar3.turn();
  }
  
  
}

class Car {
  color c;
  float xpos;
  float ypos;
  float speed = 0;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    speed = random(2,5);
  }
  
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 25,15);
  }
  
  void move(){
    xpos = xpos + speed;
    if ((xpos > width) || (xpos <0)){
  
     c =  color(random(10, 150), random(10, 150), random(10, 150));
    }
  }
  void turn() {
  speed = -speed;
  
  }
}



