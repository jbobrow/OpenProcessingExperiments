
int h1 = 0;
int h2 = 50;

void setup()
{
  size(700, 500);
  rectMode(CENTER);
  colorMode(HSB, 100);
}

void draw()
{
  background(0);
  noStroke();
  fill(h2, 100, 100);
  rect(200, 250, 300, 150);
  fill(h1, 100, 100);
  rect(500, 250, 300, 150);
  if (mouseX >= 50 && mouseX <= 350 && mouseY >= 175 && mouseY <= 325)
  {
    h2 = h2 + 1;
    h2 = h2 % 100;
  } else 
  {
    h2 = h2 + 0;
  }
  if (mouseX >= 350 && mouseX <= 650 && mouseY >= 175 && mouseY <= 325)
  {
    h1 = h1 + 1;
    h1 = h1 % 100;
  } else 
  {
    h1 = h1 + 0;
  }
}



