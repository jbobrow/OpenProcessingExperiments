
float[] xvals;
float[] yvals;

float[] xvels;
float[] yvels;

int i;
int j;
int k;

int num;
float distance;
float maxdist;
float speed;
float damp;

float dy;
float dx;
float mouseDistSq;
float mouseDistCu;
float dragPower;

float borderThickness;

void setup()
{
  size(400,300,P2D);
  borderThickness = 70;
  maxdist = 0;
  speed = 5;
  num = 3;
  dragPower = 50;
  arrayInit(num);
}

void keyPressed()
{
  if(keyCode == UP)
  {
    num += 1;
    arrayInit(num);
  }
  if(keyCode == DOWN)
  {
    if(num > 1)
    {
      num -= 1;
    }
    arrayInit(num);
  }
}

void arrayInit(int tempnum)
{
  maxdist = 0;
  num = tempnum;
  xvals = new float[num];
  yvals = new float[num];
  
  xvels = new float[num];
  yvels = new float[num];
  for(i = 0;i < num;i++)
  {
    xvals[i] = random(width-borderThickness*2)+borderThickness;
    yvals[i] = random(height-borderThickness*2)+borderThickness;
  }
  for(i = 0;i < num;i++)
  {
    xvels[i] = random(speed)-speed/2;
    yvels[i] = random(speed)-speed/2;
  }
}
void draw()
{
  noStroke();
  fill(255,0,0,10);
  rect(borderThickness,borderThickness,width-borderThickness*2,height-borderThickness*2);
  fill(255,255,255,100);
  rect(0,0,width,height);
  for(i = 0;i < width;i++)
  {
    for(j = 0;j < height;j++)
    {
      distance = 0.;
      for(k = 0;k < num;k++)
      {
        distance += dist(i,j,xvals[k],yvals[k]);
        if (distance > maxdist)
        {
          maxdist = distance;
        }
      }
      if(distance < maxdist/3)
      {
        stroke(255*2/maxdist*distance);
        point(i,j);
      }
    }
  }
  for(i = 0;i < num;i++)
  {
    noStroke();
    fill(255,0,0);
    rect(xvals[i],yvals[i],2,2);
  }
  for(i = 0;i < num;i++)
  {
    damp = 1.005;
    xvals[i] += xvels[i];
    yvals[i] += yvels[i];
    xvels[i] = xvels[i]/damp;
    yvels[i] = yvels[i]/damp;
    mouseDistSq = dist(mouseX,mouseY,xvals[i],yvals[i]);
    dx = mouseX-xvals[i];
    dy = mouseY-yvals[i];
    if(mousePressed)
    {
      if(mouseDistSq > 2)
      {
        if(mouseButton == LEFT)
        {
          xvels[i] += (dx)/pow(mouseDistSq,2)*dragPower/2;
          yvels[i] += (dy)/pow(mouseDistSq,2)*dragPower/2;
        }
        if(mouseButton == RIGHT)
        {
          xvels[i] -= (dx)/pow(mouseDistSq,3)*dragPower;
          yvels[i] -= (dy)/pow(mouseDistSq,3)*dragPower;
        }
      }
    }
    if(xvals[i] < borderThickness)
    {
      xvels[i] = -xvels[i];
      xvals[i] = borderThickness;
    }
    if(xvals[i] > width-borderThickness)
    {
      xvels[i] = -xvels[i];
      xvals[i] = width-borderThickness;
    }
    if(yvals[i] < borderThickness)
    {
      yvels[i] = -yvels[i];
      yvals[i] = borderThickness;
    }
    if(yvals[i] > height-borderThickness)
    {
      yvels[i] = -yvels[i];
      yvals[i] = height-borderThickness;
    }
  }
  
}

