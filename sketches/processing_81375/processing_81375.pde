
/* Maryam Mobini | mma99@sfu.ca | October 2012 
 
 Create a responsive animation using curves that 
 behaves differently when the mouse is dragged at 
 different speeds. Make it so that it begins when 
 the mouse is clicked and ends when any keyboard button is pressed.*/


//global variables

int _num = 150;    
float speed = 2;
myCurve[] pArr = new myCurve[_num];

//initializing

void setup() {
  size(500, 300);
  smooth(); 
  frameRate(60);

  background(255);
  float startx = random(width/2) + (width/2);
  float starty = random(height/2) + (height/2);

  for (int i=0;i<_num;i++) {
    pArr[i] = new myCurve(i);
    pArr[i].init(startx, starty);
  }
}
//refresh background
void clearBackground() {
  //background(255);
  fill(0, 25);
  noStroke();
  rect(0, 0, width, height);
  noFill();
}

// frame loop

void draw() {

  for (int i=0;i<_num;i++) {
    pArr[i].update();
  }
}



//interaction
//redraws the curves
void mousePressed() { 
  background(255);
  for (int i=0;i<_num;i++) {
    pArr[i].init(mouseX, mouseY);
  }
}

//stops the draw function
void keyPressed() {
  noLoop();
}

void mouseDragged() {  //This changes the speed of the arcs are drawn when the mouse is dragged.
  variableSpeed(mouseX, mouseY, pmouseX, pmouseY);
}

// this function calculates the speed of the arcs being dragged by the mouse
void variableSpeed(int x, int y, int px, int py) {
  int s = abs(x-px) + abs(y-py);
  _num = s;
}
//objects


class myCurve {
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

  myCurve (int num) {
    id = num;
    // init();
  }


  void init(float ex, float warum) {

    centreX = ex;
    centreY = warum;
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
    } 
    else if (angle < 0) { 
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



