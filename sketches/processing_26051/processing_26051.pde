
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
}

void draw()
{
  for (int i=0;i< 10;i++)
  {
    for (int j=0;j< 10;j++)
    {
      fill (200,10+i*25,10+j*25);
      
      triangle (x+i*50,y+j*50,a+i*50,b+j*50,e+i*50,f+j*50);
      triangle (x+i*50,y+j*50,a+i*50,b+j*50,e+i*50,f+j*50);
    }
   
  }
  x=50;
  y=50;
}

                
                
