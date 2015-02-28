
float random1=random(10);
int count=0;



void setup()
{
  size(500,500);
  frameRate(3);
  smooth();
  
}
void draw()
{
 float random1=random(1,10);
 while(count<100)
 {
   ellipse(random(500),random(500),15,15);
   if (random1>5)
  {
    ellipse(random(500),random(500),40,40);
  }
   else
  {
    rect(random(500),random(500),25,25);
  }    
  count=count+1;
  fill(random(255),random(255),random(255));
  random1=random(1,10);
 }
}



