
 void setup()
{
background(0);
frameRate(10);  
size(1000,1000);

}

void draw()
{
  background(random(255),random(255),random(255));
  int c=0; 
  while(c<33)
{
  float a=random(100);
  float b=random(100);
  fill(random(255),random(255),random(255));
  ellipse(int(random(1000)),int(random(1000)),a,a);
  ellipse(int(random(1000)),int(random(1000)),a,b);
  rect(int(random(1000)),int(random(1000)),a,b);
  c=c+1;
}
}


