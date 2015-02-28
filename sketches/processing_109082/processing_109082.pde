
int posx=150;
int posy=150;

void setup()
{
  size(300,300);
}
void draw()
{
   drawCircle();
}

void drawCircle()
{
  stroke(150,50,50);
  fill(0,0,0,1);
  ellipse(posx,posy,50,50);
  stroke(50,150,50);
  fill(255,150,50);
  ellipse(170,150,50,50);
}


