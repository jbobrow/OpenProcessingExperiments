
boolean saveAnim = false;
float frm;
int numElem = 100;
myDot[] myDots = new myDot[numElem];
color bg = #202020;
color[] palette = {
  #F58F12, #0B9EE7, #4EA731, #F4D910, #F334E3
};

void setup() {
  size(500, 500);
  background(bg);
  noStroke();
  float locx, locy, start_sz, r;
  color col;

  for (int i=0; i<numElem; i++) {
    locx = random(width);
    locy = random(height);
    start_sz = random(10, 20);
    col = palette[int(random(5))];  
    r = random(TWO_PI);  
    myDots[i]= new myDot(locx, locy, start_sz, col, r);
  }
}

void draw() {
  fill(bg, 10);
  rect(0, 0, width, height);
  for (int i=0; i<numElem; i++) {
    myDots[i].display();
  }

  if (saveAnim) {
    if (frameCount % 4 == 0 && frameCount < frm+121) saveFrame("image-###.gif");
  }
}

void keyPressed() {
  saveAnim = true;
  frm = frameCount;
}

void mouseClicked() {
  setup();
}

class myDot {
  float locx, locy, start_sz, sz, r, x, y;
  color col;
  int dir=1;

  myDot(float _locx, float _locy, float _start_sz, color _col, float _r) {
    locx = _locx;
    locy = _locy;
    start_sz = _start_sz;
    col = _col;
    r = _r;
    x = random(-20, 20);
    y = random(-20, 20);
    if (random(1)>.5) dir =-1;
  }

  void display() {
    fill(col,200);
    pushMatrix();
    translate(locx, locy);
    rotate(r);
    sz = map(sin(r), -1, 1, 5, start_sz*4);
    rect(x, y, sz, sz, sz/4);
    popMatrix();
    r += 0.0523*dir;
  }
}



