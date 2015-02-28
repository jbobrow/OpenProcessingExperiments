
PImage img; // image to load
int h = 0;  // current hue to draw

void setup()
{
  size(800,600);                   // must be size of pic
  img = loadImage("colombia.jpg");
  colorMode(HSB,800,255,255);      // change scale of hue to make drawing faster/slower
  img.loadPixels();
  background(0);
  frameRate(30);
}

void draw()
{
  // loop through all pixels in the picture
  for(int x = 0; x<width; x++)
  {
    for(int y = 0; y<height; y++)
    {
      // check if current pixel is the hue we're now drawing
      if(h==(int)hue(img.pixels[x+y*width]))
      {
        // set colour and draw
        stroke(hue(img.pixels[x+y*width]), saturation(img.pixels[x+y*width]), brightness(img.pixels[x+y*width]));
        point(x,y);
      }
    }
  }
  h++;  // increment hue by one
}

void keyPressed()
{
  fill(0);
  noStroke();
  rect(0,0,width,height);
  h = 0; 
}

