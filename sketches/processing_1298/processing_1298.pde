
int numboxes;
int boxwidth;
int boxheight;
Box[] boxes;

void setup() {
  noStroke();
  size(400,400);
  numboxes = 100;
  boxwidth = 10;
  boxheight = 10;

  boxes = new Box[numboxes];
  for (int i = 0; i < numboxes; i++) {
    boxes[i] = new Box();
  }
}

void draw() {
  fill(255, 100);
  rect(0,0,width,height);
  for (int i = 0; i < numboxes; i++) {
    boxes[i].draw();
  }
}

class Box {
  float x;
  float y;
  float xvel;
  float yvel;
 
  Box() {
    x = (height/2)-boxwidth;
    y = (width/2)-boxheight;
    xvel = random(-5,5);
    yvel = random(-5,5);
  }
  void draw() {
    fill(#929292);
    rect(x,y,boxwidth,boxheight);
    
    if (x >= width-boxwidth) {
      xvel = -abs(xvel);
    }
    if (x <= 0) {
      xvel = abs(xvel);
    }
    if (y >= height-boxheight) {
      yvel = -abs(yvel);
    }
    if (y <= 0) {
      yvel = abs(yvel);
    }
    
    x = x + xvel;
    y = y + yvel;
  }
}

void mouseClicked() {
  boxes = new Box[numboxes];
  for (int i = 0; i < numboxes; i++) {
    boxes[i] = new Box();
  }
}

