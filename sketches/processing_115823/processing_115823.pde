
//my Random Color generating function that I made because it's less messy this way
color rC() 
{
color tempC = color(random(255), random(255), random(255));
return tempC;
}

//my function that makes sure that yPosition is random, but always lower than the y position of the car precedng it
float newPos(float a)
{
 float  total = a+10*random(2,4);
 return total;
}

Car myCar1;
Car myCar2;
Car myCar3; 

void setup() {
  size(400,400);
  myCar1 = new Car(rC(),random(width/6,width/2),random (10,height/3),random(3,8));
  myCar2 = new Car(rC(),newPos(myCar1.xpos),newPos(myCar1.ypos),myCar1.xspeed/random(2,4));
  myCar3 = new Car(rC(),newPos(myCar2.xpos),newPos(myCar2.ypos),random(3,8));
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();

  myCar2.move();
  myCar2.display();

  myCar3.move();
  myCar3.display();

  if (myCar1.xpos>width || myCar1.xpos<0)
    {
      myCar1.xspeed = myCar1.xspeed*-1; 
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
      myCar1.c=rC();
    }

  if (myCar2.xpos>width || myCar2.xpos<0)
    {
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
      myCar2.c=rC();
    }

  if (myCar3.xpos>width || myCar3.xpos<0)
    {
      myCar3.xspeed = myCar3.xspeed*-1;
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar3.c=rC();
    }
    
}


class Car {
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
/*    if (xpos > width) {
     xpos = 0;
    }*/
  }
}
