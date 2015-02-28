
PImage KZImage;
PImage RImage;
PImage CGImage;
boolean filterApplied = false;

void setup()
{ 
 size(900,600);
 KZImage = requestImage("KZ.jpg");
 RImage = requestImage("RANGO.jpg");
 CGImage = requestImage("Cho.jpg");
}

void draw()
{
  if (KZImage.width > 0)
  {
    imageMode(CENTER); 
    if (filterApplied == false)
    {
      KZImage.filter(THRESHOLD);
      filterApplied = true;
    }
   image(KZImage, 450, 300, width, height);
         
   stroke(255,0,0);   
       int grid = 40; 
    size (900,600);
     
    for (int i = 0; i < width; i+=grid) 
    {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) 
    {
      line (0, i, width, i);
    }
  }
  if (RImage.width > 0)
  {
    imageMode(CENTER);
    image(RImage, 50, 300, 100, 100);
  }
  
  if (CGImage.width > 0)
  {
    imageMode(CENTER);
    image(CGImage, 850, 300, 100, 100);
  }
  stroke(0, 0, 255);
  float x = 75;
  float y = 300;
  float prevX = x;
  float prevY = y;
  strokeWeight(5);
  while (x < 300)
    {
      x += 700;
      y += random (-100, 50);
      line(prevX, prevY, x, y);
      prevX = x;
      prevY = y;
    }
}


