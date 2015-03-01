
PGraphics pg;
PImage img;
int _depth = 20;
int _offset = 80;
int _flickerSpeed = 3;
int _mouseFWidth = 150;
int _mouseSense = 6;
float _intaractFy;
float _easing = 0.0008;

void setup() {
  size(854, 480, P2D);
  frameRate(30);
  noStroke();
  pg = createGraphics(1024, 480, P2D);
  img = loadImage("img_cat01.jpg");
  drawImageBuffer();
}

void draw() {
  background(#000000);
  for (int i=0; i<height; i += 2) {
    float targetY = mouseY;
    _intaractFy += (targetY - _intaractFy)*_easing;
    float depth = _depth +constrain(_mouseFWidth/(abs(i-_intaractFy)+0.5),0,10)*_mouseSense;
    copy(pg, 0, i, 1024, 1, int(depth*cos(radians(i+frameCount*_flickerSpeed)))-_offset, i, pg.width, 1);
  }
}

void drawImageBuffer() {
  pg.beginDraw();
  pg.image(img, 0, 0);
  pg.endDraw();
}


