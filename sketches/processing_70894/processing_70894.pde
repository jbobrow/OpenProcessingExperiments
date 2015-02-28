
int x = 0;
int y = 400;

int xo = 0;
int yo = 400;

void setup()
{
  size(1200, 800);
  noStroke();
  fill(0, 0, 0, 255);
  rect(0, 0, 1200, 800);
  frameRate(50);
}

void draw()
{  
  fill(0, 200, 50, 255);
  //ellipse(mouseX, mouseY, 20, 20);
  
  //Draw line
  for(int i = x + 2; x < i; x++)
  {
    size(1200, 800);
  
    noStroke();
    fill(0, 0, 0, 4);
    rect(0, 0, 1200, 800);
    
    if(x > 1200)
    {
      i = (i - x);
      x = 0;
      xo = 0;
    }
    
    //Calculate Y
    y = round(sin((float) x / 50) * 150 + 400);
    
    //Draw
    //ellipse(x, y, 5, 5);
    stroke(0, 200, 50, 255);
    fill(0, 200, 50, 25);
    strokeWeight(3);
    line(xo, yo, x, y);
    
    //Render grid
    noStroke();
    for(int gx = x - 40; gx < x + 40; gx += 4)
    { 
      for(int gy = y - 40; gy < y + 40; gy += 4)
      {
        ellipse(gx, gy, 2, 2);
      }      
    }
    
    //Set old X/Y
    xo = x;
    yo = y;
  }
}


