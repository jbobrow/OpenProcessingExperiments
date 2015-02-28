
//Robert Wohlforth - rwohlfor
//Final Project 2 - "Tree"
//Copyright Pittsburgh 2012

//Generates a new tree each time the program is run.

float ptX[] = new float[1];
float ptY[] = new float[1];
float devX[] = {0};
int branch, interval;
float strokeX=15;

void setup ()
{size(500,500);
background (255,255,200);
ptX[0]=width/2;
ptY[0]=height;
stroke (0,200,0);
}

void draw ()
{drawPoints();
addPoints();
branching();
}

void drawPoints ()
{
for (int i = 0; i<branch; i++)
{if (strokeX > 0)
{strokeWeight(strokeX);
}
  if (ptX[ptX.length-1-i] < width-width/20 && ptX[ptX.length-1-i] > width/20)
{
 if (ptY[ptY.length -1- i] > height/20)
 {
  //line (ptX[ptX.length-(i-1)], ptY[ptY.length-1-(i-1)], ptX[ptX.length-1-i], ptY[ptY.length-1-i]);
  point (ptX[ptX.length-1-i], ptY[ptY.length -1- i]);
  }
  }
}
}

void addPoints()
{for (int i = 0; i <= branch; i++)
{
  ptX = append(ptX, ptX[ptX.length-1-i]+noise(ptX.length-1-i)*random(-map(ptX[ptX.length-1-i],0,width,0,.02),map(width-ptX[ptX.length-1-i],0,width,0,.02))+devX[i]);
ptY = append(ptY, ptY[ptY.length-1-i]+random(-1.2,.5));
}
}

void branching()
{interval++;
if(interval > 50)
{branch++;
devX = append(devX, random(-1,1));
  interval = 0;
}
for (int i = 1; i <= branch; i++)
{devX[i] = devX[i]*1.01;
}
strokeX=strokeX-.01;
}

