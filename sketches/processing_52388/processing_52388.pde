
PGraphics canvas;
final int MIX = 250; //255 is maximum

// to speed up the blur
PImage b;

void setup()
{  
  size(800, 600);

  frameRate(600);
  fill(100, 255, 100);

  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(0);
  canvas.noStroke();
  canvas.fill(0, 0, 255);
  canvas.endDraw();

  // to speed up the blur
  b = createImage(width, height, RGB);
}

void draw()
{

  // trail blur
  canvas.loadPixels();
  for (int i=0, y=0; y<canvas.height; y++) {
    for (int x=0; x<canvas.width; x++, i++) {
      canvas.pixels[i] = 0xff000000 | (( canvas.pixels[i]  & 0xFF)*MIX)>>8;
    }
  }
  canvas.updatePixels();
  // end trail blur

  // actual drawing
  canvas.beginDraw();
  canvas.ellipse(mouseX, mouseY, 100, 100);
  canvas.endDraw();
  // end actual drawing

  // the blur effect builds up because it's applied over itself each frame
  // due to the trail function used above
  // this is the version with the fixed constants

  // 1 pixel blur
  canvas.loadPixels();
  int pa[]=canvas.pixels;
  int pb[]=b.pixels;
  int rowStart, rowEnd, y, i;
  for ( y =0; y < height; ++y ) { //edge pixels ignored
    rowStart=y*width  +1;
    rowEnd  =(y+1)*width-1;
    for ( i=rowStart; i<rowEnd; ++i ) {
      int calc = 0;
      calc += pa[i-1]&0xff;
      calc += pa[i+1]&0xff;
      pb[i]=calc>>1;
    }
  }

  for ( y =1; y < height-1; ++y ) { //edge pixels ignored
    rowStart=y*width;
    rowEnd  =(y+1)*width;
    for ( i=rowStart; i<rowEnd; ++i ) {
      int calc = 0;
      calc += pb[i-width]&0xff;
      calc += pb[i+width]&0xff;
      pa[i]=0xff000000|(calc>>1);
    }
  }

  canvas.updatePixels();
  // end 1 pixel blur

  // apply the result
  background(canvas);
  text(frameRate, 100, 10);
}

// just for reference, another version is directly on the draw() loop for performance reasons
void xBlur(PImage a ) {
  // TODO: fix -> edge pixels ignored
  a.loadPixels();
  int h=a.height;
  int w=a.width;
  PImage b;
  b = createImage(w, h, RGB);
  int pa[]=a.pixels;
  int pb[]=b.pixels;
  int rowStart, rowEnd, y, i;

  // this is the more versatile version

  final int B_RADIUS = 4;//can be 1,2,4,8 (2^n)
  final int RADIX = 3;// is always n+1

  for ( y =0; y < h; ++y ) { //edge pixels ignored
    rowStart=y*w  +B_RADIUS;
    rowEnd  =y*w+w-B_RADIUS;
    for ( i=rowStart; i<rowEnd; ++i ) {
      int calc = 0;
      for (int ii= 1; ii<=B_RADIUS;ii++)
      {
        calc += pa[i-ii]&0xff;
        calc += pa[i+ii]&0xff;
      }
      pb[i]=calc>>RADIX; //2^RADIX = 2*B_RADIUS, for the sake of speed
    }
  }

  for ( y =B_RADIUS; y < h-B_RADIUS; ++y ) { //edge pixels ignored
    rowStart=y*w;
    rowEnd  =(y+1)*w;
    for ( i=rowStart; i<rowEnd; ++i ) {
      int calc = 0;
      for (int ii= 1; ii<=B_RADIUS;ii++)
      {
        calc += pb[i-ii*w]&0xff;
        calc += pb[i+ii*w]&0xff;
      }
      pa[i]=0xff000000|(calc>>RADIX); //2^RADIX = 2*B_RADIUS, for the sake of speed
    }
  }

  a.updatePixels();
}


