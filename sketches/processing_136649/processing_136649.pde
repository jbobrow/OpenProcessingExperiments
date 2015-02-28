
int numOfPoints; //This variable controls how many points to use for chaos game
int currentx; //These are the points that are moving around at random
int currenty;
int previous_point = 0;
ArrayList<Spoint> sp; //This stores the points

void setup() 
{ 
  size(604, 604);
  background(255);
  
  numOfPoints = 4;
  int radius = width / 2 - 10;
  float deltaangle = TWO_PI / numOfPoints;
  currentx = int(radius + width / 2);
  currenty = int(width / 2);
  sp = new ArrayList<Spoint>();
  
  
  //create points 
  for (float theta = 0; theta < TWO_PI; theta += TWO_PI / numOfPoints)
  {
    //graph the points using polar form (rotate theta), then convert back to rectangular
    int xposition = int(radius * cos(theta))+width/2; //Add half width to move to 1st quad
    int yposition = int(radius * sin(theta))+width/2;
    sp.add(new Spoint(xposition,yposition));
  }
  
  //graph starting points
  for (int i = 0; i < sp.size(); i++)
  {
    Spoint temp = sp.get(i);
    fill(0);
    ellipse(temp.getx(),temp.gety(),2,2);
  }
}

void draw() 
{  
  for (int i = 0; i<200; i++)
  {
    int randompoint = int(random(numOfPoints));
    if (((randompoint + previous_point) % numOfPoints != 0) || (randompoint == previous_point))
    {
      previous_point = randompoint;
      Spoint temp = sp.get(randompoint);
      currentx = weighted_average(temp.getx(),currentx);
      currenty = weighted_average(temp.gety(),currenty);
      fill(0);
      point(currentx,currenty);
    }
  }
  
  
}

int weighted_average(int num1,int num2)
{
  return(int((num1+num2)/2.0));
}

class Spoint
{
  int xpos, ypos;
  
  Spoint(int x, int y)
  {
    xpos = x;
    ypos = y;
  }
  
  int getx()
  {
    return xpos;
  }
  
  int gety()
  {
    return ypos;
  }
}

