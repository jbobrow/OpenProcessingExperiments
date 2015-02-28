
float t;



void setup()

{ 
  size(550, 550);
  smooth();
}




void draw()
{
  background(255);
  noStroke();
  
  
  

  
  



 for (int i=1; i<50; i++) 
  {
    for (int j=1; j<50; j++) 
    {
      int x = i*11;
      int y = j*11;
      int d = 10;

      
      
      if (sourisTouche(x, y, d))
      {  
        if (mousePressed)
        {  
           fill(255,0,0);
           
           ellipse(mouseX, mouseY, 40, 40);
         }
         
        else  circle(x, y, 30);
      } 
      
     else
     
     {
      fill(210, 0, 0, 50);
      }
      
      
      ellipse(i*11, j*11, 10, 10);
    }
  }


}





boolean sourisTouche(int x, int y, int d) 
{
  float r= d/2.0;
  float distance = dist(x, y, mouseX, mouseY);

  if (distance<r) return true; 
  else return false;
}

/*
void mousePressed()
{
  color c=get(mouseX, mouseY);

  if (red(c)>0)
    circle(mouseX, mouseY);
}
*/

void circle(float a, float b, float r)

{

  if (t<TWO_PI)

  {
    t+=0.8;
  }

  else

  { 
    t=0.0;
  }


  //float r=20.0;

  //in an x–y cartesian coordinate system, the circle with 
  //centre coordinates (a, b) and radius r is the set of all points (x, y) 

  float x=a+r*cos(t);
  float y=b+r*sin(t);
  
      
  fill(255, 0, 0);
  
  
  ellipse(x, y, 10, 10);
}


void keyReleased()
{
  
  
  
  
}
  

