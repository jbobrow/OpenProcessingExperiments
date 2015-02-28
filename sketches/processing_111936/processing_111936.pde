
// Reduces an image of size 200 x 200 to 100 x 100.
PImage img;

void setup()
{
  String url = "http://d24w6bsrhbeh9d.cloudfront.net/photo/aRQjbeG_700b_v01.jpg";
  img = loadImage(url);
  
  size(img.width/2, img.height/2);
  
  img.loadPixels(); 
  loadPixels();  // for the background
  
  for (int x = 0; x < img.width - 1; x+=2)
  {
    for (int y = 0; y < img.height - 1; y+=2)
    {
      int loc = x + y * img.width;  // determines the location of each pixel using 2 for loops
      
      //find the average rgb value for 4 neighbouring pixels
      float r = red(img.pixels[loc]) + red(img.pixels[loc + 1]);
      float g = green(img.pixels[loc]) + green(img.pixels[loc + 1]);
      float b = blue(img.pixels[loc]) + blue(img.pixels[loc + 1]);
      
      loc = x + (y + 1) * img.width;
      r += red(img.pixels[loc]) + red(img.pixels[loc + 1]);
      g += green(img.pixels[loc]) + green(img.pixels[loc + 1]);
      b += blue(img.pixels[loc]) + blue(img.pixels[loc + 1]);
      
      r /= 4;
      g /= 4;
      b /= 4;
      
      loc = x/2 + y/2 * width;
      pixels[loc] = color(r,g,b);
    }
  }
  
  updatePixels();  //Refreshes background
}
