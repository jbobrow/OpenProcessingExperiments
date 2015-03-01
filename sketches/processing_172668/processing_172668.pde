
/* @pjs preload="bitterweetLife.jpg"; */

Boolean isInitialized = false;//JS image loading
PImage pimg;
float dw = 0, dh = 0;
int[] px;
int imageW, imageH, offset;
PVector minSize = new PVector(.2, .7);//image min size (width and height)
PVector freq = new PVector(1, 1);

void setup()
{
  size(300, 350, P2D);
  pimg = loadImage("bitterweetLife.jpg");
  initPicture();
}

void initPicture()
{
  imageW = pimg.width;
  imageH = pimg.height;
  if (imageW * imageH > 0)
  {
    px = new int[imageW*imageH];
    pimg.loadPixels();
    arrayCopy(pimg.pixels, px);//store the image's pixels once and for all
    pimg.updatePixels();
    offset = (int)((width-imageW)/2 + (height-imageH)/2*width);//in order to center the image but not in JS :'(
    isInitialized = true;
  }
}

void draw()
{
  background(120);
  dw += map(mouseX, 0, width, .16, -.16);//oscilation speed
  dh += map(mouseY, 0, height, .16, -.16);//oscilation speed
  loadPixels();
  for (int i = 0; i < imageW; i++)
  {
    for (int j = 0; j < imageH; j++)
    {
      int w = ((int)(map(1+sin((TWO_PI*j*freq.x)/imageH+dh), 0, 2, minSize.x, 1)*imageW));
      int h = ((int)(map(1+sin((TWO_PI*i*freq.y)/imageW+dw), 0, 2, minSize.y, 1)*imageH));
      if ((imageW-w)/2 <= i && i < (imageW+w)/2
        && ((imageH-h)/2 <= j && j < (imageH+h)/2))//check that pixels are within the new frame
      {
        pixels[width*j+i/*+offset*/] = px[imageW*(int)map(j, (imageH-h)/2, (imageH+h)/2-1, 0, imageH-1) + (int)map(i, (imageW-w)/2, (imageW+w)/2-1, 0, imageW-1)];
      }
    }
  }
  updatePixels();
}

void mousePressed()
{
  if (!isInitialized)
  {
    initPicture();
  } else
  {
    minSize = new PVector(random(0, 1), random(0, 1));
    freq = new PVector(random(.2, 2), random(.2, 2));
  }
}



