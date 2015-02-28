
PImage img;

void setup() {
  size(200,200);
  img = loadImage("sunflower.jpeg");
 // greatly inspired by http://www.learningprocessing.com/examples/chapter-15/example-15-7/
  for (int x=0; x < width; x++) 
    for (int y=0; y<height; y++)
    {
      int loc = y*width + x;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      //converting values to float

      float fX = x;
      float fY = y;
      
      float rRatio = (width - fX)/width;
      float gRatio = fY/height;
      float bRatio = fX/width;
 
      img.pixels[loc] = color(r*rRatio, g*gRatio, b*bRatio);
    }
  image(img,0,0);
}

