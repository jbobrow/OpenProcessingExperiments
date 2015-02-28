
/*
@author Neil 06/8/2013 homework7
 */

int ballNumber=200;
float[] posX=new float[ballNumber];
float[] posY=new float[ballNumber];
float[] speedX=new float[ballNumber];
float[] speedY=new float[ballNumber];




void setup()
{
  size(500, 500);
  noStroke();

  for (int i=0; i<ballNumber; i++) 
  {
    posX[i]=random(16, (width-15));
    posY[i]=random(16, (height-15));
    speedX[i]=random(-15, 15);
    speedY[i]=random(-15, 15);
    
  }
}

void draw()
{  
  background(0);

  
  for (int i=0;i<ballNumber;i++)
  {
    
    if (posX[i]>(width-15)||posX[i]<15)
    {
      speedX[i]=speedX[i]*-1;
    }
    if (posY[i]>(width-15)||posY[i]<15)
    {
      speedY[i]=speedY[i]*-1;
    }
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(posX[i], posY[i], 30, 30);
    posX[i]+=speedX[i];
    posY[i]+=speedY[i];
  }
}



