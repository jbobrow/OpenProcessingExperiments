
//Hyun Woo Jo
//hyunwooj@andrew.cmu.edu
//Copyright Hyun Woo Jo 2013 Mar

float x,y,s;

float [] deltaA = {random(1,3),random(1,3),random(1,3),
                   random(1,3),random(1,3),random(1,3),
                   random(1,3),random(1,3),random(1,3)};
  
float [] deltaB = {random(1,3),random(1,3),random(1,3),
                   random(1,3),random(1,3),random(1,3),
                   random(1,3),random(1,3),random(1,3)};

float [ ] xList = {random(0, 400),random(0, 400),random(0, 400),
                   random(0, 400),random(0, 400),random(0, 400),
                   random(0, 400),random(0, 400),random(0, 400)};
                   
float [ ] yList = {random(100, 400),random(100, 400),random(100, 400),
                   random(100, 400),random(100, 400),random(100, 400),
                   random(100, 400),random(100, 400),random(100, 400)};
float [ ] sizeList = {random(10, 90),random(10, 90),random(10, 90),
                      random(10, 90),random(10, 90),random(10, 90),
                      random(10, 90),random(10, 90),random(10, 90),};
color [ ] col = {color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)),
                 color(random(255), random(255), random(255)) };
void setup()
{
  size(400, 400);
  background (200,240,100);
  smooth();
}
 
void draw()
{
circles();
bounce();
}

void circles()
{
    for (int i = 0; i<xList.length; i++)
  {
    noStroke();
    fill(col [i]);
    s=sizeList[i];
    for (int a = 0; s>10 ; a = a+1)
    {  
      fill(random(255),random(255),random(255));
      x=xList[i]+a*2;
      y=yList[i]+a*2;
      s=sizeList[i]-a*2;
      ellipse(x,y,s,s);
    
    }
  }
}

void bounce() 
{
  for (int i=0; i<deltaA.length; i++)
  {
    xList[i] = xList[i] + deltaA[i];
    yList[i] = yList[i] + deltaB[i];
    if (yList[i]>height || xList[i]>width || yList[i]<0 || xList[i]<0)
    {
      deltaA[i] = -deltaA[i];
      deltaB[i] = -deltaB[i];
    }
  }
}
