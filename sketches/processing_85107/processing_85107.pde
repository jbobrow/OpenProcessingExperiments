
int bCnt;
bubble b[];

PImage img1;

 
//================================================================
 
void setup() {
  size(500,500);
  smooth();
  colorMode(HSB);
   
  bCnt = 70;
  b = new bubble[bCnt];
  for (int i=0; i<bCnt; i++)
    b[i] = new bubble();
  img1 = loadImage("image2.jpg");
}
 
//================================================================
 
void draw() {
  background(150, 128, 128);
  image(img1,0,0);
  for (int i=0; i<bCnt; i++)
    b[i].check();
}
 
//================================================================
 
class bubble {
  float dst, dstSpd;
  float posX, posY;
  float rot, rotSpd;
  float burst;
  boolean bBursting;
  int c;
  //---------------------------
  bubble() {
    reset();
    posX = random(width);
    posY = random(height);
  }
  //---------------------------
  void check() {
    stroke(c, 16, 200);
    pushMatrix();
      translate(posX, posY);
      rotate(rot);
      translate(dst, 0);
      rotate(-rot);
      fill(c, 10, 250, burst);
      ellipse(0, 0, int(dst)>>1, int(dst)>>1);
      fill(255, burst);
      ellipse(-int(dst)>>4, -int(dst)>>4, int(dst)>>3, int(dst)>>3);
    popMatrix();
    dst += dstSpd;
    rot += rotSpd/dst*.5;
    if (random(1000) < int(dst)>>2) bBursting = true;
    if (bBursting) burst += 24;
    if (burst > 255)
      reset();
  }
  //---------------------------
  void reset() {
    dst = 0.0;
    burst = 0.0;
    rot = random(TWO_PI);
    dstSpd = random(1);
    rotSpd = random(10) + 1;
    posX = mouseX ;
    posY = mouseY;
    if (random(100) < 5)
      rotSpd = (random(-5) - 5);
    bBursting = false;
    c = int(random(255));
  }
}


