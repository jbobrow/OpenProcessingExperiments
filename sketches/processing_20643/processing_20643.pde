
class head
{
float x;
float y;


head(float xStart, float yStart)
{
  x = xStart;
  y = yStart;
 /* beginShape();
  vertex (x,y);
  vertex (100,100);*/
  line(x,y, 100,100);
}
}

