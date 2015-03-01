

PGraphics pg;
PImage img;
int mosaicSize = 6;
int picture = 1; 
int transWidth=0;
int trasSpeed=10;

void setup() {
  size(854, 480, P2D);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  pg = createGraphics(854, 480, P2D);
  img = loadImage("img-cat02.jpg");
  drawMosaicCat();
}

void draw() {
  println(picture);
  background(#000000);
  if (transWidth>=width) {
    transWidth = 0;
  }
  else {
    transWidth += trasSpeed;
  }
  image(img, 0, 0);
  copy(pg, 0, 0, transWidth, height, 0, 0, transWidth, height);
}

void drawMosaicCat() {
  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  pg.noStroke();
  pg.smooth();
  pg.image(img, 0, 0);
  pg.loadPixels();

  for (int j = 0; j < pg.height; j+=mosaicSize) { 
    for (int i = 0; i < pg.width; i+=mosaicSize) { 
      color c = pg.pixels[j * pg.width + i];
      pg.fill(0, 0, 0);
      pg.rect(i, j, mosaicSize, mosaicSize);
      pg.fill(190, 100, 75);
      pg.ellipse(i+mosaicSize/2, j+mosaicSize/2, brightness(c)/(100/mosaicSize), brightness(c)/(100/mosaicSize));
    }
  }
  pg.endDraw();
}

void mousePressed() {
  switch(picture) {
  case 1:
    picture = 2;
    img = loadImage("img-cat03.jpg");
    break;
  case 2:
    picture =3;
    img = loadImage("img-cat04.jpg");
    break;
  case 3:
    picture =1;
    img = loadImage("img-cat02.jpg");
    break;
  }
    transWidth=0;
    drawMosaicCat();
  
}


