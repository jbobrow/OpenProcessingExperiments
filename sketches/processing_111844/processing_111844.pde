
PImage pictureImage;
boolean filterApplied = false; //Apply filter only once

void setup(){
  size(500,500);
  pictureImage = requestImage("Class.jpg");

}

void draw()
{
  if (pictureImage.width > 0)
  {
    imageMode(CENTER);
    if (filterApplied == false)
    {
    pictureImage.filter (INVERT);
    filterApplied = true; // only applies filter once
    }
   image(pictureImage, width /2, height /2, pictureImage.width * .5, pictureImage.height * .5); 
  }
  
    int xCounter = 25;
  int yCounter = 25;
 for (int gridCounter = 1; gridCounter <= 6; gridCounter++)
  {
    strokeWeight(5);
    line(xCounter, 0, xCounter, height);
    line(0, yCounter, width, yCounter);
    xCounter += width/6;
    yCounter += height/6;
  }
  int x1 = 25;
  int y1 = 0;
  int x2 = 0;
  int y2 = 50;
  int x3 = 50;
  int y3 = 50;
  int x4 = 75;
  int y4 = 0;

  
  for (int quadCounter = 1; quadCounter <= 10; quadCounter++){
   fill(random(255),random(255),random(255)); 
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
  x1 += 50;
  y1 += 50;
  y2 += 50;
  y3 += 50;
  y4 += 50;
  } 
 

  
}


