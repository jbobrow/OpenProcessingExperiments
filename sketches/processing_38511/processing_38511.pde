
void setup () {
size (400 , 200);
mycar1 = new Car(20, 20, 1, color(0,255,0));
mycar2 = new Car(-20, 80, 4, color(0,255,255));
mycar3 = new Car(-60, 140, -2, color(255,255,0));
mycar4 = new Car(-60, 180, -4, color(255,0,255));

}

Car mycar1;
Car mycar2;
Car mycar3;
Car mycar4;


void draw () {
background (125);
stroke (0);
rectMode (CENTER);

fill (color(120,120,120));
rect (-10, 110 ,5000 , 5);

if (mousePressed)      // click to change direction
  {
  mycar1.display();
  mycar1.drive2();

  mycar2.display();
  mycar2.drive2();

  mycar3.display();
  mycar3.drive2();

  mycar4.display();
  mycar4.drive2();
  }

else                  //don't click and it functions as normal
  {
  mycar1.display();
  mycar1.drive();

  mycar2.display();
  mycar2.drive();

  mycar3.display();
  mycar3.drive();

  mycar4.display();
  mycar4.drive();
  }

}


class Car 
{

  int xpos;
  int ypos;
  int speed;
  color c;

  Car(int tempXpos, int tempYpos, int tempSpeed, color tempC) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempSpeed;
    c = tempC;
  
}

void display() 
  {
    stroke(0);
    fill(c);                      //tell processesing to color in the cars.
    rect (xpos, ypos, 20, 10);    // create the cars as rectangles at the correct x and y pos then make them 20 x 10
    
  }

void drive() 
  {
   xpos = xpos + speed;
  
     if (xpos > width)
      {
      xpos = -10;
      }
  
      if (xpos < -100) 
      {
        xpos = width;
      }
  
  }
  
  void drive2() 
    {
     xpos = xpos + speed;
     if (xpos > width)
      {
      speed = -speed;
      }
  
    else
    {
     speed = speed;
    }
    
    if (xpos < width)
    {
    speed = -speed;
    }
  
    else
    {
     speed = speed;
    }
  }

}

