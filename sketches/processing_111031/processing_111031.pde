
PImage pictureImage;
PImage mushroomImage;
boolean filterApplied = false; //Apply filter only once

void setup(){
  size(500,500);
  pictureImage = requestImage("picture.jpg");
  mushroomImage = requestImage("mushroom.jpg");
  
  float x = 10;
  float y = 50;
  float prevX = x;
  float prevY = y;

  strokeWeight(5);
  while (x < 500)
  {
    x += 5;
    y += random (-2,2);
    line (prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }

  } 
  
  
 


void draw()
{
  imageMode(CENTER);
  if (pictureImage.width > 0)
  {
    if (filterApplied == false)
    {
    pictureImage.filter (INVERT);
    filterApplied = true; // only applies filter once
    }
   image(pictureImage, width /2, height /2, pictureImage.width * .5, pictureImage.height * .5); 
  }
  
  if (mushroomImage.width > 0)
  {
    image(mushroomImage, 50, 50, mushroomImage.width * .25, mushroomImage.height * .25);
    image(mushroomImage, 450, 50, mushroomImage.width * .25, mushroomImage.height * .25);

  }
  
  int xCounter = 25;
  int yCounter = 25;
 for (int gridCounter = 1; gridCounter <= 10; gridCounter++)
  {
    
    line(xCounter, 0, xCounter, height);
    line(0, yCounter, width, yCounter);
    xCounter += 50;
    yCounter += 50;
  }
  

}


