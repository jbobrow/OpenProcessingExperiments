
void setup() {
  size(900, 900);
  background(#000000);

}

  int R = 0;
  int G = 0;
  int B = 0;
  int GC = 0;
  int cir = 0;

void draw () {

if (frameCount < 255)
{
 R +=1;
 stroke (R,0,0);
}
else if (frameCount < (255 * 2))
{
 G +=1;
 stroke(0,G,0); 
}
else if (frameCount < (255 * 3))
{
 B +=1;
 stroke(0,0,B); 
}
else if (frameCount < (255 * 4))
{
 GC +=1;
 stroke(GC); 
}
else if (frameCount < 3550)
{
 cir +=1;
 ellipse(0,0,cir,cir); 
 frameRate(500);
}
else
{
 frameRate(60);
 fill(int(random(1,256)),int(random(1,256)),int(random(1,256)),int(random(1,256)));
 ellipse(int(random(0,height)),int(random(0,height)),50,50); 
}
for (int y=0; y<=300; y+=20)
{
  for (int x=0; x<=300; x+=20) 
  {
    line ( 100, frameCount, 100, frameCount);
    line ( frameCount, 200, frameCount, 200);
    line ( 300, frameCount, 300, frameCount);
    line ( frameCount, 400, frameCount, 400);
    line ( 500, frameCount, 500, frameCount);
    line ( frameCount, 600, frameCount, 600);
    line ( 700, frameCount, 700, frameCount);
    line ( frameCount, 800, frameCount, 800);
    line ( 900, frameCount, 900, frameCount);
    rotate (100);
    }
  }
println(frameCount);
}



