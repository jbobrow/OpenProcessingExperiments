
/* @pjs preload="joconde.jpg"; */

int pixelCount;

PImage referenceImage;
PImage noiseImage;
PImage blendedImage;
PImage stateImage;

color[] colorArray;
boolean[] stateArray;

void setup()
{
  size(313, 400);
  pixelCount = 313 * 400;
  
  referenceImage = loadImage("joconde.jpg");
  noiseImage = createImage(313, 400, RGB);
  blendedImage = createImage(313, 400, RGB);
  stateImage = createImage(313, 400, RGB);
  
  stateArray = new boolean[pixelCount];
  colorArray = new color[pixelCount];
  
  for (int i = 0; i < pixelCount; i++)
  {
    colorArray[i] = referenceImage.pixels[i];
  }
}

void draw()
{
  
  noiseImage.loadPixels();
  for (int i = 0; i < pixelCount; i++)
  {
    noiseImage.pixels[i] = colorArray[int(random(pixelCount))];
    
    if (noiseImage.pixels[i] == referenceImage.pixels[i])
    {
      stateArray[i]= true;
    }
  }
  noiseImage.updatePixels();
  
  blendedImage.loadPixels();
  for (int i = 0; i < pixelCount; i++)
  {
    if (stateArray[i] == false)
    {
      blendedImage.pixels[i] = noiseImage.pixels[i];
    }
    else
    {
      blendedImage.pixels[i] = referenceImage.pixels[i];
    }
  }
  blendedImage.updatePixels();
  
  if (keyPressed == false)
  {
    image(blendedImage, 0 ,0);
  }
}

void mousePressed()
{
  for (int i = 0; i < pixelCount; i++)
   {
     stateArray[i] = false;
   }
}

void keyPressed()
{
  stateImage.loadPixels();
  for (int i = 0; i < pixelCount; i++)
  {
    if (stateArray[i] == false)
    {
      stateImage.pixels[i] = color(0);
    }
    else
    {
      stateImage.pixels[i] = color(255);
    }
  }
  stateImage.updatePixels();
  
  image(stateImage, 0 ,0);
}
