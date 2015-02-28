
int NUM_THINGS=100;
Thing[] things = new Thing[NUM_THINGS];
boolean mousePressed=false;

//---------------------------------------------------------------------------------
void setup()
{
  size(800,800);
  smooth();
  
    for (int i = 0; i < NUM_THINGS; i++) 
    {
      things[i] = new Thing();   // populating the array
   
      things[i].x = random(0, width);
      things[i].y = random(0, height);
    }
}
//----------------------------------------------------------------------------------
void draw()
{
  background(40,40,45);
  for(int i = 0; i <NUM_THINGS;i++)
  {
    things[i].update();
  }
}
//-----------------------------------------------------------------------------------
class Thing
{
  float myDiameter= 2;
  float x = width/2;
  float y = height/2;
  float xv = -3+random(6);
  float yv = -random(4);
  float maxYV = 20;
  float gravity = 0.1;
  float friction = 1;
  color c = color(random(100),random(100,220),random(100,255));
   
  Thing(){  }
 
  void update()
  {
    if(x <= myDiameter)
    {
      xv = abs(xv);
    }
    else if(x >= width - myDiameter)
    {
      xv = -abs(xv);
    }
 
    if(y + myDiameter >= height)
    {
      yv = -abs(yv);
      if(y + myDiameter - height >= 0.15)
      {
        y = height - myDiameter;
        if(yv > -0.1)
        {
          xv *= 0.96;
        }
      }
    }
 
    if((yv < maxYV))
    {
      yv += gravity;
    }
    yv *= friction;
    y += yv;
 
    x += xv;
    
    fill(c);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    
    for (int i = 0; i < NUM_THINGS; i++)
    {
      
      Thing other = things[i];
 
      
      if (this != other)
      {
        
        if (dist(x, y, other.x, other.y)<50)
        {
         
          stroke(255, 255, 255, 70);
          line(x, y, other.x, other.y);
          c=color(255,0,0);
          noFill();
          ellipse(x,y,myDiameter*3,myDiameter*3);
          ellipse(x,y,myDiameter*5,myDiameter*5);
        }
        else if(dist(x,y,other.x,other.y)>50)
        {
          c=color(random(100),random(100,220),random(100,255));
        }
      }
    }
  }
 
  
}
