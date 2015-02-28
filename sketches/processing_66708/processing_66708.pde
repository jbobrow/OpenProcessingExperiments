
int[][] xy;
int[] mySize = {
  50, 50, 50, 50, 50
};

void setup() {
  size(500, 500);
  xy = new int[5][4];
  xy[0][0] = 75;
  xy[0][1] = 125;
  xy[0][2] = 225;
  xy[0][3] = 275;
  xy[1][0] = 150;
  xy[1][1] = 200;
  xy[1][2] = 225;
  xy[1][3] = 275;
  xy[2][0] = 225;
  xy[2][1] = 275;
  xy[2][2] = 225;
  xy[2][3] = 275;
  xy[3][0] = 300;
  xy[3][1] = 350;
  xy[3][2] = 225;
  xy[3][3] = 275;
  xy[4][0] = 375;
  xy[4][1] = 400;
  xy[4][2] = 225;
  xy[4][3] = 275;
  
}
void draw() {
  for (int i = 0; i < 5; i++) {
    rect(xy[i][0], xy[i][2], mySize[i], mySize[i]);
  }
}
void mouseClicked() {
  for (int i=0; i<5; i++) {
    if (mouseX >  xy[i][0] && mouseX <  xy[i][1]
      && mouseY >  xy[i][2] && mouseY <  xy[i][3]) {
      xy[i][0] -=25;
      xy[i][1] +=25;
      xy[i][2] -=25;
      xy[i][3] +=25;
      mySize[i] +=50;
      
    }
  }

}


