
Star star;
ArrayList stars;
Tanzaku tanzaku;

void setup() {
  size(400, 200);
  smooth();
  noStroke();
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);
  tanzaku = new Tanzaku();
  
  stars = new ArrayList();
  for (int i = 0; i < 300; i++) {
    stars.add(new Star(random(width), random(height)));
    Star star = (Star) stars.get(stars.size()-1);
    star.init();
  }
  
}

void draw() {
  background(0);
  
  for (int i = 0; i < 300; i++) {
    Star star = (Star) stars.get(i);
    star.move();
    star.display();
  }
  
  float x = width/2-135;
  float y = height/2-84;
  int colorNum = 0;
  for (int i = 0; i < 4; i++) {
    //draw N
    tanzaku.display(70*i + x, y, 10, 0, colorNum%4);
    tanzaku.display(70*i + x+20, y, 20, 0, (colorNum+1)%4);
    tanzaku.display(70*i + x-17, y+5, 19, 19, (colorNum+2)%4);
    //draw A
    tanzaku.display(70*i + x+35+24, y+3, 16, -15, (colorNum+3)%4);
    tanzaku.display(70*i + x+35-4, y+3, 19, 15, (colorNum+4)%4);
    colorNum++;
  }
}

class Tanzaku {
  float x, y;
  float a, r;
  float w = 8;
  float h = 44;
  float l = 60; //ひもの長さ
  color[] c = {
    color(54, 100, 100), //yellow
    color(192, 100, 77), //blue
    color(6, 100, 100), //red
    //color(324, 80, 58), //purple
    color(0, 0, 255), //white
  };
  
  Tanzaku() {
  }
  
  void init() {
  }
  
  void display(float x, float y, float a, float r, int cNum) {
    pushMatrix();
    translate(x, y);
    rotate((a*sin((frameCount+asin(r/a)*180/PI)*PI/180))*PI/180);
    fill(c[cNum]);
    rect(0, l + h/2, w, h);
    //quad(-w/2, l, w/2, l, w/2, l + h, -w/2, l + h);
    popMatrix();
  }
}

class Star {
  float x, y;
  float x0, y0, c0;
  float speed;
  
  Star(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void init() {
    x0 = x;
    y0 = y;
    c0 = random(360);
    speed = -random(0.05, 0.2);
  }
    
  void move() {
    x += speed;
    if (x < -1) x = width + 1;
  }
  
  void display() {
    fill(c0, random(60, 80), 80, random(80, 100));
    ellipse(x, y, 2, 2);
  }
  
}                                                               
