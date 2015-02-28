
import gifAnimation.*;
Gif sonicRunGIF;
Gif sonicRunGIF2;
PImage land;
PImage tree;

float brushMode=1;
float rad=15;
float r=255;
float g=0;
float b=0;
float colorRandom=0;
float canRun=1;
float k=0;
float create=1;
float whichSonic=0;
float timer=0;
float mode2Selection=0;

void setup()
{
  size(500,500);
  background(255);
  land = loadImage("Land.PNG");
  tree = loadImage("tree.PNG");
  sonicRunGIF = new Gif(this, "Sonic.gif");
  sonicRunGIF2 = new Gif(this, "SonicRunGIF.gif");
}

void draw() 
{
  noStroke();
  if (keyPressed) 
  {
    if (key == 'q' || key == 'Q') 
    {
      rad=15;
    }
    if (key == 'w' || key == 'W')
    {
      rad=30;
    }
    if (key == 'e' || key == 'E')
    {
      rad=45;
    }
    if (key == '1') 
    {
      brushMode=1;
    }
    if (key == '2') 
    {
      brushMode=2;
    }
    if (key == '3') 
    {
      brushMode=3;
    }
    if (key == 'r') 
    {
      r=255;
      g=0;
      b=0;
      colorRandom=0;
    }
    if (key == 'g') 
    {
      r=0;
      g=255;
      b=0;
      colorRandom=0;
    }
    if (key == 'b') 
    {
      r=0;
      g=0;
      b=255;
      colorRandom=0;
    }
    if (key == 'f') 
    {
      colorRandom=1;
    }
    if (key == 'o') 
    {
      whichSonic=0;
    }
    if (key == 'p') 
    {
      whichSonic=1;
    }
    if (key == '[') 
    {
      mode2Selection=0;
    }
    if (key == ']') 
    {
      mode2Selection=1;
    }
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brushMode==1)
      {
        
        if(colorRandom==1)
        {
          fill(random(255),random(255),random(255));
        }
        else
        {
          fill(r,g,b);
        }
        ellipse(mouseX, mouseY, rad, rad);
      }
      //
      if (brushMode==2)
      {
        if(timer==0)
        {
          timer++;
          if(mode2Selection==0)
          {
            translate(-73,-33);
            image(land,mouseX,mouseY);
          }
          else if(mode2Selection==1)
          {
            translate(-39,-193);
            image(tree,mouseX,mouseY);
          }
          if(timer==30)
          {
            timer=0;
          }
        }
      }
      //
      if (brushMode==3)
      {
        canRun=1;
        if(whichSonic==0)
        {
          for(int i=0; i<90; i++);
          {
            k++;
            translate(-k*4,0);
            fill(255,255,255);
            ellipse(mouseX,mouseY,80,45);
            image(sonicRunGIF,mouseX-20,mouseY-20);
            if(canRun==1)
            {
              sonicRunGIF.play();
              canRun=0;
            }
            translate(k*4,0);
          }
        }
        if(whichSonic==1)
        {
          for(int i=0; i<90; i++);
          {
            k++;
            translate(k*10,0);
            fill(255,255,255);
            ellipse(mouseX,mouseY,70,45);
            image(sonicRunGIF2,mouseX-20,mouseY-20);
            if(canRun==1)
            {
              sonicRunGIF2.play();
              canRun=0;
            }
            translate(-k*10,0);
          }
        }
      }
    }
  }
}
void mouseReleased()
{
  k=0;
  timer=0;
}

