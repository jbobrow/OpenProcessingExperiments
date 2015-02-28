
final boolean CHECKER = true;

int CW=32, CH=32;
color clut[][] = new color[CH][CW];

float theta=0.f;

void setup()
{
  size(240,480);
  generate_clut();
}

// Computes a simple checker pattern
void generate_clut()
{
  PImage tex;
  if(!CHECKER)
  {
    tex = loadImage("bar.png");
    clut = new color[CH=tex.height][CW=tex.width];
  }
  
  for(int h=0; h<CH; h++) for(int w=0; w<CW; w++)
  {
    if(CHECKER)
    {
      if((w < CW/2 && h < CH/2) || (h >= CH/2 && w >= CW/2))
        clut[h][w] = 0xFFFFFF;
      else
        clut[h][w] = 0xFF0000;
    }
    
    else  clut[h][w] = tex.get(w,h); // Same as texture
  }
}

void draw()
{
  background(0xAA);
  
  final float vamp = float(mouseY-height/2) / (float)height*8;
  final float roto = (float)mouseX / (float)width*4;
  
  loadPixels();
  for(int v=0;v<height;v++)
  {
    float fv = (float)v/(float)height;
    float x[] = new float[4];
    for(int i=0; i<4; i++)
      x[i] = sin(vamp * fv + roto + theta + radians(90)*i);
      
    rasterScan(v, x);
  }
  updatePixels();
  
  theta += 0.035f;
}

void rasterScan(int v, float x[])
{
  // Map x[i] to the range 0...1
  for(int i=0; i<4; i++)
    x[i] = x[i]/2.f+.5f;
  
  // Line colours
  int lum[] = new color[4];
  for(int i=0; i<4; i++)
  {
    float len = 0.25+abs( x[i] - x[(i+1)%4] );
    lum[i] = 255 - int( len * 255.f );
  }
  
  // Transform x[i] to clip coordinates
  for(int i=0; i<4; i++)
    x[i] = x[i] * width;
  
  // Draw
  for(int i=0; i<4; i++)
  {
    if(x[i] >= x[(i+1)%4])  continue;
    texLine(int(x[i]), int(x[(i+1)%4]), v, lum[i]);
  }
}

void texLine (int x1, int x2, int v, int l)
{
  // Linearly interpolate across x1...x2
  for(int x=x1; x<x2; x++)
  {
    int dx = abs(x2 - x1);
    color clt = clut[v%CH][int( float(x-x1) / (float)dx * CW*(4+((CW+1)%4)) ) % CW];
    pixels[x+v*width] = 
      color(red(clt)-l, green(clt)-l, blue(clt)-l);
  }
}
