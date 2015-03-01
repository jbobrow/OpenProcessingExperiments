
Slider slider;
Coord coord;
int oldWidth;
float d = 0.06;
int steps = 150;
float range = 14*PI;
float maxY = 1.1;
float freq = 1;
float deltaf = 0.0008;
float hue = 0;
boolean coloured = true;
boolean animationOn = true;

void setup() {
  size(700, 500);
  oldWidth = width;
  colorMode(HSB, 360, 100, 100, 100);
  textAlign(CENTER, CENTER);
  resizeAfterCanvas();
  background(0, 0, 10);
}

void draw() {
  if (oldWidth != width) {
    resizeAfterCanvas();
  }
  if (freq >=2 || freq < 0) {
    deltaf = -deltaf;
  }
  if (animationOn) {
    freq += deltaf;
    if (coloured) {
      hue = (hue+0.4) % 360;
      strokeWeight(2);
      stroke(hue, 100, 60);
    } else {
      background(0, 0, 10);
      strokeWeight(4);
      stroke(0, 0, 90);
    }
    drawPath(steps, range, freq);
  }
  drawMenu();
  slider.update();
  d = slider.getValue();
  slider.redraw();
}

void mouseClicked() {
  if (mouseX > width*5/7 && mouseY < height*4/5) {
    int top = (int) Math.floor(mouseY/(height/5));
    if (top == 0) {
      background(0, 0, 10);
      coloured = true;
    } else if (top == 1) {
      coloured = false;
    } else if (top == 2) {
      background(0, 0, 10);
    } else {
      animationOn = !animationOn;
    }
  }
}

void resizeAfterCanvas() {
  coord = new Coord(height, height, -maxY, maxY, -maxY, maxY);
  slider = new Slider(width*5/7+0.1*width*2/7, height*4/5+height/20, width*2/7*0.8, height/10, 0, 0.1, d, height/20);
  oldWidth = width;
}

void drawPath(int steps, float range, float freq) {
  PVector[] ar = new PVector[steps];
  float t = 0;
  for (int i = 0; i<steps; i++) {
    ar[i] = new PVector(coord.getIntX(cos(freq*t)*exp(-d*t)), coord.getIntY(sin(t)*exp(-d*t)));
    t += range/(steps-1);
  }
  noFill();
  beginShape();
  for (int i = 0; i<steps; i++) {
    curveVertex(ar[i].x, ar[i].y);
  }
  endShape();
}

void mouseReleased() {
}

void drawMenu() {
  noStroke();
  fill(0, 0, 0);
  for (int i = 0; i < 4; i++) {
    rect(width*5/7+height/100, i*height/5+height/100, width*2/7-height/50, height/5-height/100);
  }
  rect(width*5/7+height/100, 4*height/5+height/100, width*2/7-height/50, height/5-height/50);
  String[]  texts = {
    "rainbow curve", "plain curve", "erase", "animation on/off"
  };
  textSize(height/22);
  int bright = (coloured ? 10: 80);
  fill(0, 0, bright);
  text(texts[0], width*6/7, height/10); 
  bright = (coloured ? 80: 10);
  fill(0, 0, bright);
  text(texts[1], width*6/7, height/5+height/10);  
  fill(0, 0, 80);
  for (int i = 2; i < 4; i++) {
    text(texts[i], width*6/7, i*height/5+height/10);
  }
  textSize(height/45);
  text("a = "+ nf(freq, 1, 4), width*6/7, 3*height/5+height/20);
  text("d = "+ nf(d, 1, 4), width*6/7, 4*height/5+height/30);
  if (mouseX > width*5/7 && mouseY < height*4/5) { //hover effect
    int top = (int) Math.floor(mouseY/(height/5));
    fill(0, 0, 50, 50);
    rect(width*5/7+height/100, top*height/5+height/100, width*2/7-height/50, height/5-height/100);
  }
}

class Coord {

  int intWidth, intHeight;
  float dblXmin, dblXmax, dblYmin, dblYmax;

  Coord(int intWidth, int intHeight, float dblXmin, float dblXmax, float dblYmin, float dblYmax) {
    this.intWidth = intWidth;
    this.intHeight = intHeight;
    this.dblXmin = dblXmin;
    this.dblXmax = dblXmax;
    this.dblYmin = dblYmin;
    this.dblYmax = dblYmax;
  }

  float getDblX(int intX) {
    return this.dblXmin+intX*(this.dblXmax-this.dblXmin)/this.intWidth;
  }

  float getDblY(int intY) {
    return this.dblYmax-intY*(this.dblYmax-this.dblYmin)/this.intHeight;
  }

  float getIntX(float dblX) {
    int i = Math.round((dblX-this.dblXmin)*this.intWidth/(this.dblXmax-this.dblXmin));
    if (i<0 || i>=this.intWidth) { 
      return -1;
    } else {
      return i;
    }
  }

  float getIntY(float dblY) {
    int i = Math.round((this.dblYmax-dblY)*this.intHeight/(this.dblYmax-this.dblYmin));
    if (i<0 || i>=this.intHeight) { 
      return -1;
    } else { 
      return i;
    }
  }
}

/************************************************************/
/* Class to handle a horizontal slider                  *****/
/************************************************************/
class Slider {
  float x, y, w, h;
  float min, max;
  float value;
  int dragged = -1;
  float radius;
  
  Slider(float x, float y, float w, float h, float min, float max, float value, float radius) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.min = min;
    this.max = max;
    this.value = value;
    this.radius = radius;
  }
  
  void update() {
    float mx = mouseX;
    float my = mouseY;
    float val = map(value, min, max, x, x+w);
    if (mx<x || my<y || mx>(x+w) || my>(y+h)) {
      dragged = -1;
      return;
    }
    if (mousePressed) {
      if (dragged == -1) {
        if (dist(val, y+h/2-3, mx, my)<=radius) {
          dragged = 1;
        }
      } else if (mx >x && my>y && mx<(x+w) && my<(y+h)) {
          value = map(mx, x, x+w, min, max);
      }
    } 
  }
  
  void redraw() {
    float mx = mouseX;
    float my = mouseY; 
    stroke(100);
    strokeWeight(height/83);
    line(x, y+h/2-3, x+w, y+h/2-3);
    strokeWeight(2);
    fill(240);
    float val = map(value, min, max, x, x+w);
    ellipse(val, y+h/2-3, radius, radius);
    //hover effect
    if (dist(val, y+h/2-3, mx, my)<=radius) {
      fill(100, 100);
      ellipse(val, y+h/2-3, radius, radius);
    }
  }
  
  void release() {
    dragged = -1;
  }
  
  float getValue() {
    return value;
  }
}


