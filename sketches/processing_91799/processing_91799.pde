
float x, y, xSpeed, ySpeed;
float lastry, lastrb;
int rx = 15;
int ry = 195;
int rb = 195;
int cntr = 0;
int i = 3;
int miss = 0;

 
void setup()
{
  size(600,400); 
  smooth();
  fill(0);
  x = width/2;
  y = height/2;
  xSpeed = 1.2;
  ySpeed = .9;
   
 }
 
void draw()
{ 
  background(200);
  strokeWeight(2);
  line(0,30, width,30);
  x += xSpeed; 
  y += ySpeed; 
   

equip(); 
crash();
rightRacket();
leftRacket();

}
 
void equip()
{
  strokeWeight(0);
  
  fill (255,0,0);
  rect(width-(rx+5),rb, 5,50); 
  fill (0,255,0);
  ellipse(x, y, 10, 10);  
}
 

 
void crash()
{
  if(rx+7 >=x && (mouseY <= y && mouseY+10 >=y)) 
  {
    xSpeed = -xSpeed - .3; 
    cntr++;  
    if(ySpeed > 0 && lastry > ry)
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && lastry < ry)
    {
      ySpeed = -ySpeed;
    }
  }
   
  if((width-rx)-6 <= x && (rb <= y && rb+10 >=y)) 
  {
    xSpeed = -xSpeed - .3; 
    cntr++;  
    if(ySpeed > 0 && lastrb > rb)
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && lastrb < rb)
    {
      ySpeed = -ySpeed;
    }
  }
  if(rx+7 >=x && (ry+10 < y && ry+20 >=y))
  {
    xSpeed = -xSpeed - .15; 
    cntr++;  
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+10 < y && rb+20 >=y))
  {


    xSpeed = -xSpeed - .15; 
    cntr++;  
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  if((rx+7 >=x && (ry+20 < y && ry+30 >=y)))
  {
    xSpeed = -xSpeed; 
    cntr++;  
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+20 < y && rb+30 >=y))
  {


    xSpeed = -xSpeed; 
    cntr++;  
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  if((rx+7 >=x && (ry+30 < y && ry+40 >=y)))
  {
    xSpeed = -xSpeed + .15; 
    cntr++;  
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+30 < y && rb+40 >=y))
  { 
    xSpeed = -xSpeed + .15; 
    cntr++;  
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  if((rx+7 >=x && (ry+40 < y && ry+50 >=y)))
  { xSpeed = -xSpeed + .3; 
    cntr++;  
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+40 < y && rb+50 >=y))
  { xSpeed = -xSpeed + .3; 
    cntr++;  
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
   
  if(y >= height-5 || y <= 35)
  {
    ySpeed = -ySpeed; 
 }
  if (x <= -5) 
  {
    xSpeed=0;
    ySpeed=0;
      }
    launchLeft();  
  
  if ( x >=width+5) 
  {
    xSpeed=0;
    ySpeed=0;   
      }
    launchRight();  
  }

void rightRacket()
{fill (0,0,255);
stroke(5);
rectMode(CENTER);
rect(rx, mouseY, 5, 50);
}
 
void leftRacket()
{
  if(keyPressed) 
  {
    if (key == CODED)
    {
      if(keyCode == UP)
      {
        lastrb = rb;
        rb=rb-2;
        if (rb <= 55) 
        {
          rb = rb+2;
        }
      }
    }
  }
  if(keyPressed) 
  {
    if (key == CODED)
    {
      if(keyCode == DOWN)
      {
        lastrb=rb;
        rb=rb+2;
        if (rb >= height-10) 
        {
          rb=height-12;
        }
      }
    }
  } 
}
 
void launchRight() 
{
  if(keyPressed)
  {
    if (key == ' ')
    {
      x = width/2;
      y = height/2;
      i = 3;
      cntr = 0;
      xSpeed = -1.2;
      ySpeed = .9;
      miss = 0;
    }
  }
}
 
void launchLeft() 
{
  if(keyPressed)
  {
    if (key == ' ')  
    {
      x = width/2;
      y = height/2;
      i = 3;
      cntr = 0;
      xSpeed = 1.2;
      ySpeed = .9;
      miss = 0;
    }
  }
}
 
void stop()
{



  super.stop();
}
