
PImage hankImage, propaneImage, fireImage;
boolean filterApplied = false;

void setup ()
{
  size(500,500);
  hankImage = requestImage("hank.jpeg");
  propaneImage = requestImage("propane.jpg");
  fireImage = requestImage("fire.jpg");
}

void draw()
{
  if (hankImage.width > 0)
  {
    imageMode(CENTER);
    if (filterApplied == false)
    {
      hankImage.filter(INVERT);
      filterApplied = true;
    }
    image(hankImage, width / 2, height /2, 500, 500);
  }
  

  
  
  //Lines
  stroke(0);
  strokeWeight(1);
  int x = 0;
  while (x < width)
  {
    line(x, 0, x, height);
    x += 100;
  }
  
  int y = 0;
  while ( y < height)
  {
    line (0, y, width, y);
    y += 100;
  }
  
  
  // Other Pictutes
  if (propaneImage.width > 0)
  {
    image(propaneImage, 100, 400, propaneImage.width * 0.5, propaneImage.height * 0.5);
  }
  
  if (fireImage.width > 0)
  {
    image(fireImage, 395, 400, 200, 195);
  }
  
    // Crazy
  float lineX = 195;
  float lineY = 400;
  float prevX = lineX;
  float prevY = lineY;
  stroke(255, 0, 0);
  strokeWeight(4);
  
  while (lineX < 291)
  {
    lineX += 5;
    lineY += random(-3, 3);
    line(prevX, prevY, lineX, lineY);
    prevX = lineX;
    prevY = lineY;
  }
  
}



