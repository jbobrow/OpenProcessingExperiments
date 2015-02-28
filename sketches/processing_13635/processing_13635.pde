
int b=50;
void setup() 
{
  size(200,200);
  background(0);
}
void draw() 
{
  for ( int y=0; y<200; y=y+50)
  {for ( int x=0; x<200; x=x+50)
  {
   float d=dist(x,y,100,100);
    fill(random(255),random(255),random(255));
    float c=(sin(d*10+b)+1)*100;
    stroke(c);
    rect(x+c,y+c,10,10);
  }
  }
  b=b+10;
}
