
//================================= global vars

PFont f;

int _num = 1;    
Circle[] pArr = new Circle[_num];

//================================= init

void setup() {
  size(800, 600);
  smooth(); 
  frameRate(240);
  f = createFont ("Verdana Bold", 16, true);
  background(50);
  for (int i=0;i<_num;i++) {
    pArr[i] = new Circle(i);
    pArr[i].init(width/2, height/2);
  }
}

void clearBackground() {
  fill(50,60);
  noStroke();
  rect(0,0,width,height);
  noFill();
}

//================================= frame loop

void draw() {
  
  textFont (f, 32);
  fill (0);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (0);
  text ("created usin Processing and Processing.js", 20, 20);
  textFont (f, 16);
  fill (0);
  text ("sketch based on original code created by zenbullets.com found at abandonedart.org", 20, 40);
  
  for (int i=0;i<_num;i++) {
    pArr[i].update();
  }
}



//================================= interaction

void mousePressed() { 
  background(50);
  for (int i=0;i<_num;i++) {
    pArr[i].init(mouseX, mouseY);
  }
}


//================================= objects


class Circle {
  int id;
  float angnoise, radiusnoise;
  float widnoise, heinoise;
  float angle = 0;
  float radius = 100;
  float centreX = width/2;
  float centreY = height/2;
  float strokeCol = 254;
  float g, b;
  float lastX = 9999;
  float lastY, lastAng;
  float lastOuterX, lastOuterY;
  
  Circle (int num) {
    id = num;
  }
  
  void init(float ex, float why) {
    centreX = ex;
    centreY = why;
  
    noiseSeed(int(random(1000)));
    angnoise = random(10);
    lastX = 9999;
    strokeCol = random(25) + 0.5;
    g = random(100); 
    b = random(100);
    angle = 0;
  }
  
  void update() {
    float radnoise;
    if (angle > 180) {
      radnoise = (angle+1)/360 * strokeCol;
    } else {
      radnoise = ((360-angle)+1)/360 * strokeCol;
    }
    radius = (noise(radnoise) * (width/1.5));
    
    angle += (noise(radnoise) * 1.5);
    if (angle > 360) { 
      angle -= 360;
      strokeCol++; 
      clearBackground();
    } else if (angle < 0) { 
      angle += 360; 
      strokeCol++; 
      clearBackground();
    }
    
    float wid = (noise(radnoise) * 150) - 75;
    float rad = radians(angle + 90);
    float x1 = centreX + (radius * cos(rad));
    float y1 = centreY + (radius * sin(rad));
    
    float outerRadius = radius + wid;
    float outerX = centreX + (outerRadius * cos(rad));
    float outerY = centreY + (outerRadius * sin(rad));
    
    
    
    if (strokeCol > 10) {
       init(centreX, centreY); 
       if (random(2) > 1) {
         b += 40;
         if (b > 250) { b = 0; }
       } else {
         g += 40;
         if (g > 250) { g = 0; }
       }
    }
    
    if (lastX < 9999) {
      strokeWeight(0.7);
      stroke(strokeCol * 40, g, b, 250);
      line(x1, y1, lastX, lastY);
      strokeWeight(0.5);
      stroke(strokeCol * 40, g, b, 150);
      line(centreX, centreY, outerX, outerY);
    }
    
    lastX = x1;
    lastY = y1;
    lastOuterX = outerX;
    lastOuterY = outerY;
  }
  
}


