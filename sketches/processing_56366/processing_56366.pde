
int[] xpos = new int[5];
int[] ypos = new int[5];
color[] colors = new color[5];

void setup() {
  size(400,400);
  
  smooth();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  
  colors[0] = color(255,0,0);
  colors[1] = color(0,255,0);
  colors[2] = color(0,0,255);
  colors[3] = color(255,175,175);
  colors[4] = color(0,0,0);
}

void draw() {
  background(255);
  
  for(int i=0; i<xpos.length; i++) {
    fill(colors[i]);
    ellipse(xpos[i],ypos[i],20,20);
  }
}

void shiftOnClick () {
  int x1 = mouseX;
  int y1 = mouseY;
  int xTemp;
  int yTemp;
  
  for (int i = 0; i < xpos.length; i ++ ) {
    xTemp = xpos[i];
    yTemp = ypos[i];
    xpos[i] = x1;
    ypos[i] = y1;
    x1 = xTemp;
    y1 = yTemp;
  }
}

void mousePressed() {
  shiftOnClick();
}

