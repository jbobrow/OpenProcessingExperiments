
PImage image1;
PImage image2;

boolean testX;
boolean testY;

int x;
int y;
int z;

void setup()
{
  image1 = loadImage("InkBlob1.png");
  image2 = loadImage("Mask1.png");
  size(878, 911);
  background(205);

  testX = true;
  testY = true;

  int x = 200;
  int y = 20;
  int z = 1;

  noStroke();
}

void draw()
{
  if (keyPressed)
  {
    if (key == '1')
    {
      z = 1;
    }
  }

  if (keyPressed)
  {
    if (key =='2')
    {
      z = 2;
    }
  }
  if (keyPressed)
  {
    if (key == '3')
    {
      z = 3;
    }
  }

  if (z == 1)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      fill(x, x, y*2, y);
      ellipse(mouseX, mouseY, 30, 30);
    }
  }
  if (z == 2)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      image(image2, 0, 0);
    }
  }
  if (z == 3)
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      image(image1, mouseX, mouseY, width/12, height/12);
      image(image1, mouseX, 911- mouseY, width/12, height/12);
      image(image1, 878 - mouseX, mouseY, width/12, height/12);
      image(image1, 878 - mouseX, 911 -mouseY, width/12, height/12);
    }
  }


  if (testX == true)
  {
    x++;
  }
  if (testX == false)
  {
    x--;
  }
  if (x == 255)
  {
    testX = false;
  }
  if (x == 0)
  {
    testX = true;
  }
  if (testY == true)
  {
    y++;
  }
  if (testY == false)
  {
    y--;
  }
  if (y == 255)
  {
    testY = false;
  }
  if (y == 0)
  {
    testY = true;
  }
}


