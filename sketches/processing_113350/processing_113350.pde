
PImage img;
int N = 3;
int[] tileX = new int[15];
int[] tileY = new int[15];
int[] board = new int[15];
int[] boardX = {220, 175, 265, 130, 220, 310, 85, 175, 265, 355, 40, 130, 220, 310, 400};
int[] boardY = {50, 150, 150, 250, 250, 250, 350, 350, 350, 350, 450, 450, 450, 450, 450};

int[] child = {1,3,4,6,7,8,10,11,12,13,15,16,17,18,19};
int[] label = new int[15];
int[] ht = new int[15];

int active = -1;
int xOffset;
int yOffset;
boolean win;
boolean newgame = true;

void setup() {
  size(800, 600);
  img = loadImage("woodtile.jpg");
  textSize(48);
}

void draw() {
  
  if (newgame) {
    textSize(48);
    for (int i = 0; i < N; i++) {
      tileX[i] = 530 + 90 * (int) (i/5);
      tileY[i] = 50 + 100 * (int) (i % 5);
      label[i] = i+1;
      ht[i] = i;
      board[i] = -1;
    }
    newgame = false;
    win = false;
  }
    
  background(255);
  String lbl;
  if (win) {
    fill(204, 0, 0);
    text("Success!", 450, 100);
    if (N == 15) {
      text("YOU WIN!", 450, 200);
    } else {
      text("Next level?", 450, 200);
    }
  } 
  fill(192);
  for (int i = 0; i < N; i++){
    rect(boardX[i], boardY[i], 74, 83);
  }
  for (int i = 0; i < N; i++){
    int j = ht[i];
    image(img, tileX[j], tileY[j]);
    lbl = "" + label[j];
    if (active == j){
      fill(204,0,0);
    } else {
      fill(0);
    }
    text(lbl, tileX[j]+33-12*lbl.length(), tileY[j]+64);
    fill(192);

  }
}

void mousePressed(){
  if (win && mouseX >= 450 && mouseX <= 700 && mouseY >= 160 && mouseY <= 200){
    newgame = true;
    if (N == 3) {
      N = 6;
    } else if (N == 6) {
      N = 10;
    } else if (N == 10) {
      N = 15;
    }
    return;
  }
  active = -1;
  for (int i = N-1; i >= 0; i--) {
    int j = ht[i];
    if (mouseX >= tileX[j] && mouseX <= tileX[j]+80 && mouseY >= tileY[j] && mouseY <= tileY[j]+90){
      active = j;
      xOffset = mouseX - tileX[active];
      yOffset = mouseY - tileY[active];
      for (int k = i; k < N-1; k++) {
        ht[k] = ht[k+1];
      }
      ht[N-1] = active;
      for (int k = 0; k < N; k++) {
        if (boardX[k] == tileX[active] && boardY[k] == tileY[active]) {
          board[k] = -1;
          break;
        }
      }
      break;
    }
  }
}

void mouseReleased(){
  if (active > -1){
    tileX[active] = max(0, min(width-80, tileX[active]));
    tileY[active] = max(0, min(height-90, tileY[active]));
    
    for (int i = 0; i < N; i++) {
      if (max(abs(tileX[active] - boardX[i]), abs(tileY[active] - boardY[i])) < 20) {
        board[i] = active;
        tileX[active] = boardX[i];
        tileY[active] = boardY[i];
        break;
      }
    }
  
    active = -1;
    win = true;
    for (int i = 0; i < N; i++) {
      if (child[i] >= N) {
        break;
      }
      if (board[i] == -1 || board[child[i]] == -1 || board[child[i]+1] == -1 ||
          abs(label[board[child[i]]] - label[board[child[i]+1]]) != label[board[i]]) {
        win = false;
        break;
      }
    }
  }
}

void mouseDragged(){
  if (active > -1) {
    tileX[active] = mouseX - xOffset;
    tileY[active] = mouseY - yOffset;
  }
}
