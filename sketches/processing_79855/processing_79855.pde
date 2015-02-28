
int diameter = 5;
int y = 0;
int x = 0;
int x1 = 300;
int y1 = 300;
int diameter2 = 0;

void setup()
{
size(300,300);
noFill();
frameRate(10);
}
void draw()
{
  stroke(#000AFF);
  strokeWeight(2);
  ellipse(150,150,diameter,diameter);
  stroke(#FFD900);
  strokeWeight(5);
  ellipse(x,y, diameter, diameter);
  stroke(#FF0000);
  strokeWeight(5);
  ellipse(x1, y1 , diameter, diameter);
  y = y + 10;
  x = x + 10;
  x = x - 10;
  y = y - 10;
  diameter = diameter + 10;
  if (x > 300 ) noLoop ();

}  



