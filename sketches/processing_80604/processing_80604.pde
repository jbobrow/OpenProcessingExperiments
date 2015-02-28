
PImage img;         
PImage destino; 

void setup() 
{
  size(200,200);
  img = loadImage("simpsonizado.jpg");
  destino = createImage(img.width, img.height, RGB);
}

void draw() 
{
  img.loadPixels();
  destino.loadPixels();
  for (int x = 1; x < width; x++ ) 
  {
      for (int y = 0; y < height; y++ ) 
      {
          int pos = x + y*img.width;
          color pixe = img.pixels[pos];
          int leftLoc = (x - 1) + y*img.width;
          color leftPix = img.pixels[leftLoc];
          float dife = abs(brightness(pixe) - brightness(leftPix));
          destino.pixels[pos] = color(dife); 
      }
  }
  destino.updatePixels();
  image(destino,0,0);
}

