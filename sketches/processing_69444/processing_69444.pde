
class Popart
{
  PImage img;
  Popart ()
  {
    initImage (width, height);
    grayColoredBackground();
  }

  void initImage (int w, int h)
  {
    img = createImage (w, h, ARGB);
  }

  void addLayer (String path)
  {
    img.loadPixels();
    PImage maske = resizeImage (loadImage (path));
    color c = color (random (255), random (255), random (255) );

    color currentColor = c;
    float maskValue = 0, lerpValue = 0;
    color lerpedColor = 1;
    maske.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) 
    {
      maskValue = red (maske.pixels[i]);
      lerpValue = map (maskValue, 0, 255, 0, 1);
      lerpedColor = lerpColor (img.pixels[i], c, lerpValue);
      img.pixels[i] = lerpedColor;
    }
    img.updatePixels();
  }
  
 void addLayer (PImage maske, boolean screenprint)
  {
    int dir = (int) random (6);
    img.loadPixels();
    maske = resizeImage (maske);
    color c = color (random (255), random (255), random (255) );

    color currentColor = c;
    float maskValue = 0, lerpValue = 0;
    color lerpedColor = 1;
    maske.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) 
    {
      maskValue = red (maske.pixels[i]);
      lerpValue = map (maskValue, 0, 255, 0, 1);
      lerpedColor = lerpColor (img.pixels[i], c, lerpValue);
      if (screenprint) updatePixel ( i, dir, lerpedColor);
      else img.pixels[i] = lerpedColor;
    }
    img.updatePixels();
  }
  
  void updatePixel (int i, int dir, color lerpedColor)
  {
    switch (dir)
    {
    case 0:
      if (i % 2 == 0) img.pixels[i] = lerpedColor;
      break;
    case 1:
      if (sq (i) % 3 == 0) img.pixels[i] = lerpedColor;
      break;
    case 2:
      if ((i /2 ) % 2 == 0) img.pixels[i] = lerpedColor;
      break;
    case 3:
      img.pixels[i] = lerpedColor;
      break;
    default:
      img.pixels[i] = lerpedColor;
      break;
    }
  }

  PImage resizeImage (PImage img_)
  {
    if (img_.width == img.width && img_.height == img.height) return img_;
    else 
    {
      PImage smallImage = img_;
      smallImage.resize (img.width, img.height);
      return smallImage;
    }
  }

  void randomColoredBackground ()
  {
    img.loadPixels();
    color c = color (random (255), random (255), random (255) );
    for (int i = 0; i < img.pixels.length; i++) img.pixels[i] = c;
    img.updatePixels();
  }

  void grayColoredBackground ()
  {
    img.loadPixels();
    color c = color (220);
    for (int i = 0; i < img.pixels.length; i++) img.pixels[i] = c;
    img.updatePixels();
  }

  void draw ()
  {
    image (img, 0, 0);
  }

  void draw (int x, int y, int w, int h)
  {
    image (img, x, y, w, h);
  }
}


