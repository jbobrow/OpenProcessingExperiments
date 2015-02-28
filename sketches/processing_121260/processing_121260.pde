

void setup()
{
  size(500,500);
  background(25);
  noStroke();
  smooth();
}
void draw()
{
  frameRate(random(100000)); 
  int b=1;
  while(b<=5)
  {
    float a=random(100);
        float c=random(50);   
    fill(random(255),random(255),random(255));
    ellipse(int(random(500)),int(random(500)),a,a);
    b=b+1; 
    fill(random(255),random(255),random(255));
        rect(int(random(500)),int(random(500)),c,c); 
   
  }
}
