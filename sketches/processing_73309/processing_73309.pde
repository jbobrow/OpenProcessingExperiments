
//sides = number of sides
//x = x coor of center
//y = y coor of center
//d = distance of outer vertices from center
//d2 = distance of inner vertices from center
void drawPoly(int sides, int x, int y, int d, int d2)
{
  beginShape();
  for (int i = 0; i < sides; i++)
  {
    vertex(x + d*sin((2*PI)*i/sides), y + d*cos((2*PI)*i/sides));
    vertex(x + d2*sin(((2*PI)*i/sides)+(PI/sides)), y + d2*cos(((2*PI)*i/sides)+(PI/sides)));
  }
  endShape();
}

void setup()
{
  size(300, 300);
  background(255);
  fill(0);
  drawPoly(13, 150, 150, 90, 60);
}

void draw(){}
