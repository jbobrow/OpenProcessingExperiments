
class Car
{
  float x; 
  float y;
  float s;
  color c;
  
  // constructor
  Car(float carx, float cary, float carspeed, color carcolor) 
  { 
    x = carx;
    y = cary;
    c = carcolor;
    s = carspeed;
  }
  
  void drive()
  {
    x = x + s;
    if ((car1.x >= width) || (car1.x <= 0))
    {
      s = s * -1;
      car1.c = car1.c + color(random(255));
      car2.c = car2.c + color(random(255));
      car3.c = car3.c + color(random(255));
    }
    if ((car2.x >= width) || (car2.x <= 0))
    {
      s = s * -1;
      car1.c = car1.c + color(random(255));
      car2.c = car2.c + color(random(255));
      car3.c = car3.c + color(random(255));
    }
    if ((car3.x >= width) || (car3.x <= 0))
    {
      s = s * -1;
      car1.c = car1.c + color(random(255));
      car2.c = car2.c + color(random(255));
      car3.c = car3.c + color(random(255));
    }
  }  
  
  void display()
  {
    fill(c);
    rect(x, y, 20, 14);
  }
}



Car car1;
Car car2;
Car car3;

void setup()
{
  size (500, 400);
  car1 = new Car(20, 50, random(2,6), color(random(255), random(255), random(255)));
  car2 = new Car(20, 150, random(2,6), color(random(255), random(255), random(255)));
  car3 = new Car(20, 250, random(2,6), color(random(255), random(255), random(255)));
}

void draw()
{
  background(255);
  car1.display();
  car2.display();
  car3.display();
  car1.drive();
  car2.drive();
  car3.drive();

}


