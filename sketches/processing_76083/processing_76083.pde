
int hurdur=1;  
void setup()
{
  size(500,500);
  frameRate(2);
}
 
void draw()
{
  background(0);
  for(int beep=1; beep<=hurdur;beep++)
  {
  fill(random(255), random(255), random(255), random(255));
  ellipse(random(500), random(500),random(100),random(100));
  triangle(random(500), random(500),random(500), random(500),random(500), random(500));
  }
  hurdur= hurdur*2;
 if (hurdur>=400)
 {
   hurdur=1;
 }
}
