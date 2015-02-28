
PImage a, b;
int offset = 0;
int imageSize = 400;
boolean running = false;
Subtitles s;
int playTime;
float imageY;
int totalLength = 10000;

void setup()
{
  size(500,600);
  //size(screenWidth,screenHeight,OPENGL);
  //orientation(PORTRAIT);
  a = loadImage("nightingale.jpg");
  if (imageSize>width) imageSize=width;
  a.resize(imageSize, imageSize);
  background(0);
  imageY = max((height-width)/3,0);
  s = new Subtitles(totalLength);
  b = createImage(imageSize, imageSize, RGB);
  a.loadPixels();
  b.loadPixels();
  arrayCopy(a.pixels, b.pixels);
  smooth();
  playTime = millis();
}

void draw()
{
  background(0);
  if (running)
  {
    b.loadPixels();
    float br = 0;
    for (int i=0; i<b.pixels.length; i++)
    {
      if (b.pixels[i]==#FFFFFF) b.pixels[i]=#000000;
      else if (b.pixels[i]==#000000) b.pixels[i]=#FFFFFF;
      int pixelColor = b.pixels[i];
      int b_r = (pixelColor >> 16) & 0xff;
      int b_g = (pixelColor >> 8) & 0xff;
      int b_b = pixelColor & 0xff;
      br += 0.3*b_r+0.59*b_g+0.11*b_b;
    }
    float avg = br/b.pixels.length;
    if (avg<150) b.filter(DILATE);
    else b.filter(ERODE);
    fastBlur(b, 1);
    int p = (int)constrain(30-(frameCount-offset)/30, 6, 255);
    b.filter(POSTERIZE, p);
    image(b, 0, imageY, width, width);
  }
  else image(a, 0, imageY, width, width);
  s.write(playTime,running);
  if (((millis()-playTime)/1000)>totalLength)
  {
    running = false;
  }
}

// Super Fast Blur v1.1 by Mario Klingemann
void fastBlur(PImage img, int radius) {

  if (radius<1) {
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum, gsum, bsum, fx, fy, i, p, p1, p2, yp, yi, yw;
  int vmin[] = new int[max(w, h)];
  int vmax[] = new int[max(w, h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++) {
    dv[i]=(i/div);
  }

  yw=yi=0;

  for (fy=0;fy<h;fy++) {
    rsum=gsum=bsum=0;
    for (i=-radius;i<=radius;i++) {
      p=pix[yi+min(wm, max(i, 0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
    }
    for (fx=0;fx<w;fx++) {

      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if (fy==0) {
        vmin[fx]=min(fx+radius+1, wm);
        vmax[fx]=max(fx-radius, 0);
      }
      p1=pix[yw+vmin[fx]];
      p2=pix[yw+vmax[fx]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }

  for (fx=0;fx<w;fx++) {
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for (i=-radius;i<=radius;i++) {
      yi=max(0, yp)+fx;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=fx;
    for (fy=0;fy<h;fy++) {
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if (fx==0) {
        vmin[fy]=min(fy+radius+1, hm)*w;
        vmax[fy]=max(fy-radius, 0)*w;
      }
      p1=fx+vmin[fy];
      p2=fx+vmax[fy];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }
}

void mousePressed()
{
  if (mouseY>=s.boxY&&mouseY<=(s.boxY+s.boxHeight))
  {
    running = !running;
    if (running)
    {
      a.loadPixels();
      b.loadPixels();
      arrayCopy(a.pixels, b.pixels);
      b.updatePixels();
      offset=frameCount;
      playTime = millis();
      background(0);
      image(a, 0, imageY, width, width);
    }
  }
  else if(mouseY>=imageY&&mouseY<=imageY+width) b.filter(INVERT);
}


