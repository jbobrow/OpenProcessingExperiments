
// reminder
// SpaceInvader(color col, int type, float tlx, float tly, int szu)

SpaceInvader mySI;
int col_select;
int t_select;
color[] cols = new color[4];

void setup() {
  size(640, 400, P2D);
// drawing a nice gradient for the background
  colorMode(RGB, 255, 255, 255);
  background(0, 0, 0);
  noStroke();
  colorMode(RGB, 640, 400, 255);
  for (int i = 0; i < 640; i++) {
      for (int j = 0; j < 400; j++) {
      stroke(640-i, 400-j, 128, 100);
      point(i, j);
    }
  }

  //background(128, 128, 128);
  colorMode(RGB, 255, 255, 255);
  cols[0] = color (255, 255, 255);
//  cols[4] = color (255, 0, 255);
//  cols[5] = color (255, 255, 0);
//  cols[6] = color (0, 255, 255);
  cols[1] = color (0, 0, 255);
  cols[2] = color (0, 255, 0);
  cols[3] = color (255, 0, 0);
//  cols[7] = color (0, 0, 0);
  col_select = int(random(cols.length));
  t_select = int(random(3));
  mySI = new SpaceInvader(cols[col_select], t_select+1);
}

void draw() {

}

void mousePressed() {
  mySI.SIdisplay();
  col_select = int(random(cols.length));
  t_select = int(random(3));
  mySI.c = cols[col_select];
  mySI.t = t_select+1;
}



