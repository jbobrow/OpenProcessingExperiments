
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;

void setup() {
  size(1000,250);
  myCar1 = new Car(color(255,0,0),0,90,random(10)); 
  myCar2 = new Car(color(0,0,255),0,10,random(10));
  myCar3 = new Car(color(0,255,0),0,50,random(10));
  myCar4 = new Car(color(0,255,155),0,30,random(10));
  myCar5 = new Car(color(155,255,0),0,70,random(10));
  myCar6 = new Car(color(255,0,255),0,130,random(10));
  myCar7 = new Car(color(255,255,0),0,110,random(10));
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
  myCar5.move();
  myCar5.display();
  myCar6.move();
  myCar6.display();
  myCar7.move();
  myCar7.display();
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
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
    ellipse(xpos,ypos,30,20);
    rect(xpos-10,ypos-10,10,10);
    rect(xpos-20,ypos+10,10,10);
    rect(xpos-10,ypos+10,10,10);
    rect(xpos-30,ypos+10,10,10);
}

void move() {
    xpos = xpos + xspeed;
    if (mousePressed){
      xpos = 0;
    }
  }
}
  
