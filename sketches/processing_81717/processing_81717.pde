
PImage b;
PImage a;
PImage c;
void setup()
{
size(600,600);
b = loadImage("palm.jpg");
a = loadImage("cactusman.jpg");
c = loadImage("Sun.jpg");
}
void draw()
{
image(b, 0, 0,400,600);
image(a, 300, 300,300,300);
image(c,400,0,400,300);
 int x=300;
 int y=300;
 int r=int (random(4));
if (mousePressed==true)
 {
   
   if (r==1)
  {
  image(a, x+10, y+10,300,300);
  }
  if (r==2)
  {
  image(a, x, y+15,300,300);
  }
  if (r==3)
  {
  image(a, x, y-10,300,300);
  }
  if (r==0)
  {
  image(a, x-10, y+10,300,300);
  }
 }
 }


