
class Car
{
  float angle;
  float xpos;
  float ypos;
  float speed;
  float displacement;
  
  Car()
  {
    angle = PI/2;
    xpos = 350;
    ypos = 250;
    speed = 0.05;
    displacement = 0;
  }
  
  void display()
  {
    fill(displacement, mouseY, mouseX);
    translate(xpos, ypos);
    rotate(angle);
    ellipse(0,0, 30,20);
  }
  
  void drive()
  {
    angle = atan2((mouseY - ypos), (mouseX - xpos));
    displacement = sqrt(pow((mouseX - xpos),2) + pow((mouseY - ypos),2));
    xpos += displacement * speed * cos(angle);
    ypos += displacement * speed * sin(angle);
  }
}

Car myCar;
boolean toggle;

void setup()
{
  myCar = new Car();
  size(700,500);
  smooth();
  background(255);
}

void draw()
{
  if(toggle)
  {
  myCar.drive();
  myCar.display();
  }
}

void mouseClicked()
{
  toggle = true;
}

