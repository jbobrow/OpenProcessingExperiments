
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
   
  doSketch(obuf);
   
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
     mmax = max(mmax, sums[n]);
     mmin = min(mmin, sums[n]);
     ++n;
      
     sums[n] += ((clr >> 8) & 0x0FF);
     mmax = max(mmax, sums[n]);
     mmin = min(mmin, sums[n]);
     ++n;
 
     sums[n] += ((clr >> 16) & 0x0FF);
     mmax = max(mmax, sums[n]);
     mmin = min(mmin, sums[n]);
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
 
void doSketch(PGraphics obuf)
{
  int  nbrPoints = 4 + int(random(11));
  float angle = 2*PI/nbrPoints;
  float inrad = random(width/2);
  float outrad = random(width);
  float phase = random(2*PI);
   
  obuf.beginDraw();
  obuf.colorMode(RGB,1);
  obuf.smooth();
  obuf.background(.5);
 
  obuf.noFill();
  obuf.stroke(random(1),random(1),random(1));
  obuf.strokeWeight(width*.01 + random(width*.2));
  for (int j = 0; j < nbrPoints; ++j)
  {
    obuf.line( width/2 + cos( phase + angle*(j-.5) ) * inrad, height/2 + sin( phase + angle*(j-.5) ) * inrad,
               width/2 + cos( phase + angle*(j) ) * outrad, height/2 + sin( phase + angle*(j) ) * outrad );
    obuf.line(
               width/2 + cos( phase + angle*(j) ) * outrad, height/2 + sin( phase + angle*(j) ) * outrad,
              width/2 + cos( phase + angle*(j+.5) ) * inrad, height/2 + sin( phase + angle*(j+.5) ) * inrad );
  }
  obuf.endDraw();
}



