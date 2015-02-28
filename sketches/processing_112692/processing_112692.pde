
void setup ()
{
size (500, 500);
background (255);
}
void draw ()
{
int r = 200;
int g = 200;
int b = 100;
birthdayHat(0, 0, r, g, b);
}

void birthdayHat (int x, int y, int red, int green, int blue)
{
  fill(red, green, blue); 
  triangle (x + 45, y + 10, x + 10, y + 60, x + 90, y + 60);
  ellipse (x + 45, y + 10, 20, 20);
}

void mousePressed()
{
int r = 200;
int g = 200;
int b = 100;
birthdayHat (mouseX, mouseY, r, g, b);
}
