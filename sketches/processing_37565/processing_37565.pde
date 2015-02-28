
void setup()
{
  size(200, 200);
  mycar1 = new Car (30, 40, 4, color(233, 12, 44));
  mycar2 = new Car (40, 50, 4, color(0, 0, 0));
  mycar3 = new Car (50, 60, 4, color(0, 170, 44));
  mycar4 = new Car (60, 70, 4, color(33, 12, 174));
}

//int xpos = 20;
//int ypos = 20;

Car mycar1;
Car mycar2;
Car mycar3;
Car mycar4;

void draw()
{
  background (255);
  stroke(0);
  fill(135);
  rectMode(CENTER);

  if (mousePressed)
  {
    mycar1.display();
    mycar2.display();
    mycar3.display();
    mycar4.display();
  }

  else
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
  color carcolour;

  Car(int tempXpos, int tempYpos, int tempSpeed, color tempcolour)
  {
    xpos=tempXpos;
    ypos=tempYpos;
    speed=tempSpeed;
    carcolour=tempcolour;
  }

  void display()
  {
    fill(carcolour);
    rect(xpos, ypos, 100, 10);
  }

  void drive()
  {
    //rect(xpos,ypos,100,10);
    xpos = xpos + speed;
    if (xpos>width)
    {
      xpos=0;
      ypos=ypos + 20;
    } 
    if (ypos>height)
    {
      ypos=0;
      ypos=ypos + 25;
    }
  }
}


