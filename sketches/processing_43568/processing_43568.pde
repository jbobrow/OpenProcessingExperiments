
ArrayList grains;
boolean spoutOn = true;
color[][] landedGrains;
int[] columnHeights;

color[] colors;
int colorIndex= 0;
PImage rainbowImg;

void setup() 
{
  size(200, 400, P2D);
  background(0);
  
  grains = new ArrayList();
  landedGrains = new color[width][height];
  columnHeights = new int[width];
  colors = new int[] { color(99, 184, 224), color(241, 131, 65), color(231, 61, 53), color(239, 241, 54), color(246, 114, 142), color(136, 222, 91), color(130, 97, 176), color(56), color(255) };
  
  for(int x=0; x<width; x++)
  {
    columnHeights[x] = 0;
    
    for(int y=0; y<height; y++)
    {
      landedGrains[x][y] = color(0);
    }
  }
  
  rainbowImg = new PImage(20, 20);
  for(int x=0; x<20; x++)
  {
    for(int y=0; y<20; y++)
    {
      rainbowImg.set(x,y, colors[int(random(colors.length))]);
    }
  }   
      
}

void draw() 
{
  background(0);
  
  //move all the mid-air grains down
  for(int i=0; i<grains.size(); i++)
  {
    Grain g = (Grain) grains.get(i);
    g.increment();
  }
  
  //add new grains
  if(spoutOn && mouseX>=0 && mouseX<width && mouseY>=0 && mouseY < height)
  {
    for(int i=24; i>0; i--)
      grains.add(new Grain(mouseX, i, getColor(), 24));
    
    if(mouseX < width-1)
    {
      for(int i=24; i>0; i--)
        grains.add(new Grain(mouseX+1, i, getColor(), 24));
    }
    if(mouseX > 0)
    {
      for(int i=24; i>0; i--)
        grains.add(new Grain(mouseX-1, i, getColor(), 24));
    }
  }
  
  //draw all the mid-air grains
  for(int i = 0; i<grains.size(); i++)
  {
    Grain g = (Grain) grains.get(i);
    stroke(g.m_Color);
    point(g.m_X, g.m_Y);
    
    //if the grain has landed, updated landedGrains array and remove this grain from the ArrayList
    if(g.m_Y+1 >= height || landedGrains[g.m_X][g.m_Y+1] != color(0))
    {
      SettleGrain(g);
      
      grains.remove(i);
      i--;
    }
  }
  
  //draw all the settled grains
  for(int x=0; x<width; x++)
  {
    for(int y=0; y<height; y++)
    {
      if(landedGrains[x][y] != color(0))
      {
        stroke(landedGrains[x][y]);
        point(x,y);
      }
    }
  }
  
  //draw the colorPickers at the top
  fill(0);
  noStroke();
  rect(0,0,width, 22);
  for(int i=0; i<colors.length; i++)
  {
    fill(colors[i]);
    rect(i*20, 0, 20, 20);
  }
  image(rainbowImg, 20*(colors.length-1), 0);
  stroke(255);
  noFill();
  rect(20*colorIndex, 0, 20, 20);
}

color getColor()
{
  if(colorIndex == colors.length-1)
    return colors[int(random(colors.length))];
  else
  {
    //the individual grains should vary in color a little bit
    color c = colors[colorIndex];
    float multiplier = 1.0 + random(0.3) - 0.15;
    return color(multiplier * red(c), multiplier * green(c), multiplier * blue(c));
  }
}

void SettleGrain(Grain g)
{ 
  int newX = getLowPointForX(g.m_X);
  int newY = max(0, height - 1 - columnHeights[newX]);

  landedGrains[newX][newY] = g.m_Color;
  columnHeights[newX] = columnHeights[newX]+1;
}

//for a grain falling at X=startingPt... find where it would fall (to the left, right, or in place)
int getLowPointForX(int startingPt)
{
  if(startingPt >= width-1 || startingPt <= 0)
    return startingPt;
  
  int center = columnHeights[startingPt];
  int right = columnHeights[min(width-1, startingPt+1)];
  int left = columnHeights[max(0, startingPt-1)];
  
  if(center <= right && center <= left)
    return startingPt;
  else if(center <= left)
    return getLowPointForX(startingPt+1);
  else if(center <= right)
    return getLowPointForX(startingPt-1);
  else //if both sides are lower, give it a 50/50 chance of falling each way
  {
    int direction = 1;
    if(random(100) < 50)
      direction = -1;
    return getLowPointForX(startingPt + direction);
  }
}

void mouseClicked()
{

  if(mouseY < 20)
  {
    colorIndex = int(mouseX / 20);
    if(colorIndex >= colors.length)
      colorIndex = 0;
  }
  else
    spoutOn = ! spoutOn;
}




class Grain 
{ 
  int m_X, m_Y, m_Increment;
  color m_Color;
  
  Grain (int x, int y, color c, int inc) 
  {  
    m_X = x;
    m_Y = y;
    m_Color = c; 
    m_Increment = inc;
  }
 
  public void increment()
  {
    m_Y+=m_Increment;
  }
  
}                                                                               
