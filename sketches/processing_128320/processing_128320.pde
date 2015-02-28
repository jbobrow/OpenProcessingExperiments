
// Preload = "absolutely-beautiful-wolf.jpg" by Draw+Drop.
PImage Wolf;
PImage Wolfie;
PImage Wolfugh;

void setup()
{
 size(600,500); 
 Wolf = requestImage("absolutely-beautiful-wolf.jpg");
 Wolfie = requestImage("wolfie.jpg");
 Wolfugh = requestImage("wolfugh.jpg");
}
void draw()
{
  // Check the size of image if it has loaded.
  if (Wolf.width > 0)
  {
  image(Wolf, 0, 0, width, height);
  }
  if (Wolfie.width > 0)
  {
    image(Wolfie, 0, 0, 100, 100);
  }
  if (Wolfugh.width > 0)
  {
    image(Wolfugh, 500, 0, 100, 100);
  }
  for (int x = 0; x < width; x += 100)
  {
    stroke(255,255,255);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 100)
  {
    stroke(255,255,255);
    line(0, y, width, y);
  }
  
  int xoffset = 0;
  //while (xoffset < width)
  //{
  //  xoffset = xoffset + 50;
  //  line(xoffset, 0, xoffset, height);
  //  stroke(255,255,255);
  //}
  int yoffset = 0;
  //while (yoffset < height)
  //{
  //  yoffset = yoffset + 50;
  //  line(0, yoffset, width, yoffset);
  //  stroke(255,255,255);
  // }
  
  filter(INVERT);
  
  // Create for loop to connect smaller images.
  for (int i = 0; i < 100; i++)
  {
    float r = random(400);
    stroke(r+5);
    line(100, i, 100+r, i);
  }
}


