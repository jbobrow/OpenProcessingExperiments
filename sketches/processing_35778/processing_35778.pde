
int x,y, x1, y1;
int a,b,a1,b1;

void setup()
{
  size(500,500);
  background(255);
  x1=250;
  y1=250;
  a1=250;
  b1=250;
  frameRate(100);
}
void draw()
{
  y=y1+(height/70)-int(random(height/33));
  x=x1+(width/70)-int(random(width/33));
  b=b1+(height/70)-int(random(height/33));
  a=a1+(width/70)-int(random(width/33));
  strokeWeight(2);
  stroke(255,0,0,100);
  line(x1,y1,x,y);
  stroke(0,0,255,100);
  line(a1,b1,a,b);
  stroke(128,0,230,25);
  line(a1,b1,x1,y1);
  x1=x;
  y1=y;
  b1=b;
  a1=a;
}
void mousePressed()
{
  background(255);
  x1=mouseX;
  y1=mouseY;
  a1=mouseX;
  b1=mouseY;
}



