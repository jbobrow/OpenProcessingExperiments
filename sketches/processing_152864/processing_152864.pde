
/*
  Get colors from base image and animate for ever based on that
  Created by Animoottori / Hannu Kulju Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â© 2014
 */
/* @pjs preload="http://www.nature.org/cs/groups/webcontent/@web/@westvirginia/documents/media/prd_037262.jpg"; */

int pixelSize;  // pixelSize
PImage base;    // Base image
int shift =0;      // Shift of pixels per round. Starts from 0


void setup() {
  pixelSize = 64; //  Set size for new pixels
  colorMode(HSB, 360, 100, 100);
  base = loadImage("http://www.nature.org/cs/groups/webcontent/@web/@westvirginia/documents/media/prd_037262.jpg");
  size(base.width, base.height);
  noStroke();
  background(base);
  //blendMode(BLEND);
}


void draw () {
  //randomSeed(frameCount+millis());
  /*PImage storeImg;
  loadPixels();
  storeImg.pixels[] = pixels[];
  updatePixels();*/
  //storeImg = get();
  int y = shift - pixelSize /2;
  while (y < height) { // move on Y-axis
    int x = shift - pixelSize/2;
    while (x < width) {  // move on X-axis
      color newC = randomPix(x, y, pixelSize,base);
      stroke(90,100,100);
        line(50+x,50,250,100+x);
      fill(newC); //  Add alpha here and the picture will blend into one color faster
      expSquare(x, y, pixelSize);
      x += pixelSize;
    }
    y += pixelSize;
  }
  shift = frameCount % pixelSize;
  
  
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("savedFrame.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(base);
  }
}

void randomPix(int x, int y, int size, PImage img) {
  //float hue = 0;
  //float sat = 0;
  //float bright = 0;
  
  int placeX=0, placeY=0, n=round(random(size));
  placeX = x + round(random(size));
  if (placeX >= width) placeX -= width;
  else if (placeX < 0) placeX += width;
  placeY = y+n;
  if (placeY < 0) placeY += height;
  else if (placeY >= height) placeY -= height;
  placeY *= width;
  
  img.loadPixels();
  
  stroke(60,100,100);
  line(250+x,350,250,100+x);
  color newCol;
  newCol = img.pixels[placeX + placeY];
  
  stroke(160,100,100);
  line(550+x,350,250,100+y);
  img.updatePixels();
  return newCol;
  //hue /= size*size;
  //sat /= size*size;
  //bright /= size*size;
  //return color(hue, sat, bright);
}

void expSquare(int x, int y, int size) {
  int overX = 0, overY = 0, overSizeX = 0, overSizeY = 0, sizeX = size, sizeY = size;
  if (x < 0) {
    overX = x + width;
    overSizeX = width - overX;
    x = 0;
    sizeX -= overSizeX;
  } else if (x+size > width) {
    overX = 0;
    overSizeX = x + sizeX - width;
    size = width - x;
  }
  
  if (y < 0) {
    overY = y + height;
    overSizeY = height - overY;
    y = 0;
    sizeY -= overSizeY;
  } else if (y + size > height) {
    overY = 0;
    overSizeY = y+sizeY - height;
    sizeY = height - y;
  }
  rect(x,y,sizeX,sizeY);
  if (overSizeX != 0 && overSizeY != 0) rect(overX,overY,overSizeX,overSizeY);
}
