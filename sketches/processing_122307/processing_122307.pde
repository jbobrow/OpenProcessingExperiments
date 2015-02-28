
int fase=1;
int puntoActual=0;
float xCasa[], yCasa[];

void setup()
{
  size(600,600);
  background(255);
  xCasa=new float[9];
  yCasa=new float[9];
  for (int i=0; i<9; i=i+1)
  {
    xCasa[i]=random(600);
    yCasa[i]=random(600);  
  }
}

void draw()
{
  background(255);
  for (int i=0; i<9; i=i+1)
  {
    ellipse(xCasa[i], yCasa[i], 10,10);  
  }
  if (fase==1)
  {

  }
  else if (fase==2)
  {
  
  }  
  else if (fase==3)
  {
    
  }
}

void mousePressed()
{
  if (fase==1)
  {  
    if ((puntoActual==0)&&(dist(mouseX,mouseY, xCasa[1], yCasa[1])<10))
    {
    }  
  }
  else if (fase==2)
  {
  }
}
