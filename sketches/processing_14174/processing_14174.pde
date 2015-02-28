
int c=0;

void setup()
{
   size(300,300);
   stroke(0,50);
   background(255);
}

void draw()
{
  int i;
  
  if(c % 50 == 0)
  {
    for(i=5;i>0;i--)
    {
      ellipse(mouseX, mouseY, i * 5, i * 5);      
    }
  }
  
  line(150,150,mouseX,mouseY);  
  
  c++;
}
                
