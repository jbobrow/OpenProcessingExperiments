
int minW=60;
int minH=60;
int maxW=100;
int maxH=100;
int inc = 2;

int sandCol;
int oceanCol;
int sunCol;

float x;
float y;
int rW;
int rH;

color [] sandArray = {
color(231,196,154),
color(236,214,164),
color(173,154,111),
color(245,241,232),
};

color [] oceanArray = {
color(16,127,201),
color(14,78,173),
color(11,16,140),
};

color [] sunArray = {
color(255,171,3),
color(252,127,3),
color(252,57,3),
};

void setup()
{
  size(600,600);
  background(255,255,255);
    rW=minW;
    rH=minH;
}

void draw()
{
}

void mouseDragged()
{
  sandCol = sandArray[(int)random(0,3)];
  oceanCol = oceanArray[(int)random(0,2)];
  sunCol = sunArray[(int)random(0,3)];
  
  noStroke();
  if(y > (width*0.65))
  {
    fill(sandCol);
  } else if ((height*0.25) < x && x < (height*0.75) && y < (width*0.25))
    {
     fill(sunCol); 
    }
    else if (y < (width*0.25))
    {
     fill(7,9,61); 
    }
    else
    {
    fill(oceanCol);
    }
  x=random(mouseX-20,mouseX+20);
  y=random(mouseY-20,mouseY+20);
  rect(x,y,rW,rH);
    rW+=inc;
    rH+=inc;
      if ((rW > maxW || rW < minW) && (rH > maxH || rH < minH))
      {
        inc =- inc;
      }
}


