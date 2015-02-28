
/* @pjs preload="fish1.png,fish2.png"; */

PImage f1, f2;
float f1x, f1y;

void setup(){
  size(300,300);
  noCursor();
  f1 = loadImage("fish1.png");
  f2 = loadImage("fish2.png");
  f1x = (width - f1.width)/2;
  f1y = (height - f1.height)/2;
}


void draw(){
  background(120,160,240);
  image(f1,f1x,f1y);
  image(f2,mouseX,mouseY);
  if(pp_collision(f1,f1x,f1y,f2,mouseX,mouseY)){
    stroke(255,64,64);
    strokeWeight(1);
    noFill();
    rect(f1x,f1y,f1.width,f1.height);
    rect(mouseX,mouseY,f2.width,f2.height);
  }
}

// A pixel width an alpha level below this value is
// considered transparent.
final int ALPHALEVEL = 20;

boolean pp_collision(PImage imgA, float aix, float aiy, PImage imgB, float bix, float biy) {
  int topA, botA, leftA, rightA;
  int topB, botB, leftB, rightB;
  int topO, botO, leftO, rightO;
  int ax, ay;
  int bx, by;
  int APx, APy, ASx, ASy;
  int BPx, BPy; //, BSx, BSy;

  topA   = (int) aiy;
  botA   = (int) aiy + imgA.height;
  leftA  = (int) aix;
  rightA = (int) aix + imgA.width;
  topB   = (int) biy;
  botB   = (int) biy + imgB.height;
  leftB  = (int) bix;
  rightB = (int) bix + imgB.width;

  if (botA <= topB  || botB <= topA || rightA <= leftB || rightB <= leftA)
    return false;

  // If we get here, we know that there is an overlap
  // So we work out where the sides of the overlap are
  leftO = (leftA < leftB) ? leftB : leftA;
  rightO = (rightA > rightB) ? rightB : rightA;
  botO = (botA > botB) ? botB : botA;
  topO = (topA < topB) ? topB : topA;


  // P is the top-left, S is the bottom-right of the overlap
  APx = leftO-leftA;   
  APy = topO-topA;
  ASx = rightO-leftA;  
  ASy = botO-topA-1;
  BPx = leftO-leftB;   
  BPy = topO-topB;

  int widthO = rightO - leftO;
  boolean foundCollision = false;

  // Images to test
  imgA.loadPixels();
  imgB.loadPixels();

  // These are widths in BYTES. They are used inside the loop
  //  to avoid the need to do the slow multiplications
  int surfaceWidthA = imgA.width;
  int surfaceWidthB = imgB.width;

  boolean pixelAtransparent = true;
  boolean pixelBtransparent = true;

  // Get start pixel positions
  int pA = (APy * surfaceWidthA) + APx;
  int pB = (BPy * surfaceWidthB) + BPx;

  ax = APx; 
  ay = APy;
  bx = BPx; 
  by = BPy;
  for (ay = APy; ay < ASy; ay++) {
    bx = BPx;
    for (ax = APx; ax < ASx; ax++) {
      pixelAtransparent = alpha(imgA.pixels[pA]) < ALPHALEVEL;
      pixelBtransparent = alpha(imgB.pixels[pB]) < ALPHALEVEL;

      if (!pixelAtransparent && !pixelBtransparent) {
        foundCollision = true;
        break;
      }
      pA ++;
      pB ++;
      bx++;
    }
    if (foundCollision) break;
    pA = pA + surfaceWidthA - widthO;
    pB = pB + surfaceWidthB - widthO;
    by++;
  }
  return foundCollision;
}

  
  


