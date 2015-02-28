

boolean brush1, brush2, brush3, eraser;
int radius, strokeSize;
ArrayList bouncers;
ArrayList lightLines;
PFont font;
//colored circle on mouseclick (select size)
//drop bouncing cirlces (deform on fall and bounce)
//circles all HSB rolling together, noStroke
void setup()
{
  size(600, 600);
  background(0);
  
  radius = 10;
  strokeSize = 1;
  brush1 = false;
  brush2 = false;
  brush3 = false;
  eraser = false;
  bouncers = new ArrayList();
  lightLines = new ArrayList();
}

void draw()
{
  colorMode(RGB, 255);
  strokeWeight(1);
  stroke(0);
  
  if(bouncers.size() > 0)
  {
    strokeWeight(1);
    stroke(0);
    for(int c = bouncers.size(); c > 0; c--)
    {
      fill(0, 0, 255);
      Bouncer b = (Bouncer)bouncers.get(c-1);
      b.update();
    }
  }
  
  if(lightLines.size() > 0)
  {
    strokeWeight(3);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    for(int c = lightLines.size(); c > 0; c--)
    {
      Lightning l = (Lightning)lightLines.get(c-1);
      l.update();
    }
  }
  
  if(eraser)
  {
    brush1 = false;
    brush2 = false;
    brush3 = false;
    strokeWeight(strokeSize);
    stroke(255);
    line(0, 0, width, height);
    strokeSize+=2;
  }
  
  if(strokeSize >= 850)
  {
    setup();
  }
  
  if(!mouseOver(0, 0, 50, 200) && mousePressed)
  {
    if(brush1)
    {
      strokeWeight(1);
      stroke(0);
      fill(188, 0, 0);
      ellipse(mouseX, mouseY, radius, radius);
    }
    
    else if(brush2)
    {
      bouncers.add(new Bouncer(mouseX, mouseY, radius));
    }
    
    else if(brush3)
    {
    }
  }
  
  else if(!eraser && mousePressed)
  {
    changeBrush();
  }
  
   
  
  strokeWeight(1);
  stroke(0);
  fill(80);
  rect(0, 0, 50, 200);
  
  checkMouseOver();
  fill(14, 155, 31);
  text("1", 10, 10, 30, 30);
  text("2", 10, 50, 30, 30);
  text("3", 10, 90, 30, 30);
  text("E", 10, 130, 30, 30);
  text("RADIUS:", 3, 180);
  text("" + radius, 15, 190); 
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      radius++;
    }
    
    if(keyCode == DOWN)
    {
      radius--;
    }
  }
}

void mouseReleased()
{
  if(!mouseOver(0, 0, 50, 200) && brush3 && !eraser)
  {
    lightLines.add(new Lightning(mouseX, mouseY, radius));
  }
}


class Bouncer
{
  int x;
  int y;
  int radius;
  float acceleration;
  boolean skewed, up, down;
  
  Bouncer(int xVal, int yVal, int r)
  {
    x = xVal;
    y = yVal;
    radius = r;
    acceleration = 10;
    skewed = false;
    down = true;
    up = false;
  }
  
  void render(boolean skewed)
  {
    if(skewed)
    {
      ellipse(x, y, radius*1.5, radius*0.5);
    }
    
    else
    {
      ellipse(x, y, radius, radius);
    }
  }
  
  void update()
  {
    //thanks to Xiongfei Zhang!
    if(down)
    {
      y += acceleration;
      acceleration *= 1.2;
    }
    
    else if(up)
    {
      y -= acceleration;
      acceleration /= 1.6;
      skewed = false;
    }
    
    if(y >= height)
    {
      y = height - radius / 4;
      skewed = true;
      down = false;
      up = true;
    }
    
    if(acceleration <= 0.5)
    {
      up = false;
      down = true;
    }
    
    render(skewed);
  }
}
boolean mouseOver(int x, int y, int w, int h)
{
  return mouseX >= x && mouseX <= x + w 
    && mouseY >= y && mouseY <= y+h;
}

void checkMouseOver()
{
  //BRUSH 1
  if(mouseOver(10, 10, 30, 30))
  {
    fill(255);
    rect(10, 10, 30, 30);
  }
  
  else
  {
    fill(0);
    rect(10, 10, 30, 30);
  }
  
  fill(255, 0, 0);
  //ADD TEXT
  
  //BRUSH 2
  if(mouseOver(10, 50, 30, 30))
  {
    fill(255);
    rect(10, 50, 30, 30);
  }
  else
  {
    fill(0);
    rect(10, 50, 30, 30);
  }
  
  fill(255, 0, 0);
  //ADD TEXT
  
  //BRUSH 3
  if(mouseOver(10, 90, 30, 30))
  {
    fill(255);
    rect(10, 90, 30, 30);
  }
  else
  {
    fill(0);
    rect(10, 90, 30, 30);
  }
  
  fill(255, 0, 0);
  //ADD TEXT
  
  //ERASER
  if(mouseOver(10, 130, 30, 30))
  {
    fill(255);
    rect(10, 130, 30, 30);
  }
  else
  {
    fill(0);
    rect(10, 130, 30, 30);
  }
  
  fill(255, 0, 0);
  //ADD TEXT
}

void changeBrush()
{
  brush1 = false;
  brush2 = false;
  brush3 = false;
  eraser = false;
  
  if(mouseOver(10, 10, 30, 30))
  {
    brush1 = true;
  }
  
  else if(mouseOver(10, 50, 30, 30))
  {
    brush2 = true;
  }
  
  else if(mouseOver(10, 90, 30, 30))
  {
    brush3 = true;
  }
  
  else if(mouseOver(10, 130, 30, 30))
  {
    eraser = true;
  }
}
class Lightning
{
  int x1, y1, prevX, prevY, newX, newY, maxSize;
  
  Lightning(int firstX, int firstY, int size)
  {
    x1 = firstX;
    y1 = firstY;
    prevX = x1;
    prevY = y1;
    newX = 0;
    newY = 0;
    maxSize = size;
  }
  
  void update()
  {
    for(int c = 0; c < 6; c++)
    {
      newX = (int)random(-maxSize/2, maxSize/2);
      newY = (int)random(-maxSize/2, maxSize/2);
      
      line(prevX, prevY, prevX + newX, prevY + newY);
      prevX += newX;
      prevY += newY;
    }
    
    prevX = x1;
    prevY = y1;
  }
}


