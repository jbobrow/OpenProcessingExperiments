
int x = 0;
int y = 0;
int r = 255;
int g = 255;
int b = 255;
void setup()
{
  size(500,500);
  background(0,0,0);
}
void draw()
{
  
  while (x<500)
  {

    stroke(0,0,0);
    fill(r,g,b);
    ellipse(x,y,10,10);
    y += 5;
    if (y == 500)
    {
      y = 0;
      x += 5;
      r -= 2;
      g -= 2;
      b -= 2;

    }
    
  }

  fill(255);
  ellipse(mouseX,mouseY,25,25);
  if (mouseButton == LEFT)
    {
 
        
      fill(random(255),random(255),random(255));
      ellipse(mouseX,mouseY,25,25);
      
    } 
  if (keyPressed) 
    {
      if (key == 'b' || key == 'B') 
      {
        fill(mouseX-100,mouseX-100,mouseX-100);
        ellipse(mouseX,mouseY,25,25);        
      }
      if(key == 'v' || key == 'V')
      {
        fill(400-mouseX,400-mouseX,400-mouseX);
        ellipse(mouseX,mouseY,25,25);        
      }

    }
}
void mousePressed()
{
  if (mouseButton == LEFT)
  { 
    float x = 0;
    while (x<500)
    {
      stroke(0,0,0);
      fill(random(255),random(255),random(255));
      ellipse(x,y,10,10);
      y += 5;
      if (y == 500)
      {
        y = 0;
        x += 5;
      }
    }  
  }         
}
void mouseReleased()
{
setup();
int x = 0;
int y = 0;
int r = 255;
int g = 255;
int b = 255;             
draw();
{
  while (x<500)
  {

    stroke(0,0,0);
    fill(r,g,b);
    ellipse(x,y,10,10);
    y += 5;
    if (y == 500)
    {
      y = 0;
      x += 5;
      r -= 2;
      g -= 2;
      b -= 2;
    }
  }
  for(y = 25; y<height; y +=50)
    for (x = 25; x<width; x += 50)
    {
    fill(random(255),random(255),random(255));
    ellipse(x,y,random(25),random(25));
    r += 1;
    g += 1;
    b += 1;   
    }    
}
}
