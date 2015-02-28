
//Image Manipulation via Data Plotting//

int[] gblur = {
  0,6,13,6,0, 
  6,54,110,54,6, 
  13,110,225,110,13, 
  6,54,110,54,6, 
  0,6,13,6,0,
};

int[] edge = {
  -1,-1,-1, 
  -1,8,-1, 
  -1,-1,-1,
};

int[] emboss = {
  -2,-1,0, 
  -1,1,1, 
  0,1,2,
};

int[] gradient = {
  -1, -1, -1, 
  0, 0, 0, 
  1, 1, 1,
};

//

PImage convolution(PImage source, int[] kernel)
{
  PImage out = createImage(source.width, source.height, RGB);
  int kwidth = int(sqrt(kernel.length));
  int koffset = kwidth/2;
  for (int i=0 ;i<source.width;i++) {
    for (int j=0;j<source.height;j++) {
      PImage f = source.get(i-koffset, j-koffset, kwidth, kwidth);
      color c = applyKernel(f, kernel);
      out.set(i, j, c);
    }
  }
  return out;
}

//

color applyKernel(PImage img, int[] kernel)
{
  int r=0, g=0, b=0;
  int weight=sum(kernel);
  if (weight==0) weight=1;
  img.loadPixels();
  for (int k=0;k<kernel.length;k++)
  {
    r+=red(img.pixels[k])*kernel[k];
    g+=green(img.pixels[k])*kernel[k];
    b+=blue(img.pixels[k])*kernel[k];
  }
  return color(r/weight, g/weight, b/weight);
}

//

int sum(int[] list)
{
  int sum=0;
  for (int value : list)
    sum+=value;
  return sum;
}

//

PImage test, edged, blured, embossed;
void setup()
{
  size(520,450);
  test = loadImage("mario test image.png");
  edged = convolution(test, gradient);
  blured = convolution(test, gblur);
  embossed = convolution(test, emboss);
  image(test,0,0);
  image(edged,250,0);
  image(blured,0,220);
  image(embossed,250,220);
}

//



