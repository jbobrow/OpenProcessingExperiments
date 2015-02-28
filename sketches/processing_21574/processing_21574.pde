
int num = 6;

Rect[] myRects = new Rect[num];
color[] myColors = new color[3];

void setup() {

  size(300,300);

  //explicitly add colors to the myColors array
  myColors[0] = color(255,0,0,50);
  myColors[1] = color(0,255,0,50);
  myColors[2] = color(0,0,255,50);

  for(int i=0;i<myRects.length;i++) {
    myRects[i] = new Rect();
  }

  noStroke();
  smooth();
}

void draw() {
  background(255);

  for(int i=0; i < myRects.length; i++) {
    myRects[i].update();
    myRects[i].draw();
  }
}

class Rect {

  float sizeRect = random(100);
  float x = random(20,width-20);
  float y = random(20,height-20);
  color col = myColors[floor(random(0,3))];


  Rect() {
  }

  void update() {
  }


  void draw() {
    fill(col);
    rectMode(CENTER);
    rect(x,y,sizeRect,sizeRect);

    if((sizeRect < height) || (sizeRect < width)) {
      sizeRect++;
    } 
    else {
      sizeRect = 1;
    }
  }
}


