
int x = 150;
int y = 0;

void setup()
{
  size(300,300);
}

void draw()
{
  background(230);
  stroke(0);
  strokeWeight(2);
  fill(255,0,0);

  ellipse(x,y,30,30);

  y = y + 1;
  if(y>300) {
    y = 0;
  }
 }
