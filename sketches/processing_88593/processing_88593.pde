
void setup()
{
  size(600,600);
}
 
void draw ()
{
  background(255);
  
  
 rec(5,width,height);

}

void rec(int n,float w,float h)
{
  if(n > 0)
  {
    for(int i = 0; i <= 4; i++)
    {
      for(int j = 0; j <= 4; j++)
      {
         stroke(255/(n+1),255/(n+1),255/(n+1));
         line(w + i * w/4, h + j * h/4,w + w/2,h + h/2);
      }
    }
     rec(n-1,w/2,h/2);
     rec(n-1,w * 1.5,h * 1.5);
     rec(n-1,w * 1.5,h/2);
     rec(n-1,w/2,h * 1.5);
  }
}


