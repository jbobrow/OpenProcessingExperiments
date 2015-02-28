

PImage b;
PImage l;

int p;

void setup()
{
  size (450,600);
  
  b = loadImage("Limes_Guy.jpg");
  l = loadImage("lime.jpg");
}
void draw()
{
  frameRate(.5);
  image(b,0,0,450,600);
  int num = 1;
  float combobreaker = pow(2,p);
  while (num <= combobreaker)
  {
    image(l,random(430),random(575),35,40);
    num++;
  }
  p++;
  if (combobreaker > 1025)
  {
   p=0;
  }
  
fill(255,0,0);
textSize(60);
text(combobreaker,288,596);
}


