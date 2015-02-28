
//Jarvis Law,Doubling Shapes,CP1 mods 16-17
int c=1;
void setup()
{
  background(0);
  size(500,500);
  frameRate(1);

}
void draw()
{
  
  int r=int(random(1,256));
  int g=int(random(1,256));
  int b=int(random(1,256));
  strokeWeight(2);
  stroke(255-r,255-g,255-b);
  background(0);
  int a=1;
  while (a<=c)
  {
    fill(r,g,b,50);
    ellipse(int(random(50,401)),int(random(50,401)),80,80);
    fill(b,r,g,50);
    rect(int(random(50,401)),int(random(50,401)),70,70);
    a=a+1;
  }
   if (a>= c)
  { 
    c=c*2;
  }
  if (c==1024)
  {
    a=1;
    c=1;
  }
}
