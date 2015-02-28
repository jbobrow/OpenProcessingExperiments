
float x =0.00;
int p= 1;

void setup()
{
	size(500,500);
        frameRate(x+20);
}



void draw()

{
  if (x>250)
{
  
  x=-x;
  {
    if (frameRate > 22)
    {
      exit();
      {
        if (p>20)
        {
          p=-p;
        }
      }
    }
  }
  
}
  fill(255);
  
  background(205);
 
  strokeWeight(p);

stroke(155);
 
  ellipse(250,250,x-100,x-100);
 
  fill(0,75,50,155);

  ellipse(250,250,x,x);
  x=x+10.25;
  p= p+1;
 
}




  

  
  



