
PImage CloudImage;
PImage ZeusImage;
PImage HadesImage;
boolean filterApplied = false;

void setup()
{
  size(500, 500);
  CloudImage = requestImage("Clouds.jpg");
  ZeusImage = requestImage("Zeus.jpg");
  HadesImage = requestImage("Hades.jpg");

}

void draw()
{
  if (CloudImage.width > 0)
  {
    imageMode(CENTER);
    if(filterApplied == false)
    {
      CloudImage.filter(BLUR,2);
      filterApplied = true;
    }
    image(CloudImage, width/2, height/2, CloudImage.width *0.5, CloudImage.height *1); 
  }
  
  if (ZeusImage.width > 0)
  {
    image(ZeusImage, width/2, height/2, ZeusImage.width *0.3, ZeusImage.height*0.3);
  }
  
  if (HadesImage.width > 0)
  {
    image(HadesImage, width/4, height/4, HadesImage.width*0.4, HadesImage.height*0.4);
  
  }
  
   float A = 250;
  float B = 150;
  float prevA = A;
  float prevB = B;
  
  while (A <300)
  {
    A += 5; 
    B += random (-10, 10);
    line(prevA, prevB, A,B);
    prevA = A;
    prevB = B;
  
  }

  
  // draw vertical lines
  int x = 0;
  int gridSize = 10;
  while (x < width)
  {
    line(x, 0, x, height);
    x += gridSize;
  }
   
  // draw horizontal lines
  int y = 0;
  while (y < height)
  {
    line(0, y, width, y);
    y += gridSize;
  }
  

  
  
}




