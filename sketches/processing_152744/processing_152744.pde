
/*
  Get colors from base image and animate for ever based on that
  Created by Animoottori / Hannu Kulju 2014
 */
/* Bangladesa: Ny fahitan'ireo nody an-tanindrazana azy */
/* @pjs preload="http://globalvoicesonline.org/wp-content/uploads/2009/07/bangladesh-nature.jpg"; */

int pixelSize;  // pixelSize
PImage base;    // Base image
int shift = 0;      // Shift of pixels per round. Starts from 0


void setup() {
  pixelSize = 32; //  Set size for new pixels
  //colorMode(HSB, 360, 100, 100);
  base = loadImage("http://globalvoicesonline.org/wp-content/uploads/2009/07/bangladesh-nature.jpg");
  size(base.width, base.height);
  noStroke();
  background(base);
  //blendMode(OVERLAY);
}


void draw () {
  randomSeed(frameCount+millis());
  int y = shift - pixelSize /2;
  while (y < height) { // move on Y-axis
    int x = shift - pixelSize/2;
    while (x < width) {  // move on X-axis
    
      int n=round(random(size)); 
      int placeX=x + n;  
      n=round(random(size));
      int placeY= +n; 
      if (placeX >= width) placeX -= width;
      else if (placeX < 0) placeX += width;
      if (placeY >= height) placeY -= height;
      else if (placeY < 0) placeY += height;
 
      //placeY *= width;
  
      //loadPixels();
      stroke(60,100,100);
      line(250+x,350,250,100+x);
  
      color newC = get(placeX,placeY); // pixels[placeX + placeY]; // Get the colors from the copy of the old image
  
      stroke(160,100,100);
      line(550+x,350,250,100+y);
      //updatePixels();
      
      fill(newC); //  Add alpha here and the picture will blend into one color faster
      expSquare(x, y, pixelSize);    //    Put new color squares on the old image (not on the copy)
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

void expSquare(int x, int y, int size) {
  int overX = 0, overY = 0, overLength = 0, overHeight = 0, sizeL = size, sizeH = size;
  if (x < 0) {
   overLength = size+x;
   sizeL = abs(x);
   overX = 0;
   x += width;
  } else if (x + size >= width) {
   sizeL = width-x;
   overLength = size - sizeL;
   overX = 0;
  }
  
  if (y < 0) {
   overHeight = size+y;
   sizeH = abs(y);
   overY = 0;
   y += height;
  } else if (y + size >= height) {
   sizeH = height-y;
   overHeight = size - sizeH;
   overY = 0;
  }
  
  rect(x,y,sizeL,sizeH);
  if (overLength != 0 && overHeight != 0) rect(overX,overY,overLength,overHeight);
}
