
int i;
void setup()
{
  size(400,400);
}
void draw()
{
 
 background(0);
fill(255,100,0);
for(i=0;i<100;i++)
{
  ellipse(i*20,i*20,random(0,30),random(0,30)); 
}
}
