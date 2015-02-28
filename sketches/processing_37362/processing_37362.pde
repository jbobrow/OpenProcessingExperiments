

//thanks to bitcraft for the beautiful glow and blur functions http://www.openprocessing.org/visuals/?visualID=5286 
import processing.opengl.*;
float rotation=0;
float xoff = 0.0;
float xincrement = 0.05; 
void setup() {
  size(500,500, P3D);
  smooth();
}


void draw() {
  
  ellipseMode(CENTER);
  stroke(0,255,0);
  noFill();
  background(0);
  strokeWeight(4);
  pushMatrix();

  translate(width*0.5, height*0.5, 0);

  ellipse(0, 0, 60, 60);
  for (int i= 0; i<8; i++) {
    rotateZ(radians(rotation));
    rotateZ(PI/4);
    pushMatrix();

    translate(noise(xoff)*200, 0, 0);
    ellipse(0, 0, 60+(xoff*5), 60+(xoff*60));
    popMatrix();
  }
  
  popMatrix();
    loadPixels();
  glow(3,3);
  updatePixels();

  rotation+=0.1;
  xoff += xincrement;

}

void glow(int r, int b) {
  loadPixels();
  blur(1); // just adding a little smoothness ...
  int[] px = new int[pixels.length];
  arrayCopy(pixels, px);
  blur(r);
  mix(px, b);
  updatePixels();
}

void blur(int dd) {
   int[] px = new int[pixels.length];
   for(int d=1<<--dd; d>0; d>>=1) { 
      for(int x=0;x<width;x++) for(int y=0;y<height;y++) {
        int p = y*width + x;
        int e = x >= width-d ? 0 : d;
        int w = x >= d ? -d : 0;
        int n = y >= d ? -width*d : 0;
        int s = y >= (height-d) ? 0 : width*d;
        int r = ( r(pixels[p+w]) + r(pixels[p+e]) + r(pixels[p+n]) + r(pixels[p+s]) ) >> 2;
        int g = ( g(pixels[p+w]) + g(pixels[p+e]) + g(pixels[p+n]) + g(pixels[p+s]) ) >> 2;
        int b = ( b(pixels[p+w]) + b(pixels[p+e]) + b(pixels[p+n]) + b(pixels[p+s]) ) >> 2;
        px[p] = 0xff000000 + (r<<16) | (g<<8) | b;
      }
      arrayCopy(px,pixels);
   }
}
 
void mix(int[] px, int n) {
  for(int i=0; i< pixels.length; i++) {
    int r = (r(pixels[i]) >> 1)  + (r(px[i]) >> 1) + (r(pixels[i]) >> n)  - (r(px[i]) >> n) ;
    int g = (g(pixels[i]) >> 1)  + (g(px[i]) >> 1) + (g(pixels[i]) >> n)  - (g(px[i]) >> n) ;
    int b = (b(pixels[i]) >> 1)  + (b(px[i]) >> 1) + (b(pixels[i]) >> n)  - (b(px[i]) >> n) ;
    pixels[i] =  0xff000000 | (r<<16) | (g<<8) | b;
  }
}
 
int r(color c) {return (c >> 16) & 255; }
int g(color c) {return (c >> 8) & 255;}
int b(color c) {return c & 255; }


