

PImage img;

void setup()
{
  img = loadImage("Russell_Crowe.jpg");
  size(img.width, img.height);
}

void draw()
{
  background(0);
  image(img, 0, 0);
  for(int x = 0; x<width; x+=10)
  {
    for(int y = 0; y<height; y+=10)
    {
      fill(get(x, y), 255);
      noStroke();
      rect(x, y, map(mouseX, 0, width, 1, 10), map(mouseX, 0, width, 1, 10));
    }
  }
    fill(0);
  text("RUSSEL CROWE \n IN 16-BIT", width/10 - 50, height/2);
}

void keyPressed()
{
  save(random(3434)+".jpg");
}

