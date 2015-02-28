
//Martin C, Ticklish Penguin, CP1, Mods 4-5

PImage bush1;
PImage bush2;
int x = 250;
int y = 250;
int jump = 2;

void setup()
{
  background(255);
  size(500, 500);
  strokeWeight(5);
  bush1 = loadImage("bush1.png");
  bush2 = loadImage("bush2.png");
}

void draw()
{
  background(255);
  fill(0);
  text("Press 1-5 to change speed!", 10,15);
  text("Click to tickle Bush!", 10, 30);
  if (mousePressed)
  {
    image(bush2, x-67, y-166, 134, 191);
    line(x, y+19, x, y+100);
    line(x, y+50, x+30, y+20);
    line(x, y+50, x-30, y+20);
    line(x, y+100, x+30, y+80);
    line(x, y+100, x-30, y+80);
    x = x + int(random(-jump, jump));
    y = y + int(random(-jump, jump));
  } 
  else {
    image(bush1, x-67, y-152, 134, 168);
    line(x, y+10, x, y+100);
    line(x, y+40, x+30, y+60);
    line(x, y+40, x-30, y+60);
    line(x, y+100, x+30, y+120);
    line(x, y+100, x-30, y+120);
  }

  if (key == '1')
  {
    jump = 2;
  }
  if (key == '2')
  {
    jump = 4;
  }
  if (key == '3')
  {
    jump = 8;
  }
  if (key == '4')
  {
    jump = 10;
  }
  if (key == '5')
  {
    jump = 20;
  }
}
