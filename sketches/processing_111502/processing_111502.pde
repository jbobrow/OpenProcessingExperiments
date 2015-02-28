

PImage pensImage;
PImage bearImage;
PImage jellyImage;
PImage oceanImage;
boolean filterApplied = false;
float x = 125;
float y = 125;
float prevX = x;
float prevY = y;
  

void setup()
{
  size(400,400);
  oceanImage = requestImage("ocean.jpg");
  pensImage = requestImage("pens.jpg");
  bearImage = requestImage("bear.jpg");
  jellyImage = requestImage("jelly.jpg");
}

void draw()
{
   stroke(255);
   if (oceanImage.width > 0)
  // move the { below with a comment next to it up here
 {
    if (filterApplied == false)
  
 
  {
    oceanImage.filter(POSTERIZE, 250);
    filterApplied = true;
  }
  
   // move this one up there
    image(oceanImage, 0, 0, width, height);
  }
  
  
  
  int gridSize = 20;
   
  int x = 0;
  while (x < width)
  {
    line(x, 0, x, height);
    x += gridSize;
  }
   
 {
  int y = 0;
  while (y < height)
  {
    line(0, y, width, y);
    y += gridSize;
    stroke(255);
    
  }
    strokeWeight(2.5);
    stroke(#E51010);
  }
  
   if (jellyImage.width > 0)
  {
    
     if (filterApplied == false)
    
  
  {
    jellyImage.filter(POSTERIZE, 250);
    filterApplied = true;
    }
  
    imageMode(CORNER);
    image(jellyImage, 250,125,125,125); 
   
    
  }
  
 if (bearImage.width > 0)
  {
    if (filterApplied == false)
    
    {
    bearImage.filter(POSTERIZE, 250);
    filterApplied = true;
    }
   
    imageMode(CORNER);
    image(bearImage,25, 125, 125, 125);
    
   
   
  }
 
{
 {
    float z = 50;
    float a = 135;
    float prevZ = z;
    float prevA = a;
    while (z<400)
    {
      z += 10;
      a += random(-10, 10);
      line(prevZ, prevA, z, a);
      prevZ = z;
      prevA = a;
    } 
  {  
   line(z, a, 275, 200);
   stroke(255);
  }
}
   

}


  }


