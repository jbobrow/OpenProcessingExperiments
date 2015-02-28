
float incc;
void setup()
{
  size(400,400);
  background(0);
  strokeWeight(1);
  smooth();
  incc=0;
}
 
void draw()
{
  background(255);
   fill(255,0,0);
   stroke(255,0,0);
  packman(100,100,100,100,incc);
  fill(0,255,0);
  stroke(0,255,0);
  packman(100,300,40,40,incc);
  fill(0,0,255);
  stroke(0,0,255); 
  packman(200,270,30,30,incc); 
//  ghost(incc,100);
   incc+=0.01;
}
 
void packman(int x,int y,int rad1,int rad2,float inc)
{
  arc(x,y,rad1,rad2,0,inc);
}
 
void ghost(int x,int y)
{
  PImage ghost;
  ghost=loadImage("fantasma.png");
  image(ghost,x,y);
}

