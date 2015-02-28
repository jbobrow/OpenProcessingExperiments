
PImage img;
void setup() 
{
  size(200,200);
  img = loadImage("simpsonizado.jpg");
}

void draw() 
{
  loadPixels();
  for (int x = 0; x < img.width; x++ ) 
  {
      for (int y = 0; y < img.height; y++ ) 
      {
          int pos = x + y*img.width;
          float r = red (img.pixels[pos]);
          float g = green (img.pixels[pos]);
          float b = blue (img.pixels[pos]);
          float adjustBrightness = ((float) mouseX / width) * 8.0; 
          r *= adjustBrightness;
          g *= adjustBrightness;
          b *= adjustBrightness;
          r = constrain(r,0,255); 
          g = constrain(g,0,255);
          b = constrain(b,0,255);
          color c = color(r,g,b);
          pixels[pos] = c;
       }
  }
  updatePixels();  
}

