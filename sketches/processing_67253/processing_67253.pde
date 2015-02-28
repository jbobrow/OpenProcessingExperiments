
PImage imgOrig, mskOrig; //original image and original mask (neither get changed)
PImage imgDisp, mskDisp; //display image and display mask (changed all the time)
PImage imgBack; //background, text and arrow static image ('cuz I'm lazy)
int prevVal; //keep track of val so we don't update images every draw cycle
boolean bShowMask; //flag to indicate whether or not we show the mask

//================================================================

void setup() {
  size(500,600);
  smooth();
  
  //set up the images
  imgOrig = loadImage("Lisa.jpg"); //base image
  mskOrig = loadImage("LisaMask.jpg"); //base mask image
  imgBack = loadImage("LisaBack.png"); //lazy background
  imgDisp = createImage(imgOrig.width, imgOrig.height, RGB); //couple empty images
  mskDisp = createImage(imgOrig.width, imgOrig.height, RGB);
  mskOrig.loadPixels(); //load up them pixels
  mskDisp.loadPixels();
  imgDisp.loadPixels();
  
  prevVal = -1; //setting to -1 ensure a redraw
  bShowMask = true; //starts off normally showing the mask
}

//================================================================

void draw() {
  int val = int(255 - (float)mouseY/height*255); //get a new val (based on mouse's position (Y-axis) (0-255)
  if (prevVal != val) { //only update the image if the val has changed
    prevVal = val; //remember this
    
    image(imgBack,0, 0); //black background, arrow, text, etc.
    
    shiftMask(val); //shift the mask by the amount of val    
    
    if (bShowMask) //if the show-mask flag is set, show the mask
      image(mskDisp, 0, 0);
    else { //if the show-mask flag isn't set, show the blurred image
      maskedBlur();
      image(imgDisp, 0, 0);
    }
  }
}

//================================================================

void shiftMask(int offset) {
  offset &= 0xFF; // ensure offset's less than 256
  for (int i=0; i < mskOrig.pixels.length; i++) {
    int val = abs((mskOrig.pixels[i] & 0xFF) - offset); //all the channels are the same, so just use the blue one
    mskDisp.pixels[i] = color(val);
  }
  mskDisp.updatePixels();
}

//================================================================

void maskedBlur() {
  for (int i=0; i < imgOrig.pixels.length; i++) {
    
    //get the sample
    int posY = i/imgOrig.width; //get x and y position for PImage.get later on
    int posX = i - posY*imgOrig.width;
    int blurSz = (mskDisp.pixels[i] & 0xFF) >> 5; //get the sample size (range: 0-8)
    blurSz += blurSz%2 + 1; //keep the blurSz odd (to prevent jittering
    int halfSz = blurSz >> 1; //get this number so I only have to do it once
    PImage sample = imgOrig.get(posX - halfSz, posY - halfSz, blurSz, blurSz);
    
    //figure the sample average
    sample.loadPixels();
    int r=0, g=0, b=0; //need the average of each channel
    for (int si=0; si<sample.pixels.length; si++) {
      r += (sample.pixels[si] >> 16) & 0xFF; //bit twiddling is fast
      g += (sample.pixels[si] >> 8) & 0xFF;
      b += sample.pixels[si] & 0xFF;
    }
    r /= sample.pixels.length; //final averaging
    g /= sample.pixels.length;
    b /= sample.pixels.length;
    
    imgDisp.pixels[i] = color(r, g, b); //all that for just one single pixel...
  }
  imgDisp.updatePixels();
}

//================================================================

void keyPressed() {
  //watch for the <Shift> being pressed
  if (key == CODED)
    if (keyCode == SHIFT) {
      bShowMask = false;
      prevVal = -1;
    }
}

//================================================================

void keyReleased() {
  //watch for the <Shift> key being released
  bShowMask = true; //normal state
  prevVal=-1;
}


