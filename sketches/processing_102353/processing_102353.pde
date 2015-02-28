
PImage img;
PImage block;

void setup ()
{
  background (255);  
  img = loadImage ("Levitan_Oak.jpg");
  //img = loadImage ("fragment.jpg");  
  //size (img.width, img.height);  
  size (725, 773);

  int pixel = 10;
  rectMode (CORNER);
  noStroke ();
     
  pixelate (pixel);
}

void mouseDragged ()
{
  int pixel = constrain (int (map (mouseX, 0, width, 2, 200)), 2, 200);
  pixelate (pixel);
}

void draw ()
{
}

void pixelate (int pixel)
{
  for (int y = 0; y < img.height; y += pixel)
  {
    for (int x = 0; x < img.width; x += pixel)
    {
      int blockW = (x + pixel < width) ? pixel : width - x,
          blockH = (y + pixel < height) ? pixel : height - y;         
      block = img.get (x, y, blockW, blockH);
      block.loadPixels ();

      float r = 0, g = 0, b = 0;
      for (int i = 0; i < block.pixels.length; i++)
      {
        r += block.pixels[i] >> 16 & 0xFF;
        g += block.pixels[i] >> 8 & 0xFF;
        b += block.pixels[i] & 0xFF;
      }
      float rAvg = round (r / block.pixels.length), 
            gAvg = round (g / block.pixels.length), 
            bAvg = round (b / block.pixels.length);

      fill (rAvg, gAvg, bAvg);
      rect (x, y, pixel, pixel);
    }
  }
}





