
PImage lena;
int inc1=0;
int inc2=0;
void setup()
{
size(600,600);
lena=loadImage("Lenna.jpg");
image(lena,0,0);
}
void draw()
{
  background(255);
  image(lena,inc1,inc2);
  inc1++;
  inc2++;
  if(inc1==100 && inc2==100)
  {
    noLoop();
  }
}

