
/* In this example, a sepia image is created

developed by Laura Maye, University of Limerick
*/

PImage myImage1, myImage2;
color oldPixelColour;
color updatedPixelColour;
float r, g, b;
float newR, newG, newB;
void setup()
{
  size(400, 400);
  //loading in the SAME image twice
  myImage1 = loadImage("Puppy.jpg");
  myImage2 = loadImage("Puppy.jpg");
}

void draw()
{
  for (int x = 0; x < myImage1.width; x = x + 1)
  {
    for(int y = 0; y < myImage1.height; y = y + 1)
    {
      oldPixelColour = myImage1.get(x, y);
      r = red(oldPixelColour);
      g = green(oldPixelColour);
      b = blue(oldPixelColour);
      //one of the many formulas for creating a sepia image
      newR = r * 0.393 + g * 0.769 + b * 0.189;
      newG = r * 0.349 + g * 0.686 + b * 0.168;
      newB = r * 0.272 + g * 0.534 + b * 0.131;
      if (newR > 255)
      {
        newR = 255;
      }
      if (newG > 255)
      {
        newG = 255;
      }
      if (newB > 255)
      {
        newB = 255;
      }
      updatedPixelColour = color(newR, newG, newB);
      myImage2.set(x, y, updatedPixelColour);
    }
  }
  image(myImage2, 0, 0, width, height);
  noLoop();
}


