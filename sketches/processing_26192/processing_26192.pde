
int x=0;
int y=0;
int a=50;
int b=0;
int e=0;
int f=50;


void setup()
{
  size (500,500);
  smooth();
  frameRate (5);
}

void draw()
{
  for (int i=0;i< 10;i++)
  {
    for (int j=0;j< 10;j++)
    {
      fill (random (200+i*10),mouseY,mouseX);
      stroke (0,0,random (200));
      triangle (x+i*50,y+j*50,a+i*50,b+j*50,e+i*50,f+j*50);
     // fill (mouseX,mouseY,random (200+i*10));
      // stroke (random (200),mouseX,mouseY);
      triangle (x+i*50,y+j*50,a+i*50,b+j*50,e+i*50,f+j*50);
    }
   
  }
  x=50;
  y=50;
}
                
                
