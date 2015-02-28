
PImage catImage;
PImage bunnyImage;
PImage puppyImage;
boolean filterApplied = false;

void setup()
{
  size(500, 400);
  catImage = requestImage("cat07.jpg");
  bunnyImage = requestImage("bunny.jpg");
  puppyImage = requestImage("puppy.jpg");
}

void draw()
{
  if (catImage.width > 0)
  {
    imageMode(CENTER);
    if(filterApplied == false)
    {
    image(catImage, width / 2, height / 2, 500, 400);
    filter(GRAY);
    filter(POSTERIZE, 4);
    }
  }
  
  strokeWeight(1);
  for(int x = 0; x < width; x+= width / 12)
  {
    line(x, 0, x, height);
  }
   
  for(int y = 0; y < height; y += height / 12)
  {
    line(0, y, width, y);
  }
  
    if (puppyImage.width > 0)
  {
    image(puppyImage, 120, height / 2, puppyImage.width / 9, puppyImage.height / 9);
  }
  if (bunnyImage.width > 0)
  {
    image(bunnyImage, 380, height / 2, bunnyImage.width / 4, bunnyImage.height / 4);
  }

  //if hasDrawn = false
  float x = 100;
  float y = height / 2;
  float prevx = x;
  float prevy = y;
  strokeWeight(5);
  while (x < 400)
  {
    x += random(15);
    y += random(-5, 5);
    line(prevx, prevy, x, y);
    prevx = x;
    prevy = y;
  }
 
}


