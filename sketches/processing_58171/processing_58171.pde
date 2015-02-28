
// Created by Tien Ling
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

void setup() {
  size(580, 580, P3D);  
  rectMode(CORNERS); 
  noFill();
  noStroke();
  colorMode(HSB);
}

void draw() {
  background (100);
  int blockW = 100;
  int blockH = 40;
  for (int locX = blockW/2; locX < width; locX += blockW+25) {
    for (int locY = blockH/2; locY < height; locY += blockH+20) {
      block (locX-blockW/2 +5, locY-blockH/2, blockW, blockH);
    }
  }
}

void block (int x, int y, float blkW, float blkH) {

  pushMatrix(); // draw block boundary
  fill(220);
  translate (x, y, 0);
  rect (-5, -5, blkW+5, blkH+5);
  popMatrix();

  pushMatrix(); // draw corner boxes
  fill (random(120, 200)); 
  float rx1 = random (20, blkW/2);
  float ry1 = random (20, blkH);
  float h1 = random (10, 100);
  translate (x+1+rx1/2, y-1+ry1/2, h1/2);
  box (rx1, ry1, h1);
  popMatrix();

  pushMatrix(); 
  fill (random(120, 200)); 
  float rx2 = random (20, blkW/2);
  float ry2 = random (20, blkH);
  float h2 = random (10, 100);
  translate (x-1+rx2/2, y+1+blkH-ry2/2, h2/2);
  box (rx2, ry2, h2);
  popMatrix();

  pushMatrix();
  fill (random(120, 200)); 
  float rx3 = random (20, blkW/2);
  float ry3 = random (20, blkH);
  float h3 = random (10, 100);
  translate (x-1+blkW-rx3/2, y+1+ry3/2, h3/2);
  box (rx3, ry3, h3);
  popMatrix();

  pushMatrix();
  fill (random(120, 200)); 
  float rx4 = random (20, blkW/2);
  float ry4 = random (20, blkH);
  float h4 = random (10, 100);
  translate (x+1+blkW-rx4/2, y-1+blkH-ry4/2, h4/2);
  box (rx4, ry4, h4);
  popMatrix();

  pushMatrix(); // draw row boxes
  fill (0, 80, 200, 50); 
  float mx1 = (blkW-rx1-rx3);
  float my1 = random (10, 17.5);
  float mh1 = 10.0;
  translate (x+(blkW-rx1-rx3)/2+rx1, y+my1/2, mh1/2);
  box (mx1, my1, mh1);
  popMatrix();

  pushMatrix();
  fill (0, 80, 200, 50); 
  float mx2 = (blkW-rx2-rx4);
  float my2 = random (10, 17.5);
  float mh2 = 10.0;
  translate (x+(blkW-rx2-rx4)/2+rx2, y+blkH-(my2/2), mh2/2);
  box (mx2, my2, mh2);
  popMatrix();

  noLoop();
}
void mousePressed () {
  loop();
}








