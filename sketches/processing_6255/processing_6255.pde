
float FIRST_THRESHOLD = 2.2; 
float SECOND_THRESHOLD = 1;
float THIRD_THRESHOLD = .5;
float FOURTH_THRESHOLD = .1;

float POWER_ADJUST = 500;

color lightblue = color(181,213,227); 
color purpleshift = color(197, 196, 214); 
color pink = color(232, 166, 195); 
color color1, color2, color3, color4, color5; 
color[] palette = new color[5];
int sketchSize = 200; 
float center = sketchSize/2;  
ArrayList moireBalls; 



void setup() 
{ 
  size(sketchSize, sketchSize);
  color1 = pink; 
  color2 = purpleshift; 
  color3 = lightblue; 
  color4 = lightblue;

  randomizeColors();
  colorMode(RGB); 
  //new array of MoireBalls
  moireBalls = new ArrayList(); 
} 
 

 
void draw() 
{  
  background(color1); 
 
  float sum; // sum of metaball powers 
 
  for(int y = 0; y < height; y++) 
  { 
    for(int x = 0; x < width; x++) 
    { 
      sum = 0; 
 
      //calculate power per pixel 
      for(int i = 0; i < moireBalls.size(); i++) 
      { 
        MoireBall mBall = (MoireBall) moireBalls.get(i); 
        sum = sum + mBall.equation(x,y); 
      } 
     if(sum < THIRD_THRESHOLD && sum > FOURTH_THRESHOLD)
     set(x,y,color5);
      
     if(sum < SECOND_THRESHOLD && sum > THIRD_THRESHOLD)
        set(x,y,color4);
       
      if(sum < FIRST_THRESHOLD && sum > SECOND_THRESHOLD) 
        set(x, y, color3); 
      
      //draw pixels if high enough 
      if(sum >= FIRST_THRESHOLD) 
        set(x, y, color2); 
    } 
  } 
 
  //move moireballs 
  for(int i = 0; i < moireBalls.size(); i++) 
  { 
    MoireBall mBall = (MoireBall) moireBalls.get(i); 
    mBall.move(); 
    //gravitate towards center
    mBall.gravitate(center, center, 200); 
  } 
} //end draw

 void mouseClicked() 
{ 
  //new moireball at mouseX, mouseY 
  moireBalls.add(new MoireBall(mouseX, mouseY, 150, 0, 0, 0, 0)); 
} 


void keyPressed()  
{  
  if ((keyPressed == true) && (key == ']')) 
  {  
    POWER_ADJUST = POWER_ADJUST + 50; 
  }  
   
    if ((keyPressed == true) && (key == '['))  
  {  
    POWER_ADJUST = POWER_ADJUST - 50; 
  }  
    if ((keyPressed == true) && (key == 'r'))
    {
      randomizeColors();
    }
    if ((keyPressed == true) && (key == ' '))
    {
      randomizeColors();
    }
} 

void randomizeColors()
{  
  color1 = color(random(255),random(255), random(255));
  color2 = color(random(255),random(255), random(255));
  color3 = color(random(255),random(255), random(255));
  color4 = color(random(255),random(255), random(255));
  color5 = color(random(255),random(255), random(255));
}

class MoireBall 
{ 
  //declare instance vars 
  float xpos, ypos, power; 
  PVector velocity; 
  PVector acceleration; 
 
  //init 
  MoireBall (float x, float y, float p, float xv, float yv, float xa, float ya)  
  { 
    xpos = x; 
    ypos = y; 
    power = p; 
 
    velocity = new PVector(xv, yv); 
    acceleration = new PVector(xa, ya); 
  } 
 
  //equation of a... moireball? 
  float equation(float x, float y) 
  { 
    return( sin((sq(xpos-x) + sq(ypos-y))/POWER_ADJUST) ); 
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
} 
 
 


