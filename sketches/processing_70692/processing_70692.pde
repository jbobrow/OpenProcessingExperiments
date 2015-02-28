
//Tina L., CP1 14/15, Functions and Animations
int x = 0;
void setup()
{
  size(320, 300);
  background(0);
  textSize(20);
  stroke(255);
}
void draw()
{
  bar();
  loading();
  ninetynine();
}
void bar()
{
  if (x < 298)
  {
    fill(255);
    rect(10, 180, x, 20);
    x = x + 1;
  }
}
void loading()
{
  text("Loading...", 115, 225);
}
void ninetynine()
{
    frameRate(50);
    stroke(0);
    fill(0);
    rect(120,145,120,20);
    fill(255);
    text(int(x/3), 140, 165);
}
