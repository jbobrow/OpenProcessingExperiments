
int w = 400;
float c;
int rand;
void setup()
{
  size(400,400);
  for(int i = 0; i < w*w; i++)
  {
    if((i)%int(random(100)+1) == 0)c = norm(i%w+i/w * w, 0.0, w*w)*255;
    set(i%w, i/w, color(c));
  }
}

void draw()
{
  for(int i = 0; i < w*w; i++)
  {
    int dirX = int(norm(mouseX, 0.0, i%w));
    int dirY = int(norm(mouseY, 0.0, i/w));
    int randX = round(random(-2,2));
    int randY = round(random(-2,2));
    set(i%w, i/w, get(i%w + randX + dirX, i/w + randY + dirY));
  }

}

void mousePressed()
{
  setup();
}

