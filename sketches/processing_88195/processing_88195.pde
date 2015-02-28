
void setup()
{
  size(600,600);
}

void draw ()
{
  int x=0;
  int y=0;
  
   

  for(int i=0;i<width;i+=8)
  {
    for(int j=0;j<height;j+=8)
    {
      fill(255,0,0);
    ellipse(i,j,20,20);
    line(i,j,600,0);
    line(i,j,0,0);
    fill(72,53,0);
      ellipse(0,0,250,250);  

    }
  }



}


