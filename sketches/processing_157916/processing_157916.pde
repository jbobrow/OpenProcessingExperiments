
void setup()
{
  size(500, 500, P3D);
  background(0);
  noStroke();
}


int num1 = 30;
int num2 = 60;

float mx1[] = new float[num1];
float my1[] = new float[num1];
float mx2[] = new float[num1];
float my2[] = new float[num1];
float mx3[] = new float[num1];
float my3[] = new float[num1];

float spin1 = 0;

int squareSize = 5;

void draw()
{  
  background(0);

  translate(width/2, height/2);
  
  int which = frameCount % num1;
  
  mx1[which] = (mouseX-width/2)*1.1;
  my1[which] = (mouseY-height/2)*1.1;
  
  for(int u = 0; u<num1; u++)
  {
    for (int i=1; i<num2; i++)
    {
      int index = (which+1+u) % num1;

      pushMatrix();
  
      rotateX(i*0.66+u*0.01+spin1);
      rotateY(i*0.25+u*0.01+spin1);
      rotateZ(i*0.06+u*0.01+spin1);    
      
      fill (255, 0, 0, map(u, 0, num1, 0, 200));
      ellipse(mx1[index],my1[index], squareSize, squareSize);
  
      popMatrix();
    }
    spin1+=0.0005;
  }
  
  mx2[which] = (mouseX-width/2)*1.2;
  my2[which] = (mouseY-height/2)*1.2;
  
  for(int u = 0; u<num1; u++)
  {
    for (int i=1; i<num2; i++)
    {
      int index = (which+1+u) % num1;

      pushMatrix();
  
      rotateX(i*0.25+u*0.01+spin1);
      rotateY(i*0.06+u*0.01+spin1);
      rotateZ(i*0.66+u*0.01+spin1);    
      
      fill (255, 0, 125, map(u, 0, num1, 0, 150));
      ellipse(mx2[index],my2[index], squareSize, squareSize);
  
      popMatrix();
    }
  }
  
  mx3[which] = (mouseX-width/2)*1.5;
  my3[which] = (mouseY-height/2)*1.5;
  
  for(int u = 0; u<num1; u++)
  {
    for (int i=1; i<num2; i++)
    {
      int index = (which+1+u) % num1;

      pushMatrix();
  
      rotateX(i*0.08+u*0.01+spin1);
      rotateY(i*0.66+u*0.01+spin1);
      rotateZ(i*0.25+u*0.01+spin1);    
      
      fill (255, 75, 125, map(u, 0, num1, 0, 100));
      ellipse(mx3[index],my3[index], squareSize, squareSize);
  
      popMatrix();
    }
  }
}  
