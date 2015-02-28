
/**
 Assignment Five-a
 
 A description of the sketch.
 
 Alexandre Seite
 01/13/2014
 **/

int x;
int y;
int lastX;
int lastY;
int travel;
int hue;

void setup() {
  size(800, 800);
  noLoop();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  x=width/2;
  y=height/2;
  hue=0;
  background(0);
  for (int i=0;i<25000;i++) {
    travel=8+(int)random(-4, 5);
    lastX=x;
    lastY=y;
    int direction=(int)random(0, 8);
    if (direction==0) {
      y-=travel;
    }
    else if (direction==1) {
      x+=travel;
      y-=travel;
    }
    else if (direction==2) {
      x+=travel;
    }
    else if (direction==3) {
      x+=travel;
      y+=travel;
    }
    else if (direction==4) {
      y+=travel;
    }
    else if (direction==5) {
      x-=travel;
      y+=travel;
    }
    else if (direction==6) {
      x-=travel;
    }
    else {
      x-=travel;
      y-=travel;
    }
    if (x>=0 && x<=width && y>=0 && y<=height) {
      stroke(hue, 100, 100, 35);
      line(lastX, lastY, x, y);
      hue++;
    } 
    else {
      x=lastX;
      y=lastY;
    }
    if (hue>360) {
      hue=0;
    }
  }
}

void keyReleased() {

  switch(key) {
  case 'r':
    redraw();
    break;

  case 's':
    saveFrame("aseite_hw5a_####.png");
    break;
  }
}



