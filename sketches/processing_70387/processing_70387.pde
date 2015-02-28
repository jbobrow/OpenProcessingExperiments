
//Eric Trinh, EricsComets, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/EricsComets.html

int x = 40;
float y = 40.0;
int colour = 255;
void setup()
{
  size(400,400);
  background(0);
  stroke(206,182,46);
}
void draw()
{
  comet();
}
void comet()
{
  fill(0,0,0,20);
  rect(0,0,400,400);
  ellipse(x,y,40,40);
  x = x + 5;
  if(x >= 400)
  {
    x = x - x;
  }
  y = y + 4.5;
  if(y >= 400.0)
  {
    y = y - 400;
  }
}
