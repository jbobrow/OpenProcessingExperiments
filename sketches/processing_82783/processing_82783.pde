
void setup()
{
  size(500,500);
  frameRate(8);
}
void draw()
{
  background(98,103,113);
 
 
  int b=1;
  while(b<=50)
  {
    float a=random(50);
        float l=random(50);
    fill(random(255),random(255),random(255));
    ellipse(int(random(500)),int(random(500)),a,a);
    b=b+1;
    
    fill(random(255),random(255),random(255));
        rect(int(random(500)),int(random(500)),l,l);
    
    
    
    
    
  }
}


