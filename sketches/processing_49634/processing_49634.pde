

int _num = 150;    
Circle[] pArr = new Circle[_num];

//================================= init

void setup() {
  size(900, 450);
  smooth(); 
  frameRate(60);
  
  background(255);
  float startx = random(width/2) + (width/2);
  float starty = random(height/2) + (height/2);
  
  for (int i=0;i<_num;i++) {
    pArr[i] = new Circle(i);
    pArr[i].init(startx, starty);
  }
}

void clearBackground() {
  //background(255);
  fill(0,25);
  noStroke();
  rect(0,0,width,height);
  noFill();
}

//================================= frame loop

void draw() {
  
  for (int i=0;i<_num;i++) {
    pArr[i].update();
  }
}



//================================= interaction

void mousePressed() { 
  background(255);
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
  float angleincr;
  float lastX = 9999;
  float lastY, lastAng;
  float lastOuterX, lastOuterY;
  
  Circle (int num) {
    id = num;
    // init();
  }
  
  void trace(String str) {
    //println("Particle " + id + ": " + str);
  }
  
  void init(float ex, float why) {
    trace("init");
    centreX = ex;
    centreY = why;
    radiusnoise = random(10);
    lastX = 9999;
    strokeCol = random(255); 
    angle = 0;
    angleincr = random(1) + 1;
  }
  
  void update() {
    radiusnoise += 0.001;
    radius = (noise(radiusnoise) * (width)) - 100;
    
    angle += angleincr;
    if (angle > 360) { 
      angle -= 360;
    } else if (angle < 0) { 
      angle += 360; 
    }
    float rad = radians(angle + 90);
    float x1 = centreX + (radius * cos(rad));
    float y1 = centreY + (radius * sin(rad));
      
    if (lastX != 9999) {
      
      strokeWeight(1);
      stroke(strokeCol, random(20) + 50);
      line(x1, y1, lastX, lastY);
      
      if (random(5) > 4) {
        strokeWeight(1);
        stroke(strokeCol, 3);
        line(x1, y1, random(width), random(height));
      }
      
    }  
    lastX = x1;
    lastY = y1;
  }
  
}
