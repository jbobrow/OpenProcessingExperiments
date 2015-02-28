
//manipulate image in a nested loop. 

PImage img; 



void setup()
{

  img = loadImage("pad.jpg");
  size(img.width, img.height); 


  image(img, 0, 0);
  frameRate(1);
}


void draw()
{
  //TO DO: First run this code to see what happens. 
  //Split the image into four quadrants. 
  //Have a different effect in each quadrant. Example: color every other row of pixels black. 

  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) 
  {
    for (int x = 0; x < width; x++) 
    {

      if (x%(width/2) == 0)
      {
        img.set(x, y, color(0));
      }

      if (y%(height/2)==0) {
        img.set(x, y, color(0));
      }
      // bottom left
      if (x<width/2 && y>height/2) {
        color pixelColor = img.get(x, y);

        float r = red(pixelColor);
        float g = green(pixelColor);
        float b = blue(pixelColor);

        img.set(x, y, color (r * 0.9, g, b));
      }

      // bottom right
      if (x>width/2 && y>height/2) {
        color pixelColor = img.get(x, y);

        float r = red(pixelColor);
        float g = green(pixelColor);
        float b = blue(pixelColor);

        img.set(x, y, color (r* 1.9, g, b));
      }

      // top right
      if (x>width/2 && y<height/2) {
        color pixelColor = img.get(x, y);

        float r = red(pixelColor);
        float g = green(pixelColor);
        float b = blue(pixelColor);

        img.set(x, y, color (r* 0.5, g, b*2.0));
      }

      // top left
      if (x<width/2 && y<height/2) {
        color pixelColor = img.get(x, y);

        float r = red(pixelColor);
        float g = green(pixelColor);
        float b = blue(pixelColor);

        img.set(x, y, color (0, g*2.0, b));
      }
    }
  }
  updatePixels();
  image(img, 0, 0);
}



