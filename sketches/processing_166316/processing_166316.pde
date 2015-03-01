
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(1000,600);
  myCar1 = new Car(color(#bbbbbb),200,200,random(1,3));
  myCar2 = new Car(color(0,0,255),random(0,400),300,random(4,5));
  myCar3 = new Car(color(#bbbbbb),200,400,random(1,3));
}

void draw() {
  background(#cccccc);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
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
    rect(xpos,ypos,50,30);
  }
  
  void randColor()
  {
    c = color(random(255),random(255),random(255));
    fill(c);
  }

  void move() {
    xpos = xpos + (xspeed*3);    //sped up for bigger size
    if (myCar1.xpos > width || (myCar1.xpos < 0))
    {
     myCar1.randColor();
     xspeed = -xspeed; 
    }
    else if (myCar2.xpos > width || (myCar2.xpos < 0))
    {
     myCar2.randColor();
     xspeed = -xspeed; 
    }
    else if (myCar3.xpos > width || (myCar3.xpos < 0))
    {
     myCar3.randColor();
     xspeed = -xspeed; 
    }
  }
}


