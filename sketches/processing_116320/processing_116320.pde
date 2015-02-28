
int[] pile = {11,7,6};
int[] pileX = {20, 120, 220};
int[] pileY = {120, 20, 120};
int[] buttonX = {95, 145, 195};
int[] buttonY = {85, 135, 85};
int[] first = {0, 0, 1};
int[] second = {1, 2, 2};
int active = -1;

void setup(){
  size(300,200);
  textSize(18);
}


void draw(){
  background(255);
  for (int i=0; i<3; i++) {
    if (i == active) {
      fill(255,192,192);
    } else {
      fill(192);
    }
    ellipse(pileX[i]+30, pileY[i]+20, 60, 40);
    if (pile[i] > 0) {
      String s = "" + pile[i];
      float sw = textWidth(s);
      fill(0);
      text(s, pileX[i]+30-sw/2, pileY[i]+28);
    }
    fill(0,0,255);
    rect(buttonX[i], buttonY[i], 10, 10);
  }
}

void keyPressed(){
  if (active >= 0) {
  
    if (key == 32) {
      pile[active] = 0;
    } else {
      int digit = key - 48;
      if ((digit >= 0) && (digit <= 9)){
        pile[active] = 10 * (pile[active] % 100) + digit;
      }
    }
  }
}

void mousePressed(){
  int mx = mouseX;
  int my = mouseY;
  active = -1;
  for (int i=0; i<3; i++){
    int dx = abs(mx - 30 - pileX[i]);
    int dy = abs(my - 20 - pileY[i]);
    if ((dx <= 30) && (dy <= 20)) {
      active = i;
      break;
    }
  }
  if (active == -1) {
    for (int i=0; i<3; i++) {
      int dx = abs(mx - 5 - buttonX[i]);
      int dy = abs(my - 5 - buttonY[i]);
      if ((dx <= 5) && (dy <= 5)) {
        int s = pile[first[i]] + pile[second[i]];
        if (s > 0) {
          pile[first[i]] = 2*pile[first[i]] % s;
          pile[second[i]] = 2*pile[second[i]] % s;
          if (pile[second[i]] == 0) {
            pile[first[i]] = s;
          }
        }
      }
    }
  } 
}
