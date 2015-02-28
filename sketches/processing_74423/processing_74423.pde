
//Dan-Tran Cong-Huyen, One Hundred Random Shapes, CP1 16/17
void setup()
{
  size(500,500);
  noStroke();
  frameRate(5);
}
void draw()
{
  background(188,185,180);
  int x = 1;
  while(x <= 140)
  {
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(500)),int(random(500)),25,25);
    x++;
  }    
}
