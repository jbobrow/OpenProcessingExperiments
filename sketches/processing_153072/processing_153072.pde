
float posX;
float theta;

int frames = 96;
int boxWid = 10;

int level;
int maxLevel = 10;

void setup() {
  frameRate(24);
  size(600, 300);
  background(255);
  noFill();
  strokeWeight(0.5);
  stroke(192, 128, 128);
}

void draw() {
  fadeToWhite(192);
  theta = map((frameCount-1)%frames, 0, frames, 0, TWO_PI);
  float x = map(sin(theta), -1, 1, 0, 1)*(width-boxWid);

  level = (int)map(x, 0, width, 1, maxLevel-0.01);
  rectDraw1(0, 0, x, height, level);
  rectDraw2(x, 0, width-x, height, maxLevel-level);

  pushStyle();
  fill(255, 128, 128);
  rect(0, 0, boxWid, height);
  rect(width-boxWid, 0, boxWid, height);
  rect(x, 0, boxWid, height);
  popStyle();
  
//  saveFrame("render/render_####.jpg");
  
}

void rectDraw1(float x, float y, float w, float h, int level) {
  while (level>0) {

    strokeWeight(level/2);
    rect(x, y, w, h);
    level--;

    rectDraw1(x, y, w/3*2, h/2, level);
    rectDraw1(x, y+h/2, w/3*2, h/2, level);
  }
}

void rectDraw2(float x, float y, float w, float h, int level) {
  while (level>0) {

    strokeWeight(level/2);
    rect(x, y, w, h);
    level--;

    rectDraw2(x+w/3, y, w/3*2, h/2, level);
    rectDraw2(x+w/3, y+h/2, w/3*2, h/2, level);
  }
}



void fadeToWhite(float alp) {
  pushStyle();
  fill(255, alp);
  rect(-10, -10, width+10, height+10);
  popStyle();
}

