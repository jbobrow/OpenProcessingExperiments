
//Processing Composition
 
final int compositionSideLength = 400;
final int sideDivisor = 5;
final int stepsToClear = 30;
int offset = 0;
 
int colorIdx = 0;
SteppableColor[] theColors;
int elapsedTime;
float angle = 0;

int imageIdx = 0;
 
final int boxSize = compositionSideLength / sideDivisor;

PImage[] images = null;
 
void setup() {
 
  elapsedTime = millis();
  theColors = new SteppableColor[100];
    
  JSONObject json = loadJSONObject("https://api.foursquare.com/v2/venues/categories?client_id=V5YOOBWVTOWZVZAVJWXKVNSG33BESTLT3EIOSEK3ENU2MXMM&client_secret=ZKDEXKPR33H2XALLJR1O4QGVMDJ1Q45UYTIGR4SN2VE3V5T5");
  JSONObject response = json.getJSONObject("response");
  JSONArray categories = response.getJSONArray("categories");
  
  images = new PImage[categories.size()];
  
  for (int i = 0; i < categories.size(); ++i) {
     JSONObject category = categories.getJSONObject(i);
     String url = category.getString("icon");
     images[i] = loadImage(url);
  }
    
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
   
 translate(width/2, height/2);
 rotate(angle);
 translate(-width/2, -height/2);
   
  fill(0xFF, 120);
  rect(0, 0, compositionSideLength, compositionSideLength);
   
  for (int i = 0; i < sideDivisor; ++i) {
    for (int j = 0; j < sideDivisor; ++j) {
      theColors[colorIdx].increment();
      int randomInset = round(random(0.f, (boxSize/2.f)-1));
      int cornerRadius = round(random(0.f, (boxSize/2.f)-1));
 
      int xPos = ((i * boxSize) + randomInset + offset) % compositionSideLength;
      int yPos = (j * boxSize)+randomInset;
      tint(randomColor());
      int size = (boxSize - randomInset);
      image(images[imageIdx], xPos, yPos);
      
      imageIdx = (imageIdx + 1) % images.length;
    }
  }
 
 
  offset = (offset + 2) % boxSize;
 
  colorIdx = (colorIdx + 1) % theColors.length;
}
 
class Bouncy {
   
  PImage img;
   
  float x, y, xVel, yVel;
   
  Bouncy(String url) {
    img = loadImage(url);
    img.resize(100,100);
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



