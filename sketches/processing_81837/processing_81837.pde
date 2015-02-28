
color fg = color(124,180,224);
color bg = color(0, 103, 160);

int curX,curY,charWidth,charHeight;

void setup() {
  size(500,300);
  background(bg);
  frameRate(120);
  strokeWeight(2);
  stroke(fg);

  charWidth = width/40;
  charHeight= height/24;
  curX=0;
  curY=0;
}

void draw() {
  if(myRandom()) {
    strokeWeight(random(1,3));
    line(curX,curY,curX+charWidth,curY+charHeight);
  } 
  else {
    strokeWeight(0.5);
    line(curX+charWidth,curY,curX,curY+charHeight);
  }
  curX += charWidth;
  if (curX > width) {
    curX=0;
    curY += charHeight;
  }
  if (curY+charHeight > height) {
    // move the current screen contents up somehow
    loadPixels();
    for (int i=0; i < width*(height-2*charHeight); i++) {
      pixels[i] = pixels[i+width*2*charHeight];
    }
    // clear the stuff left at the bottom
    for (int i=width*(height-2*charHeight); 
         i < height*width; i++) {
        pixels[i]=#0067A0;
    }
    updatePixels();

    curY=height-2*charHeight;
  }
}

// returns a random boolean ... in interesting ways
boolean myRandom() {
  if (myGaussian()*0.15 < ((float)curX/width - 0.4)) {
    return true;
  } else {
    return false;
  }
}

// ported from http://www.colingodsey.com/javascript-gaussian-random-number-generator/
float myGaussian() {
  float x1, x2, rad;
 
  do {
    x1 = 2 * random(1) - 1;
    x2 = 2 * random(1) - 1;
    rad = x1 * x1 + x2 * x2;
  } while(rad >= 1 || rad == 0);
 
  float c = sqrt(-2 * (float)Math.log(rad) / rad);
 
  return x1 * c;
};


