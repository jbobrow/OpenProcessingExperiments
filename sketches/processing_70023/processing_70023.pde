
int xPos[] = {30, 80, 40, 40, 50, 60, 70, 90, 80, 40};
int yPos[] = {70, 50, 90, 70, 70, 50, 100, 90, 60, 80};
int xVel[] = {2, 2, 3, 3, 4, 4, 5, 5, 6, 6};
int yVel[] = {6, 6, 5, 5, 4, 4, 3, 3, 2, 2};
int s[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 90};
int sVel[] = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3};

int W = 500;
int H = 500;

void setup()
{  
  size(500, 500);
  background(0);
  smooth();
}

void draw()
{
  
  fill(50, 20);
  rect(0, 0, W, H);
  for(int i = 0; i < 10; i++)
  {
    stroke(xPos[i] / 2 + random(sVel[i]), yPos[i] / 2 + random(sVel[i]), s[i] * 2 + random(sVel[i]), 255 + random(sVel[i]));
    noFill();
    switch(int(random(2))){
      case 0:
        ellipse(xPos[i], yPos[i], s[i], s[i]);
      break;
      case 1:
        rect(xPos[i] - s[i] / 2, yPos[i] - s[i] / 2, s[i], s[i]);
      break;
    }
    xPos[i] += random(xVel[i]);
    yPos[i] += random(yVel[i]);
  
    if (xPos[i] > W - s[i] / 2)
    {
       xPos[i] = W - s[i] / 2;
       xVel[i] *= -1;
    }
    if (xPos[i] < 0 + s[i] / 2)
    {
       xPos[i] = 0 + s[i] / 2;
       xVel[i] *= -1;
    }
    if (yPos[i] > H - s[i] / 2)
    {
       yPos[i] = H - s[i] / 2;
       yVel[i] *= -1;
    }
    if (yPos[i] < 0 + s[i] / 2)
    {
      yPos[i] = 0 + s[i] / 2;
      yVel[i] *= -1;
    }
  }
  
  for(int i = 0; i < 10; i++)
  {
    s[i] += sVel[i];
    if( s[i] >= 100 )
      sVel[i] *= -1;
    if( s[i] <= 10 )
      sVel[i] *= -1;
  }
  
}

