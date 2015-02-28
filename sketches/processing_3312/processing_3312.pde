
// Composite Sketch - Jim Bumgardner
//
 
PGraphics obuf;
 
int [] sums;
int  nbrPasses;
 
 
void setup()
{
  size(600,600);
  obuf = createGraphics(width, height, JAVA2D);
 
  // frameRate(2);
 
  sums = new int[width*height*3];
  loadPixels();
 
}
 
void draw()
{
  ++nbrPasses;
   
  if (nbrPasses == 1000)
  {
      println("1000");
      save("snapshot.png");
  }
   
   
  obuf.beginDraw();
  obuf.colorMode(RGB,1);
  obuf.smooth();
  obuf.background(.5);
  obuf.noFill();
  for (int j =0; j < 2; ++j)
  {
    obuf.stroke(random(1),random(1),random(1));
    obuf.strokeWeight(width*.01 + random(width*.8));
    obuf.bezier(random(width),random(height),random(width),random(height),random(width),random(height),random(width),random(height));
  }
  obuf.endDraw();
   
  PImage img = obuf.get(0,0,obuf.width,obuf.height);
  img.loadPixels();
 
 
   
 
  int numPixels = width*height;
  int n = 0;
 
 
  int mmin = nbrPasses*255;
  int mmax = 0;
  n = 0;
  for (int i = 0; i < numPixels; ++i) {
     int clr = img.pixels[i];
 
     sums[n] += (clr & 0x0FF);
     if (sums[n] > mmax)  mmax = sums[n];
     if (sums[n] < mmin) mmin = sums[n];
     ++n;
      
     sums[n] += ((clr >> 8) & 0x0FF);
     if (sums[n] > mmax)  mmax = sums[n];
     if (sums[n] < mmin) mmin = sums[n];
     ++n;
 
     sums[n] += ((clr >> 16) & 0x0FF);
     if (sums[n] > mmax)  mmax = sums[n];
     if (sums[n] < mmin) mmin = sums[n];
     ++n;
  }
 
  float sscale = 255.0/(mmax-mmin);
  n = 0;
  for (int i = 0; i < numPixels; ++i) {
      int b = (int) ((sums[n] - mmin)*sscale);
      int g = (int) ((sums[n+1] - mmin)*sscale);
      int r = (int) ((sums[n+2] - mmin)*sscale);
      n += 3;
      pixels[i] = 0xFF000000 | (r << 16) | (g << 8) | b;
  }
   
  updatePixels();
}



