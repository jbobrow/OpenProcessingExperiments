


void setup()
{
  size(500,500);
  background(0);
  smooth();
}

void draw()
{

}

void mousePressed()
{
  drawBranch(mouseX, mouseY, 0);
}

void keyPressed()
{
  if(key == ' ')
  {
    background(0);
  }
}

void mouseDragged()
{
  drawBranch(mouseX, mouseY, 0);
}

void drawBranch(float xx, float yy, int num)
{
  float degSplit;
  int length;
  
  if (num < 5)
  {
    num++;
    if (num < 5)
    {
      length = (75 - 10*num);
    }
    else
    {
      length = 10;
    }
    for (int i = 0; i < floor(num*1.95); i++)
    {
      strokeWeight(5 - num);
      if ( num < 5)
      {
          degSplit = radians(random(-15*(num*2.1),15*(num*2.1)));
      }
      else
      {
          degSplit = radians(random(0,360));
      }
      float xxf = length*sin(degSplit);
      float yyf = length*cos(degSplit);
      if (num == 5)
      {
        stroke(random(20,80), random(60,255), random(20,80)); 
      }
      else
      {
        int rcolor = int(random(50,255));
        stroke(rcolor,rcolor,rcolor);
      }
      line(xx, yy, xx-xxf, yy-yyf); 
      drawBranch(xx-xxf, yy-yyf, num);
    }
  
  }
}

