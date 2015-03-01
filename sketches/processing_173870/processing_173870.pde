
PImage img;
int mosaicSize;
float satScale;
int mosaicStep=50;
boolean mosaicMode = true; 

void setup() {
  size(640, 360);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  img = loadImage("img-cat01.jpg");
  image(img, 0, 0);
  loadPixels();
  rectMode(CENTER);
}

void draw() {
  background(#CCCCCC);
  if (mosaicMode == true) {
    drawMosaicCat();
  }
  else {
    image(img, 0, 0);
  }
}

void drawMosaicCat() {
  mosaicSize = int(abs(height/2-mouseY)/mosaicStep)+1;
  satScale = (width/2-abs(width/2-mouseX))/(width/2+0.001);
  for (int j = 0; j < height; j+=mosaicSize*2) { 
    for (int i = 0; i < width; i+=mosaicSize*2) { 
      color c = pixels[j * width + i];
      fill(hue(c), saturation(c)*satScale, brightness(c));
      pushMatrix();
      translate(i, j);
      rotate(brightness(c));
      rect(0, 0, brightness(c)/3.0, mosaicSize/2+1);
      popMatrix();
    }
  }
}

void mousePressed() {
  if (mosaicMode == true) {
    mosaicMode = false;
  }
  else {
    mosaicMode = true;
  }
}


