
float x,y,vx,vy;
int growth = 5; //Controls rate in whichh population grows
Population[] myPop = new Population[growth]; //Declare object
color[]myColors = new color[2];
 
void setup() 
{
  
  x = random(width);
  y = random(height);
  vx = random(-1,1);
  vy = random(-1,1);
  size(500, 500);
  background(0);
 
  myColors[0] = color(155, 225, 35,85); //colors for array
  myColors[1] = color(95, 215, 245,85);
 
  for (int i=0;i < myPop.length;i++)
  { 
    myPop[i] = new Population();
  }
}
 
 
 
void draw()
{
  
  x+=vx;
  y+=vy;
  
  vx+=noise(x*.01,y*.01,frameCount*.01)-.6;
  vy+=noise(frameCount*.01,x*.01,y*.01)-.6;
  
  
  for (int i=0; i < myPop.length; i++)
  {
    myPop[i].update();
    myPop[i].display();
  }
}
 
 
 
class Population 
{
  float x1 = random(0, width);
  float y1 = random(0, height);
  float x2 = random(0, width);
  float y2 = random(0, height);
  color gender = myColors[floor(random(0,2))];
 
  Population() 
  {
  }
 
  void update() 
  {
    x1 = x1 + random(-5, 10); //1's regulate the amount of area coverd by green
    y1 = y1 + random(-5, 20);
    x2 = x2 + random(-20, 25); //2's regulate the amount of area covered by blue
    y2 = y2 + random(-10, 15);
  }
 
 
void display()
{ //draws dots
    stroke(gender); 
    strokeWeight(random(3, 6)); 
    point(x1, y1);
    strokeWeight(random(9));
    point(x2, y2);
}
}
