
int x = 50;
int y = 50;

void setup ()
{
  size(500, 500);
  background(255);
  smooth();
}

void draw ()
{
  background(255);
  line(x +100, mouseY, x + 300, mouseY);
  line(mouseY, y + 100, mouseY, y + 300);
  line(x + 100, 500 - mouseY, x + 300, 500 - mouseY);
  line(500 - mouseY, y + 100, 500 - mouseY, y + 300);
  line(mouseY, y +100, mouseX, y + 100);
  line(x + 100, mouseY, mouseX, y + 100);
  line(x + 300, mouseY, x + 300, mouseX);
  line(x + 300, mouseX, 500 - mouseY, y + 100);
  line(500 - mouseX, y + 300, 500 - mouseY, y + 300);
  line(500 - mouseX, y + 300, x + 300, 500 - mouseY);
  line(x + 100, 500 - mouseX, x + 100, 500 - mouseY);
  line(mouseY, y + 300, x + 100, 500 - mouseX);
  line(mouseX, y + 100, 500 - mouseX, y + 300);
  line(x + 100, 500 - mouseX, x + 300, mouseX);
  
  println(mouseX);
}


