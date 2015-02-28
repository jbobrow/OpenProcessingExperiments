
void setup()
{
  size(400,400);
  background(255);
  smooth();
 
}
int x=0;
int speed=100;
void draw()
{ 
    frameRate(10);
  
for(int i = 10; i <= 399; i += 10) 
{
     for(int j = 10; j <= 399; j += 10) 
         {
           stroke(random(200,255), random(200.255), random(200.255));
           strokeWeight(5);
           point(i, j); 
         }
}
}
