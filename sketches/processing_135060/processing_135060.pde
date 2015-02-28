
int numOfPoints; //This variable controls how many points to use for chaos game
int currentx; //These are the points that are moving around at random
int currenty;
float multi;
ArrayList<Spoint> sp; //This stores the points

void setup() 
{ 
  size(604,614);
  colorMode(HSB,1.0);
  numOfPoints = 6;
  setmultiplier();
  background(0,0,1);
  setuppoints();
  setupUI();
}

void draw() 
{  
  for (int i = 0; i<500; i++)
  {
    int randompoint = int(random(numOfPoints));
    Spoint temp = sp.get(randompoint);
    currentx = weighted_average(temp.getx(),currentx);
    currenty = weighted_average(temp.gety(),currenty);
    color c = temp.getcolor();
    stroke(c);
    point(currentx,currenty);
  }
}

class Spoint
{
  int xpos, ypos;
  color cpoint;
  
  Spoint(int x, int y, color c)
  {
    xpos = x;
    ypos = y;
    cpoint = c;
  }
  
  int getx()
  {
    return xpos;
  }
  
  int gety()
  {
    return ypos;
  }
  
  color getcolor()
  {
    return cpoint;
  }
}

void setupUI()
{
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,12);
  
  //First Button
  fill(0,1,0);
  stroke(0,0,1);
  rect(0,height-20,140,20);
  fill(0,0,1);
  text("Increase Num of Points",3,height-8);
  
  //Second Button
  fill(0,1,0);
  stroke(0,0,1);
  rect(140,height-20,140,20);
  fill(0,0,1);
  text("Decrease Num of Points",143,height-8);
  
  //Third Button
  fill(0,1,0);
  stroke(0,0,1);
  rect(280,height-20,110,20);
  fill(0,0,1);
  text("Increase distance",283,height-8);
  
  //Fourth Button
  fill(0,1,0);
  stroke(0,0,1);
  rect(390,height-20,110,20);
  fill(0,0,1);
  text("Decrease distance",393,height-8);
  
  //Fifth Button
  fill(0,1,0);
  stroke(0,0,1);
  rect(500,height-20,104,20);
  fill(0,0,1);
  text("Random Color",506,height-8);
  
}

void setuppoints()
{
  int radius = width / 2 - 10;
  float deltaangle = TWO_PI / numOfPoints;
  sp = new ArrayList<Spoint>();
  
  //create points 
  float h1 = random(0.95);
  for (float theta = 0; theta < TWO_PI; theta += TWO_PI / numOfPoints)
  {
    //graph the points using polar form (rotate theta), then convert back to rectangular
    int xposition = int(radius * cos(theta))+width/2; //Add half width to move to 1st quad
    int yposition = int(radius * sin(theta))+width/2;
    
    h1 = h1 + 0.618033988749895; //Golden ratio!!
    h1 = h1 % 1;
    
    color c = color(h1,0.8,0.95);
    sp.add(new Spoint(xposition,yposition,c));
  }
  
  //graph starting points
  for (int i = 0; i < sp.size(); i++)
  {
    Spoint temp = sp.get(i);
    color c = temp.getcolor();
    fill(0,1,0);
    ellipse(temp.getx(),temp.gety(),3,3);
  }
}

void setmultiplier()
{
  //This tries to set the correct multiplier for each shape
  if (numOfPoints == 3)
  {
    multi = 0.5;
  }
  else if (numOfPoints < 6)
  {
    multi = 0.4;
  }
  else if (numOfPoints < 7)
  {
    multi = 1.0/(numOfPoints - 3);
  }
  else if (numOfPoints < 9)
  {
    multi = 1.0/(numOfPoints - 4);
  }
  else if (numOfPoints < 11)
  {
    multi = 1.0/(numOfPoints - 5);
  }
  else 
  {
    multi = 1.0/(numOfPoints - 7);
  }
}

int weighted_average(int num1,int num2)
{
  //this finds the next point using the multiplier
  int difference = num1 - num2;
  difference = int(difference * multi);
  return num1 - difference;
}

void mousePressed()
{
  if (mouseY > (height - 20))
  {
    if (mouseX < 140)
    {
      //button 1
      numOfPoints++;
      setmultiplier();
      setuppoints();
    }
    else if (mouseX < 280)
    {
      numOfPoints--;
      setmultiplier();
      setuppoints();
    }
    else if (mouseX < 390)
    {
      multi += 0.1;
    }
    else if (mouseX < 500)
    {
      multi -= 0.1;
    }
    else if (mouseX < width)
    {
      setuppoints();
    }
    background(0,0,1);   
  }      
  else if (mouseButton == LEFT)
  {
    multi -= 0.1;
  }
  else if (mouseButton == RIGHT)
  {
    multi += 0.1;
  }  
  background(0,0,1);
  setupUI();
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      numOfPoints++;
    }
    else if (keyCode == DOWN)
    {
      numOfPoints--;
    }
  }
  setmultiplier();
  background(0,0,1);
  setuppoints();
  setupUI();
}

