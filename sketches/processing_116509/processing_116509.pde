
PImage eseaImage;
boolean filterApplied = false;


void start ()
{
  size(800, 534);
  eseaImage = requestImage("esea_group4.JPG");  
}

void draw ()
{
  if (eseaImage.width > 0)
  {
    imageMode(CENTER);
    if (filterApplied == false)
    {
      eseaImage.filter(GRAY);
      filterApplied = true;
    }
    image(eseaImage, width /2, height/2, 800, 534);  
  }
  
  // Lines
  stroke(255, 255, 255);
  strokeWeight(1);
  int x = 0;
  while (x < width)
  {
    line(x, 0, x, height/2);
    x += 100;
  }
  
  int y = 0;
  while ( y < height/2)
  {
    line( 0, y, width, y);
    y += 100;
  }
  // Vertical random lines
  float line1X = 100;
  float line1Y = 267;
  float prev1X = line1X;
  float prev1Y = line1Y;
  while (line1Y < 534)
  {
    line1X += random(-1, 1);
    line1Y += 1;
    line(prev1X, prev1Y, line1X, line1Y);
    prev1X = line1X;
    prev1Y = line1Y;
  }
  
  float line2X = 200;
  float line2Y = 267;
  float prev2X = line2X;
  float prev2Y = line2Y;
  while (line2Y < 534)
  {
    line2X += random(-1, 1);
    line2Y += 1;
    line(prev2X, prev2Y, line2X, line2Y);
    prev2X = line2X;
    prev2Y = line2Y;
  }
  
  float line3X = 300;
  float line3Y = 267;
  float prev3X = line3X;
  float prev3Y = line3Y;
  while (line3Y < 534)
  {
    line3X += random(-1, 1);
    line3Y += 1;
    line(prev3X, prev3Y, line3X, line3Y);
    prev3X = line3X;
    prev3Y = line3Y;
  }
  
  float line4X = 400;
  float line4Y = 267;
  float prev4X = line4X;
  float prev4Y = line4Y;
  while (line4Y < 534)
  {
    line4X += random(-1, 1);
    line4Y += 1;
    line(prev4X, prev4Y, line4X, line4Y);
    prev4X = line4X;
    prev4Y = line4Y;
  }
  
  float line5X = 500;
  float line5Y = 267;
  float prev5X = line5X;
  float prev5Y = line5Y;
  while (line5Y < 534)
  {
    line5X += random(-1, 1);
    line5Y += 1;
    line(prev5X, prev5Y, line5X, line5Y);
    prev5X = line5X;
    prev5Y = line5Y;
  }
  float line6X = 600;
  float line6Y = 267;
  float prev6X = line6X;
  float prev6Y = line6Y;
  while (line6Y < 534)
  {
    line6X += random(-1, 1);
    line6Y += 1;
    line(prev6X, prev6Y, line6X, line6Y);
    prev6X = line6X;
    prev6Y = line6Y;
  }
  float line7X = 700;
  float line7Y = 267;
  float prev7X = line7X;
  float prev7Y = line7Y;
  while (line7Y < 534)
  {
    line7X += random(-1, 1);
    line7Y += 1;
    line(prev7X, prev7Y, line7X, line7Y);
    prev7X = line7X;
    prev7Y = line7Y;
  }
  //Horizontal Random Lines
  float line8X = 0;
  float line8Y = 300;
  float prev8X = line8X;
  float prev8Y = line8Y;
  while (line8X < 800)
  {
    line8X += 1;
    line8Y += random(-1, 1);
    line(prev8X, prev8Y, line8X, line8Y);
    prev8X = line8X;
    prev8Y = line8Y;
  }
  
  float line9X = 0;
  float line9Y = 400;
  float prev9X = line9X;
  float prev9Y = line9Y;
  while (line9X < 800)
  {
    line9X += 1;
    line9Y += random(-1, 1);
    line(prev9X, prev9Y, line9X, line9Y);
    prev9X = line9X;
    prev9Y = line9Y;
  }
  
  
  
  
  
 
}




