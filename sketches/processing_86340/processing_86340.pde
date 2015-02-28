
/* Code taken from various examples in Shiffman's Learning Processing.
Examples mainly from Lesson 7 with slight alterations. 
HINT: Load any image you want into the sketch, just make sure a adjust the 
size to match that of the image. 
*/

PImage img;
int maxCircleSize;

void setup() {
  size (800, 535);
  img = loadImage("alexis.jpeg");
}

void draw() {
  loadPixels();
  maxCircleSize = 10;
  background(0);
  img.loadPixels();
  //iterate through a 2 dimensional grid and draw colored circles
  // the circle size is based on the brightness of the pixel
  for (int y = 0; y < img.height; y+=maxCircleSize) {
    for (int x = 0; x < img.width; x+=maxCircleSize) {
      int index = getIndex(x, y, img.width, img.height);
      float r = red(img.pixels[index]);
      float g = green(img.pixels[index]);
      float b = blue(img.pixels[index]);
      float bright = (r+g+b);
      fill(r, g, b);
      //figure out the size of this circle
      // maxCircleSize will get multiplied by a value between 0 and 1,
      //so the size will always be between 0 - MaxCircleSize.
      //in other words, if bright = 128, then 128/255 = 0.5
      float circleSize = maxCircleSize * (bright/255);
      ellipse(x, y, circleSize, circleSize);
    }
  }
}
//returns the 1 dimensional index location for a 2 dimensional x,y location
//based on the width and height of the 2D space.
  int getIndex(int x, int y, int w, int h) {
    return y*width+x;
  }

//returns the 2 dimensional (x,y) location for a 1 dimensional index
//based on the width and height of the 2D space.
  int[] getIndexXY(int index, int w, int h) {
    int[] xy = new int[2]; 
    //xy[0]=x, xy[1]=y
    xy[0] = index/w;
    xy[1] = index/h;
    return xy;
  }


