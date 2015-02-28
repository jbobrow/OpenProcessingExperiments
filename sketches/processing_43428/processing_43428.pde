
PImage butterfly;
Dots[] Runners;
int nDots = 800;

void setup(){
  background(0);
  butterfly = loadImage("city.jpg");
  butterfly.loadPixels();
  int bw = butterfly.width;
  int bh = butterfly.height;
  size(bw, bh);

  Runners = new Dots[nDots];

  int x = (int) random(width);
  int y = (int) random(height);

  for (int i=0; i<nDots; i++){
    color c = getColor(x, y, butterfly);
    float grayFactor = (red(c) + green(c) + blue(c))/3.0/255.0;
    float velocity = 11 - grayFactor * 10.0 + 1.0;
    Runners[i] = new Dots (random(width), random(height), velocity, c);

  }
}

void draw(){

  //image(butterfly, 0, 0);

  for (int i=0; i<nDots; i++){
    Runners[i].update();
    Runners[i].render();
  }
}

class Dots {
  color edge;
  float x;
  float y;
  float vx;

  Dots (float inX, float inY, float vel, color myColor){
    x = inX;
    y = inY;
    vx = vel;
    edge = myColor;
  }

  void render(){
    int x = (int) random(width);
    int y = (int) random(height);
    edge = getColor(x, y, butterfly);
    stroke(edge);
    noFill();

    float pixColor = (red(edge) + green(edge) + blue(edge))/3.0/255.0;
    float circSize = 15 - (pixColor * 5 + 5);
    ellipseMode(CENTER);
    ellipse(x, y, circSize, circSize);
  }

  void update(){
    x += vx;

    while (x > width){
      x -= width;
    }
    while (x < 0){
      x += width;
    }
  }
}

color getColor(int x, int y, PImage pic){
  int maxLoc = pic.width*pic.height;
  int loc = (y*pic.width) + x;
  if (loc < maxLoc){
    return pic.pixels[loc];
  } else {
    return 0;
  }
}

