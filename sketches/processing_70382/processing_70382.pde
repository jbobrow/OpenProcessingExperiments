
//Dan-Tran Cong-Huyen, Functions and Animations, CP1 16/17
int w = 5;
int x = 5;
float r = 0;
float g = 255;
float b = 0;
void setup()
{
  size(600,500);
  background(129,186,216);
  noFill();
}
void draw()
{
  ellipse(x,200,w ,w);
  w = w + 5;
  x = x + 5;
  stroke(219 + r, 201 - g, 219 + b);
  r = r + 255/59.0;
  g = g - 255/59.0;
  b = b + 255/59.0;
  if(w > 400)
  {
    x = 5;
    w = 5;
    background(129,186,216);
    b = 0;
    r = 0;
    g = 255;
  }
}
