
PGraphics map32;
PGraphics map256;

void setup() {
  size(256,256, P2D);

  map32 = createGraphics(32,32,P2D);
  map256 = createGraphics(256,256,P2D);



  SetNoise();
  LoopForever();

}
void LoopForever()
{
  OverlapOctaves();
  ExpFilter();
}
float Noise(int x, int y, int random){
  int n = x + y * 57 + random * 131;
  n = (n<<13) ^ n;
  return (1.0f - ( (n * (n * n * 15731 + 789221) +
    1376312589)&0x7fffffff)* 0.000000000931322574615478515625f);

}

void SetNoise() {
  float temp[][] = new float[34][34];

  int random=(int)random(-2000000000,2000000000) % 5000;

  for (int y=1; y<33; y++) 
    for (int x=1; x<33; x++) {
      temp[x][y] = 128.0f + Noise(x,  y,  random)*128.0f;
    }

  for (int x=1; x<33; x++) {
    temp[0][x] = temp[32][x];
    temp[33][x] = temp[1][x];
    temp[x][0] = temp[x][32];
    temp[x][33] = temp[x][1];
  }
  temp[0][0] = temp[32][32];
  temp[33][33] = temp[1][1];
  temp[0][33] = temp[32][1];
  temp[33][0] = temp[1][32];


  map32.loadPixels();
  for (int y=1; y<33; y++)
    for (int x=1; x<33; x++) {
      float center = temp[x][y]/4.0f;
      float sides = (temp[x+1][y] + temp[x-1][y] + temp[x][y+1] + temp[x][y-1])/8.0f;
      float corners = (temp[x+1][y+1] + temp[x+1][y-1] + temp[x-1][y+1] + temp[x-1][y-1])/16.0f;

      map32.beginDraw();
      map32.loadPixels();
      map32.pixels[((x-1)*32) + (y-1)] = (int)(center + sides + corners);
      map32.updatePixels();
      map32.endDraw();
    }

}

float Interpolate(float x, float y)
{
  int Xint = (int)x;
  int Yint = (int)y;

  float Xfrac = x - Xint;
  float Yfrac = y - Yint;
  int X0 = Xint % 32;
  int Y0 = Yint % 32;
  int X1 = (Xint + 1) % 32;
  int Y1 = (Yint + 1) % 32;


  map32.loadPixels();
  float bot = map32.pixels[X0*32 + Y0] + Xfrac * (map32.pixels[X1*32 + Y0] - map32.pixels[X0*32 + Y0]);
  float top = map32.pixels[X0*32 + Y1] + Xfrac * (map32.pixels[X1*32 + Y1] - map32.pixels[X0*32 + Y1]);

  return (bot + Yfrac * (top - bot));

}

void OverlapOctaves()
{
  map256.beginDraw();
  map256.loadPixels();

  for (int x=0; x<256*256; x++)
  {
    map256.pixels[x] = 0;
  }
  for (int octave=0; octave<4; octave++)
    for (int x=0; x<256; x++)
      for (int y=0; y<256; y++)
      {
        float scale = 1 / pow(2, 3-octave);
        float noise = Interpolate(x*scale, y*scale);
        map256.pixels[(y*256) + x] += noise / pow(2, octave);
      }

  map256.updatePixels();
  map256.endDraw();
}

void ExpFilter()
{
  float cover = 20.0f;
  float sharpness = 0.95f;

  map256.beginDraw();
  map256.loadPixels();
  for (int x=0; x<256*256; x++)
  {
    float c = map256.pixels[x] - (255.0f-cover);
    if (c<0)     c = 0;
    map256.pixels[x] = color(255.0f - ((float)(pow(sharpness, c))*255.0f));
  }
  map256.endDraw();
}


int x=0;

void keyPressed() {
  SetNoise();
  LoopForever();
}

void draw() {
  x++;
  loadPixels();

  map256.loadPixels();
  for(int i=0;i<256;++i)
    for(int j=0;j<256;++j)
      pixels[i*256+j]=map256.pixels[i*256+(x+j)%256];

  updatePixels();
  //  image(map256,0,0);
}












