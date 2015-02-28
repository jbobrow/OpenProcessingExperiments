
int x,y, x1, y1;

void setup()
{
  size(500,500);
  background(255);
  x1=250;
  y1=250;
  frameRate(100);
}
void draw()
{
  y=y1+(height/70)-int(random(height/33));
  x=x1+(width/70)-int(random(width/33));
  strokeWeight(2);
  fill(0);
  line(x1,y1,x,y);
  x1=x;
  y1=y;
}
void mousePressed()
{
  background(255);
  x1=mouseX;
  y1=mouseY;
}



