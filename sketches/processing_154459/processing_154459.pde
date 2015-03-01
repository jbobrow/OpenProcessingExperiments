
PImage img1, img2, result;

void setup()
{
  img1 = loadImage("difference_puzzle_one.png");
  img2 = loadImage("difference_puzzle_two.png");
  size(img1.width*3, img1.height);
  background(227);
  result = createImage(img1.width, img1.height, RGB);
  //noLoop();
}
void draw()
{
  background(227);
    //interesting in result image
    for(int i = 0; i < result.pixels.length; i++)
    {
      float newRed = abs(red(img1.pixels[i])-red(img2.pixels[i]));
      float newGreen = abs(green(img1.pixels[i])-green(img2.pixels[i]));
      float newBlue = abs(blue(img1.pixels[i])-blue(img2.pixels[i]));
      result.pixels[i] = color(newRed, newGreen, newBlue);
    }
    result.updatePixels();
    
    //draws image
    image(img1, 0, 0);
    image(img2, img1.width, 0);
    image(result, img1.width*2, 0);
}
