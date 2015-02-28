
PImage SImage;


void setup()
{
  size(700,750);
  SImage = requestImage("SNOOPEH.jpg");
}
  
  
  
void draw()
{
  
  if (SImage.width > 0)
  {
    image(SImage, 0, 0, width, height);
    filter(THRESHOLD);
  }
    
 strokeWeight(4);
 stroke(0,255,0); 
    int grid = 500;
   
  for (int i = 0; i < width; i+=grid) 
  {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=grid)
  {
    line (0, i, width, i);
  }
 noStroke();
 
 strokeWeight(4);
 stroke(255, 0, 0);
 float x = 300;
 float y = 335;
 float prevX = x;
 float prevY = y;
 while (x < 600)
   {
     x += 10;
     y += random(-10, 10);
     line(prevX, prevY, x, y);
     prevX= x;
     prevY = y;
   }
   noStroke();
   fill(random(0,255), 0, 0);
  triangle(200, 200, 250, 250, 300, 200);
  noFill();
  fill(0, random(0,255), 0);
  rect(400, 500, 80, 100);

  fill(0, 0, random(0,255));
  ellipse(600, 700, 90, 90);
  noFill();
}


