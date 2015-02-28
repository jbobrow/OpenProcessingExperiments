
//Processing Composition

final int compositionSideLength = 400;
final int sideDivisor = 10;
final int stepsToClear = 30;
int offset = 0;

int colorIdx = 0;
SteppableColor[] theColors;

int elapsedTime;

Bouncy bouncyThing = null;
Bouncy bouncyThing2 = null;

void setup() {

  elapsedTime = millis();
  bouncyThing = new Bouncy("http://www.uarts.edu/sites/default/files/imagecache/thumbnail/archive/profiles/DeAngela_Duff_rdax_145x150.jpg");

  theColors = new SteppableColor[100];

  for (int i = 0; i < theColors.length; ++i) { 
    SteppableColor theColor;
    if (i == 0) theColor = new SteppableColor(0x6BBCDC);
    else {
      SteppableColor oldColor = theColors[i-1];
      oldColor.increment(2);
      theColor = new SteppableColor(oldColor.getColor());
    } 
    theColors[i] = theColor;
  }

  size(400, 400);
  smooth(); //anti-alias
  background(255);
  noStroke();
  frameRate(10);
}



color randomColor() {

  color colorToAverage = theColors[colorIdx].getColor(); 

  int r = round((red(colorToAverage) + random(0xFF)) / 2.f);
  int g = round((green(colorToAverage) + random(0xFF)) / 2.f);
  int b = round((blue(colorToAverage) + random(0xFF)) / 2.f);

  return color(r, g, b);
}

void draw() {

  int boxSize = compositionSideLength / sideDivisor;

  fill(0xFF, 120);
  rect(0, 0, compositionSideLength, compositionSideLength);

  for (int i = 0; i < sideDivisor; ++i) {
    for (int j = 0; j < sideDivisor; ++j) {
      theColors[colorIdx].increment();
      fill(randomColor());
      int randomInset = round(random(0.f, boxSize/2.f));
      int cornerRadius = round(random(0.f, boxSize/2.f));
      int xPos = ((i * boxSize) + randomInset + offset) % compositionSideLength;
      rect(xPos, (j * boxSize)+randomInset, boxSize - (2*randomInset), boxSize - (2*randomInset), cornerRadius);
    }
  }


  offset = (offset + 2) % boxSize;

  colorIdx = (colorIdx + 1) % theColors.length;

  bouncyThing.draw();
  bouncyThing.tick();

  if (bouncyThing2 != null) {
    bouncyThing2.draw();
    bouncyThing2.tick();
    if (bouncyThing2.currentRect().intersectsRect(bouncyThing.currentRect())) {
      bouncyThing.bounce();
      bouncyThing2.bounce();
    }
  }
  else {
    if (millis() - elapsedTime > 5000) {
      bouncyThing2 = new Bouncy("http://tendigi.com/image/nick_lee.jpg");
    }
  }
}  

class Bouncy { 
  
  PImage img;
  
  float x, y, xVel, yVel;
  
  Bouncy(String url) {
    img = loadImage(url);
    xVel = (second() % 25) + 1;
    yVel = random(0, 20);
  }
  
  void tick() {
    x += xVel;
    y += yVel;
    if (x >= width-img.width || x <= 0) xVel *= -1;
    if (y >= height-img.height || y <= 0) yVel *= -1;
  }
  
  void bounce() {
     xVel *= -1;
     yVel *= -1;
  }
  
  Rectangle currentRect() {
    return new Rectangle((int)x, (int)y, img.width, img.height);
  }
  
  void draw() {
    image(img, x, y);
  }
}
class Rectangle {
  int _x, _y, _w, _h;
  
  Rectangle(int x, int y, int w, int h) {
    _x = x;
    _y = y;
    _w = w;
    _h = h;
  }
  
  boolean intersectsRect(Rectangle other) {
    return !(_x + _w < other._x || _y + _h < other._y || _x > other._x + other._w || _y > other._y + other._h);
  }
}
class SteppableColor {
  color _color;

  SteppableColor(color startColor) {
    _color = startColor;
  }

  void increment(int amt) {
    float r = (red(_color) +amt) % 256;
    float g = (green(_color) + amt) % 256;
    float b = (blue(_color) + amt) % 256;
    _color = color(r, g, b);
  }

  void increment() {
    increment(1);
  }
  
  color getColor() {
    return _color;
  }
}



