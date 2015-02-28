
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;

void setup(){
  size(400,400);
  myCar1 = new Car(color(255,0,0),0,50,2);
  myCar2 = new Car(color(0,255,0),0,150,1);
  myCar3 = new Car(color(0,0,255),0,250,3);
  myCar4 = new Car(color(155,30,170),0,350,4);
}

void draw(){
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
}

class Car{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,30,20);
    triangle(xpos-13, ypos, xpos-35, ypos+20, xpos-35, ypos-20);
  }
  
  void move(){
    xpos = xpos + xspeed;
    if (mousePressed){
      xpos=0;
    }
  }
}
