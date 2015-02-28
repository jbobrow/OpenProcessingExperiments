
/* PixeLine. Makes lines over a pixel of the same color of
 * the pixel itself if color's value is in a certain range
 * determined by cursor's position.
 * Writed by Francesco Aggazio and licensed under Creative
 * Commons Attribution-Share Alike 3.0 Unported.
 */
 

PImage img = loadImage("cubo.png");
color[] pic = new color[img.width * img.height];


void setup()
{
  size(420, 315);
  img.loadPixels();
  arrayCopy(img.pixels, pic);
}


void draw()
{
  image(img, 0, 0);
  color colo = 0;
  arrayCopy(pic, img.pixels);
  for (int i = 0; i < (width * height); i++)
  {
    int l = int(random(1) * 20);
    int r = int(map(mouseX, 0, width, 254, 0));
    int g = int(map(mouseY, 0, height, 254, 0));
    int b = int(map(mouseX, 0, width, 0, 254));
    if (red(img.pixels[i]) < r && green(img.pixels[i]) < g && blue(img.pixels[i]) < b)
    {
      colo = img.pixels[i];
      for (int a = 0; a < l; a++)
      {
        int v = i - (width * a);
        if ( v < 0)
        {
          v = 0;
        }
        img.pixels[v] = colo;
      }
    }
  }
  img.updatePixels();
}

