
//thanks to bitcraft for the beautiful blur functions
//http://www.openprocessing.org/visuals/?visualID=5286

PFont font;


void setup() {
 size(500, 500);
 hint(ENABLE_NATIVE_FONTS);
  font = createFont("m", 400);
smooth();
  textFont(font);


  textAlign(CENTER, CENTER);
}

void draw() {
  loadPixels();
  //eyes killer strobo!
  filter(INVERT);
 blur(4);

  updatePixels();
     fill(random(255), random(255), random(255));
  text(char(int(random(0,65535))), width*0.5, height*0.40);
  //65535 is the number of unicode characters
}


void blur(int dd) {
  int[] px = new int[pixels.length];
  for (int d=1<<--dd; d>0; d>>=1) { 
    for (int x=0;x<width;x++) for (int y=0;y<height;y++) {
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
    arrayCopy(px, pixels);
  }
}


int r(color c) {
  return (c >> 16) & 255;
}
int g(color c) {
  return (c >> 8) & 255;
}
int b(color c) {
  return c & 255;
}


