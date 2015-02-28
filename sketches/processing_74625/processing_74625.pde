
int count = 0;
void setup()
{
  size(600,600,P3D);
  background(255);
}
void draw()
{
  translate(300,300,500);
  while(count<101)
  {
    translate(int(random(-50,50)),int(random(-50,50)),-count);
    noStroke();
    fill(0,int(random(0,255))*175/255,int(random(0,255)),100);
    sphere(20);
    count=count+1;
  }
}
