
float MAX_METABALLS = 8;
float FIRST_THRESHOLD = 2.2;
float SECOND_THRESHOLD = 1;

color lightblue = color(181,213,227);
color purpleshift = color(197, 196, 214);
color pink = color(232, 166, 195);
color color1, color2, color3;

int sketchSize = 200;
float center = sketchSize/2;
float interval = 100;
float POWER_THRESHOLD = 1600;
boolean makeBalls = true;

ArrayList metaBalls;
float frameskip = 3;
float framecounter = frameskip;

void setup()
{
  color1 = pink;
  color2 = purpleshift;
  color3 = lightblue;

  size(sketchSize,sketchSize);
  colorMode(RGB);
  //new array of MetaBalls
  metaBalls = new ArrayList();
}

void mouseClicked()
{
  //new metaball at mouseX, mouseY
  //add to array new MetaBall(mouseX, mouseY, whatever power, x vel, y vel, x acc, y acc)
  metaBalls.add(new MetaBall(mouseX, mouseY, 150, 0, 0, 0, 0));
}

void keyPressed() 
{ 
  if ((keyPressed == true) && (key == ']'))
  { 
    POWER_THRESHOLD = POWER_THRESHOLD + 100;
  } 
  
    if ((keyPressed == true) && (key == '[')) 
  { 
    POWER_THRESHOLD = POWER_THRESHOLD - 100;
  } 
}

void draw()
{ 
  background(color1);

  float sum; // sum of metaball powers

  interval = interval - 1;

  if(metaBalls.size() == 0)
  {
    makeBalls = true;
  }

  if( (metaBalls.size() < MAX_METABALLS) && (makeBalls == true))
  {
    if(interval < 0)
    {
      interval = 100;
      metaBalls.add(new MetaBall(random(width), random(height), 1.1, 0, 0, 0, 0));
    }
  } 

  if(metaBalls.size() >= MAX_METABALLS)
  { 
    makeBalls = false;
  }



  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      sum = 0;

      //calculate power per pixel
      for(int i = 0; i < metaBalls.size(); i++)
      {
        MetaBall mBall = (MetaBall) metaBalls.get(i);
        sum = sum + mBall.equation(x,y);
      }

      if(sum < FIRST_THRESHOLD && sum > SECOND_THRESHOLD)
        set(x, y, color2);

      //draw pixels if high enough
      if(sum >= FIRST_THRESHOLD)
        set(x, y, color3);
    }
  }

  //move metaballs
  for(int i = 0; i < metaBalls.size(); i++)
  {
    MetaBall mBall = (MetaBall) metaBalls.get(i);
    mBall.move();
    mBall.shrink(.995);
    //gravitate towards center, also towards other balls
    mBall.gravitate(center, center, 200);
    for(int j = 0; j < metaBalls.size(); j++)
    {
      MetaBall gravBall = (MetaBall) metaBalls.get(j);
      if ((gravBall.xpos != mBall.xpos) && (gravBall.ypos != mBall.ypos))
        mBall.gravitate(gravBall.xpos, gravBall.ypos, 5);
    }

    if(mBall.power < 5 && !(mBall.baby))
      metaBalls.remove(i);

    if(mBall.power > -5 && mBall.power < 0 && !(mBall.baby))
      metaBalls.remove(i);

    if(mBall.baby)
      mBall.grow(1.05);
  }
}


class MetaBall
{
  //declare instance vars
  float xpos, ypos, power;
  PVector velocity;
  PVector acceleration;
  boolean baby; //if baby = 1, still growing...

  //init
  MetaBall (float x, float y, float p, float xv, float yv, float xa, float ya) 
  {
    xpos = x;
    ypos = y;
    power = p;

    velocity = new PVector(xv, yv);
    acceleration = new PVector(xa, ya);
    baby = true;
  }

  //equation of metaball
  float equation(float x, float y)
  {
    return( power / (sq(xpos-x) + sq(ypos-y)) );
  }

  void move()
  {
    xpos = xpos + velocity.x;
    ypos = ypos + velocity.y;
  } 

  void gravitate(float xcenter, float ycenter, float mass)
  {
    int xsignadj = 1;
    int ysignadj = 1;

    if(xpos >= xcenter)
      xsignadj = -1;

    if(ypos >= xcenter)
      ysignadj = -1;


    float radius = dist(xpos, ypos, xcenter, ycenter);
    PVector gravity = new PVector(xsignadj/sq(radius), ysignadj/sq(radius));

    gravity.div(10/mass); //adjust for gravitational constant

    //slow down near the center, due to granularity of draw()
    gravity.limit(.001);

    acceleration.add(gravity);
    
    //add drag
    acceleration.mult(.9);
    velocity.add(acceleration);
  }

  void shrink(float rate)
  {
    power = power*rate;
  }

  void grow(float rate)
  {
    power = power*rate;

    if(power > POWER_THRESHOLD)
      baby = false;
  }

}



