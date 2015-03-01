
Car c1, c2, c3, c4, c5, c6, c7, c8;


void setup()
{
  size(700,700);
  background(0);
  c1 = new Car();
  c2 = new Car();
  c3 = new Car();
  c4 = new Car();
  c5 = new Car();
  c6 = new Car();
  c7 = new Car();
  c8 = new Car();
}

void draw()
{
  background(0);
  c1.drive();
  c1.drawCar();
  c2.drive();
  c2.drawCar();
  c3.drive();
  c3.drawCar();
  c4.drive();
  c4.drawCar();
  c5.drive();
  c5.drawCar();
  c6.drive();
  c6.drawCar();
  c7.drive();
  c7.drawCar();
  c8.drive();
  c8.drawCar();
  
}

class Car
{
  float xpos;
  float ypos;
  float xspeed;
  color c;
  
  Car ()
  {
    xpos = random(700);
    ypos = random(700);
    xspeed = random (5);
    c = color(random(255),random(255),random(255));
  }
  
  void drawCar()
  {
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,random(100),random(100));
  }
  
  void drive()
  {
    xpos = xpos + xspeed;
    if(xpos>width)
    {
      xpos = 0;
    }
  }
  
}
