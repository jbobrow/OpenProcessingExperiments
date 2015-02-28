
/*
@author Neil 07/8/2013 homework7
 */

int ballNumber=20;
float[] posX=new float[ballNumber];
float[] posY=new float[ballNumber];
float[] speedX=new float[ballNumber];
float[] speedY=new float[ballNumber];

int diameter=20;

float gravity=0.08;






void setup()
{
  size(500, 500);
  noStroke();
  smooth();
  
  for (int i=0;i<ballNumber;i++)
  {
     posX[i]=-20; 
  }
  
}

void draw()
{  
  background(0);


  for (int i=0;i<ballNumber;i++)
  {
    
    posX[i]+=speedX[i];
    posY[i]+=speedY[i];
    speedY[i]+=gravity;
    
    
    
    
    fill(255);
    ellipse(posX[i], posY[i], diameter, diameter);
    
    
    

    for (int j=0;j<ballNumber;j++)
    {  
      if (i!=j)
      {
        if (dist(posX[i], posY[i], posX[j], posY[j])<diameter-2)
        {
          speedX[i]=speedX[i]*-1;
          if(posY[i]>posY[j])
          {
            speedY[i]=speedY[i]*-1;
          }
          
          
        }
      }
    }

    if (posX[i]>(width-diameter/2)||posX[i]<(diameter/2))
    {
      speedX[i]=speedX[i]*-1;
    }
    if (posY[i]>(width-diameter/2))
    {
      speedY[i]=speedY[i]*-1;
    }
  }
}

void mouseReleased()
{
  for(int i=0;i<ballNumber;i++)
  {
    posX[i]=random((diameter/2),(width-diameter/2));
    posY[i]=mouseY;
    speedX[i]=random(-2,2);
    speedY[i]=random(3,7);
//    fireColors[i]=color(random(120,360),255,255,150);
  }
}



