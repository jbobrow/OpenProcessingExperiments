
//================================= global vars

PFont f;

int _num = 50;    
Circle[] pArr = new Circle[_num];

//================================= init

void setup() {
  size(800, 600);
  smooth(); 
  f = createFont ("Verdana Bold", 16, true);
  
  clearBackground();
  
  for (int i=0;i<_num;i++) {
    pArr[i] = new Circle(i);
    pArr[i].init(width/2, height/2, random(height/2));
  }
}

void clearBackground() {
  background(255, 245, 215);
}

//================================= frame loop

void draw() {
  textFont (f, 32);
  fill (0);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (0);
  text ("created with Processing and Processing.js", 20, 20);
    textFont (f, 16);
  fill (0);
  text ("sketch based on original code created by zenbullets.com found at abandonedart.org", 20, 40);
  
  for (int i=0;i<_num;i++) {
    pArr[i].update();
  }
}



//================================= interaction

void mousePressed() { 
  clearBackground();
  for (int i=0;i<_num;i++) {
    pArr[i].init(mouseX, mouseY, random(height/2));
  }
}


//================================= objects


class Circle {
  int id;
  float angnoise, radiusnoise;
  float widnoise, heinoise;
  float angle = 180;
  float radius = 250;
  float centreX = width/2;
  float centreY = height/2;
  float strokeCol = 254;
  float lastX = 9999;
  float lastY;
  
  Circle (int num) {
    id = num;
  }
  
  void init(float ex, float why, float r) {
    centreX = ex;
    centreY = why;
    radius = r;
  
    angnoise = random(10);
    radiusnoise = random(10);
    widnoise = random(10);
    heinoise = random(10);
    strokeCol = 254;
  }
  
  void update() {
    radiusnoise += 0.005;
    radius = (noise(radiusnoise) * 250) + 1;
  
    angnoise += 0.005;
    float change = (noise(angnoise) * 6) - 3;
    angle += change;
    if (angle > 360) { angle -= 360; }
    if (angle < 0) { angle += 360; }
    
    widnoise += 0.07;
    heinoise += 0.07;
    float wid = (noise(widnoise) * 10) +5;
    float hei = (noise(heinoise) * 10) +5;
  
    float rad = radians(angle);
    
    float x1 = centreX + (radius * cos(rad));
    float y1 = centreY + (radius * sin(rad));
    
    if (strokeCol > 0) { strokeCol -=2; } // fade in
    
    float alph = 0;
    if (lastX != 9999) {
      float distChange = dist(x1, y1, lastX, lastY);
      alph = 60 - (20 * distChange);
      println(distChange);
      if (alph < 0) { alph = 0; }
    }
    stroke(strokeCol, alph);
    fill(255,alph);
    ellipse(x1, y1, wid, hei);
    
    lastX = x1;
    lastY = y1;
  }
  
}


