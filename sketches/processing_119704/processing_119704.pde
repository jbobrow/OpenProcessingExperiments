
int[][]  plas_lut;
int[]    palette  = new int[255];

void setup()
{
  size(1024,640);
  plas_lut = new int[width][height];
  
  buildPalette();
  buildMap();
}

void buildPalette ()
{
  colorMode(HSB);
  for(int i=0;i<palette.length;i++)
  {
    //int h = int(128.0 + 128 * asin(PI * (float)i / 32.0));
    int s = int(128.0 + 128 * cos(PI * (float)i / 64.0));
    int b = int(128.0 + 128 * sin(PI * (float)i / 128.0));
    palette[i] = color(200,s,b+25);
  }
}

void buildMap ()
{
  for(int x=0;x<width;x++) for(int y=0;y<height;y++)
  {
    plas_lut[x][y] = 128+int(
      128f + (128f * sin(x / 256f))
           + 128f + (256f * pow(1/cos(y / 256f),-1))
    + 128f * sin((float)x/width)
    + 128f + 128*sin((x+y)/128f)
    + 128f + (128f * cos(sqrt(x*x + y*y) / 256f)));
  }
}

void draw()
{
  loadPixels();
  for(int x=0;x<width;x++) for(int y=0;y<height;y++)
    pixels[y*width + x] = palette[(plas_lut[x][y] + frameCount*2) % 255];
  updatePixels();
}


