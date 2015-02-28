
//Paulina Kang, 4-5, Angry Robot
PImage b;
PImage a;
int x = 0;
int y = 0;
void setup()
{
  size(400, 500);
  b = loadImage("angryRobot.jpg");
  a = loadImage("ticklishPenguinImage.jpg");
}

void draw()
{
  background(205);
  if (mousePressed == true)
  {
    image(b, x, y, 401, 501);
    x = x + int(random(-5, 5));
    y = y + int(random(-3,3));
  }
  else
  {
   image(a,x,y,401,501);
  }
}
