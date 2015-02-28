
int count = 0;
int blah = 1;
void setup()
{
  size(600,600,P3D);
  frameRate(1);
}
void draw()
{
  count=0;
  background(255);
  translate(300,300,200);
  while(count<blah)
  {
    translate(int(random(-50,50)),int(random(-50,50)),-count);
    noStroke();
    fill(0,int(random(0,255))*175/255,int(random(0,255)),100);
    sphere(20);
    count=count+1;
  }
  blah=blah*2;
}
