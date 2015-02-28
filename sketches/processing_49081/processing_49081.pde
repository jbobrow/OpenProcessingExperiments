
int y;
int modulo;
int farbe;
void setup()
{
  background(255);
  size(500, 500);
  noLoop();
}

void draw()
{
  for(int i = 0; i < width*height; i++)
  {
    if(modulo >= width-1) y++;
    modulo = i % width;
    strokeWeight(random(10));
    farbe = (farbe+1) % 200;
    stroke(farbe);
    point(modulo, y);
    //println(modulo);
  }
}
    

