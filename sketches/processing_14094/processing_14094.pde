

float feedback = 0.7;

PImage grad;
PGraphics p;
PVector cp[] = new PVector[4];
int vi = 0;

void setup(){  
  frameRate(20);
  size(500, 300, P2D);
  grad = createImage(width, height, RGB);
  p = createGraphics(width, height, P2D);
  p.background(0);
  background(0);
  for (int i=0; i<cp.length; i++) {
    cp[i] = new PVector(); 
  }
}

void mousePressed() {
  vi = 0;
  cp[vi].x = mouseX;
  cp[vi].y = mouseY; 
  vi++;
}

void mouseDragged() {  
  p.beginDraw();
  p.strokeCap(PROJECT);
  p.strokeJoin(BEVEL);
  p.noFill();
  p.strokeWeight(5);
  p.stroke(255);
  PVector p0 = cp[vi%4];
  if (vi >= 4){
    PVector p1 = cp[(vi+1)%4];
    PVector p2 = cp[(vi+2)%4];
    PVector p3 = cp[(vi+3)%4];  
    p.bezier(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);    
  }
  p.endDraw();
  p0.x = mouseX;
  p0.y = mouseY;
  vi++;
}

void draw() {  
  
  image(p, 0, 0);
  
  //copy(grad, 0, 0, width, height, 0, 0, width, height);
  
  p.beginDraw();  
  p.loadPixels();  
  for (int r = 1; r < height - 1; r++) {
    for (int c = 1; c < width - 1; c++) {
      int p00 = p.pixels[(r - 1) * width + c - 1];
      int p01 = p.pixels[(r - 1) * width + c];
      int p02 = p.pixels[(r - 1) * width + c + 1];      
      int p10 = p.pixels[r * width + c - 1];
      int p11 = p.pixels[r * width + c];      
      int p12 = p.pixels[r * width + c + 1];      
      int p20 = p.pixels[(r + 1) * width + c - 1];
      int p21 = p.pixels[(r + 1) * width + c];
      int p22 = p.pixels[(r + 1) * width + c + 1];      
      p00 &= 0xFF; p01 &= 0xFF; p02 &= 0xFF;
      p10 &= 0xFF; p11 &= 0xFF; p12 &= 0xFF;
      p20 &= 0xFF; p21 &= 0xFF; p22 &= 0xFF;      
      // sobel
      float gx = p02 - p00 + 2 * (p12 - p10) + p22 - p20;
      float gy = p00 - p20 + 2 * (p01 - p21) + p02 - p22;
      int pv = (int)((abs(gx) + abs(gy)) / 8f);
      grad.pixels[r * width + c] = pv | (pv << 8) | (pv << 16) | (0xff << 24);
    } 
  }  
  
  p.noFill();
  p.strokeWeight(1);
  for (int r = 1; r < height - 1; r++) {
    for (int c = 1; c < width - 1; c++) {
      int pv = grad.pixels[r * width + c] & 0xFF;
      if (pv > 0) {
        int p0 = p.pixels[r * width + c] & 0xFF;
        int v = (int)(pv + p0 * feedback);
        p.stroke(v);
        p.point(c,r);
      }
    }    
  }  
  p.endDraw(); 
}

