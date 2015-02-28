
PImage img;
PImage img_2;
PGraphics buf;
int copyOffsetX;
int copyOffsetY;
int copyWidth;
int copyHeight;
int imageX = 0;

void setup() {
  size(745, 745, P3D);

  img = loadImage("strip.png");
  img_2 = loadImage("strip_2.png"); 
  buf = createGraphics(800, 800, JAVA2D);
  buf.beginDraw();
  buf.smooth();
  buf.background(255);
  for (int i = 0; i < buf.width; i+=10) {
    buf.line(i, 0, i + 50, buf.height);
    buf.line(0, i, buf.height, i + 30);
  }
  buf.endDraw();

  copyOffsetX = 0;
  copyOffsetY = 0;
  copyWidth = width;
  copyHeight = height;
}

void draw() {
  background(0);
  image(img, -385 + imageX, -75);

  if (mousePressed == true) {
    image(img_2, -385 + imageX, -75);
  }
}



PImage img() {
  return buf.get(copyOffsetX, copyOffsetY, copyWidth, copyHeight);
}


void keyPressed() {
  switch(keyCode) {
  case LEFT:
    imageX += 20;
    if (copyOffsetX < buf.width - width) {
      copyOffsetX++;
    }
    break;

  case RIGHT:
    imageX -= 20;
    if (copyOffsetX > 0) {
      copyOffsetX--;
    }
    break;

  case UP:
    if (copyOffsetY < buf.height - height) {
      imageX -= 745;
      copyOffsetY++;
    }
    break;

  case DOWN:
    if (copyOffsetY > 0) {
      imageX += 745;
      copyOffsetY--;
    }
    break;
  }
}


