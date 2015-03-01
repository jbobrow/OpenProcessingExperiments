
PGraphics pg;
PGraphics pg2;
PGraphics pg3;
PImage img;
PImage img2;
int _srcX;
int _srcY;
float _easing = 0.07;

void setup() {
  size(854, 480);
  frameRate(24);
  pg = createGraphics(854, 480, P2D);
  pg2 = createGraphics(854, 480, P2D);
  pg3 = createGraphics(854, 480, P2D);
  img = loadImage("img-cat-02.jpg");
  img2 = loadImage("img-cat-02g.jpg");
  drawImageBuffer();
  drawImageBuffer2();  
  drawImageBuffer3();  
  background(img);
}

void draw() {
  drawGlitch(pg3,0.25,10);
  drawGlitch(pg, 0.2,10);
  drawResponsiveGlitch(pg2, 0.5,80);
  drawResponsiveGlitch(pg, 1.0,80);
}

void drawGlitch(PGraphics target, float scaling, int H) {
  int srcX = int(random(0, width));
  int srcY = int(random(0, height));
  int copyWidth = int(random(width)*scaling);
  int copyHeight = int(random(H));
  int targetX = srcX-copyWidth/2 + int(random(-5, 5));
  int targetY = srcY-copyHeight/2 + int(random(-5, 5));
  copy(target, srcX-copyWidth/2, srcY-copyHeight/2, copyWidth, copyHeight, targetX, targetY, copyWidth, copyHeight);
}
void drawResponsiveGlitch(PGraphics target, float scaling, int H) {
  _srcX += (mouseX-_srcX)*_easing;
  _srcY += (mouseY-_srcY)*_easing;
  int copyWidth = int(random(width)*scaling);
  int copyHeight = int(random(H)*scaling);
  int targetX = _srcX-copyWidth/2 + int(random(-10, 10));
  int targetY = _srcY-copyHeight/2 + int(random(-20, 20));
  copy(target, _srcX-copyWidth/2, _srcY-copyHeight/2, copyWidth, copyHeight, targetX, targetY, copyWidth, copyHeight);
}

void drawImageBuffer() {
  pg.beginDraw();
  pg.image(img, 0, 0);
  pg.endDraw();
}

void drawImageBuffer2() {
  pg2.beginDraw();
  pg2.image(img, 0, 0);
  pg2.filter(INVERT);
  pg2.endDraw();
}

void drawImageBuffer3() {
  pg3.beginDraw();
  pg3.image(img2, 0, 0);
  pg3.endDraw();
}


