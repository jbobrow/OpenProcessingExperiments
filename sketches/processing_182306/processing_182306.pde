
PImage axolotl;  
ArrayList<Car> cars = new ArrayList<Car>();
boolean keyup,keyleft,keyright,keyspace,keydown,keyr;
int count;
color c;

void setup()
{
  //barrowed code
  size(displayWidth, displayHeight);
  //barrowed code end
  axolotl = loadImage("axolotl.jpg");
  frameRate(120);
  //c1 = new Car(250,250);
  for (int i = 0; i < 1000; i++)
  {
    cars.add(new Car());
  }
}

void draw()
{
  
  while (count%60==0) 
  {
    c = color(random(255));
    count = count+1;
  }
  background(c);
  //c1.display();
  //c1.drive();
  
  for (int i = 0; i < 175; i++)
  {
    Car c1 = cars.get(i);
    c1.display();
    if (keyup) c1.turnCar(random(-90));
    if (keyleft) c1.Break();
    if (keyright)c1.drive();
    if (keydown) c1.turnCar(random(90));
    if (keyspace) c1.center();
    if (keyr) c1.reset();
  }
}
void keyPressed()
{
  if (keyCode == LEFT) keyleft = true;
  if (keyCode == RIGHT) keyright = true;
  if (keyCode == UP) keyup = true;
  if (key == ' ') keyspace = true;
  if (keyCode == DOWN) keydown = true;
  if (key == 'r') keyr = true;
}
void keyReleased()
{
  if (keyCode == LEFT) keyleft = false;
  if (keyCode == RIGHT) keyright = false;
  if (keyCode == UP) keyup = false;
  if (key == ' ') keyspace = false;
  if (keyCode == DOWN) keydown = false;
  if (key == 'r') keyr = false;
}


class Car
{
  float xpos;
  float ypos;
  float xspeed;
  float theta;
  float xvel;
  float yvel;
  float x = random(width);
  float y = random(height);
  float r = red(axolotl.get(int(x),int(y)));
  float g = green(axolotl.get(int(x),int(y)));
  float b = blue(axolotl.get(int(x),int(y)));
  
  Car()
  {
    xpos = random(width);
    ypos = random(height);
    theta = 0;
    xvel = 0;
    yvel = 0;
    xspeed= random(50);
    
  }
  
  void drawCar()
  {
    xpos = int(xpos + xvel);
    ypos = int(ypos + yvel);
    xvel = 0.99 * xvel;
    yvel = 0.99 * yvel;
    
    if (xpos > width)
    { 
      xpos = 0;
    }
    else if (xpos < 0)
    {
      xpos = width;
    }
    if (ypos > height)
    {
      ypos = 0;
    }
    else if (ypos < 0)
    {
      ypos = height;
    }
  }
    
  void turnCar(float turn)
  {
    ypos=ypos+turn; 
  }
  
  void Break()
  {
    xpos = xpos - xspeed;
    yvel = 0;
  }
  
  void drive()
  {
    xpos = xpos + xspeed;
    if (xpos>width)
    {
        xpos=0;
    }
  }
  
  void center()
  {
    xpos = (width/2);
    ypos = (height/2);
  }
  
  void reset()
  {
    xpos = random(width);
    ypos = random(height);
  }
  
  void display()
  {
    rectMode(CENTER);
    fill(r,g,b);
    //barrowed code begins
    image(axolotl,xpos,ypos,random(100),random(50));
    //barrowed code ends
  }
}

