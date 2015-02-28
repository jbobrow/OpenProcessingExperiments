
PFont f;
int[] xpos = new int[2];
int[] ypos = new int[2];

void setup() {
  size(500, 500);
  background(255);
  smooth();
  f = loadFont("ArialMT-32.vlw");

  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw() {
}

void mousePressed() {
  background(255);
  for (int i = 0; i<xpos.length-1;i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  fancyLine();
  centerPoint();
}
void fancyLine() {
  for (int i = 0; i <xpos.length; i++) {
    stroke(0);
    line(xpos[i], ypos[i], xpos[xpos.length-1], ypos[ypos.length-1]);
    fill(255);
    ellipseMode(CENTER);
    ellipse(xpos[i], ypos[i], 10, 10);
    textFont(f, 12);
    fill(0);
    text("("+xpos[i]+","+ypos[i]+")", xpos[i]+10, ypos[i]+10);
  }
}
void centerPoint() {
  for (int i = 0; i <xpos.length; i++) {
    if(i == 0){
    int x = (xpos[i]+xpos[xpos.length-1])/2;
    int y = (ypos[i]+ypos[ypos.length-1])/2;
    float d = distance(xpos[i], ypos[i], xpos[xpos.length-1], ypos[ypos.length-1]);
    ellipseMode(CENTER);
    fill(0);
    ellipse(x, y, 10, 10);
    textFont(f, 12);
    text("center("+x+","+y+"),distance("+d+")", x+10, y+10);
  }
}
}

float distance(int x1, int y1, int x2, int y2) {
  float dx = x1 - x2;
  float dy = y1 - y2;
  float d = sqrt(dx*dx+dy*dy);
  return d;
}



