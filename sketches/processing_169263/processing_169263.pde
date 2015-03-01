
/* @pjs preload="background.jpg"; */

PImage pup;
PImage adult;
PImage feather;
PImage bg;
PImage bubble;
float count;
float timer;
//float y = 50;
float speed = 1;
//float radius = 15;
float x,y;
float sdistance;


void setup()
{
  size(700,700);
  smooth();
  bg = loadImage("background.jpg");
  pup = loadImage("animal2.png");
  adult = loadImage("animal1.png");
  feather = loadImage("feather.png");
  bubble = loadImage("bubble.jpg");
}

void draw()
{
  image(background, 0, 0);
  background.resize(700,700);
  //count++;
  
  pup.move();
  pup.draw();
  
  feather.move();
  feather.draw();
  
  bubble.move();
  bubble.draw();
}

class pup
{
  float x,y;
  float x_speed, y_speed;
  float timer;
  pup (float Class_X, float Class_Y, float X_speed, float Y_speed)
  {
    x=Class_X;
    y=Class_Y;
    x_speed=X_speed;
    y_speed=Y_speed;
  }
  
  void draw()
  {
    if (timer<=50)
    {
      imageMode (CORNER);
      image(pup, x, y);
    }
    if (timer>50)
    {
      imageMode (CORNER);
      image(adult, pup.x, pup.y);
    }
  }
  
  void move()
  {
    if (x>width-50 || x<0)
    {
      x_speed = -x_speed;
    }
    if (y<5)
    {
      y_speed +=1;
    }
    if (y>height-75)
    {
      y_speed -=1;
    }
    x+=x_speed;
    y+=y_speed;
  }
}

class bubble
{
  float x,y;
  float x_speed, y_speed;
  float timer;
  {
    x=Class_X;
    y=Class_Y;
    x_speed=X_speed;
    y_speed=Y_speed;
  }
  
  void draw()
  {
    image(bubble, random(200), random(200));
    
    if(timer<200)
    {
      x_speed = 5; y_speed = 5;
    }
    if(timer>=200)
    {
      bubble=null;
    }
  }
  
  void move()
  {
    if(timer<200)
    {
      x_speed=5; y_speed=5;
    }
    if(timer>=200)
    {
      bubble=null;
    }
  }
}

class feather
{
float q,w;
float timer;
float x_speed, y_speed;

{
    x=Class_X;
    y=Class_Y;
    x_speed=X_speed;
    y_speed=Y_speed;
}


  void draw()
  {
  image(feather, 100, 50);
  }

void move()
{
  x_speed=0;
  y_speed=4;
}
}

  
  
  
  
 
  




