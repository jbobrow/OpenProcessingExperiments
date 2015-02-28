
// Lights Out with 3 colors!
// Turn all of the lights green.

int N = 6;
int[][] board = new int[N][N];

void setup() {
  size(520, 360);
  textSize(32);  
}

void draw() {
  background(255);
  fill(0, 32, 64);
  text("Reset", 392, 300);
  int i, j;
  fill(255, 0, 0);
  for (i=0; i<N; i++) {
    for (j=0; j<N; j++) {
      if (board[i][j] == 0) {
        fill(255, 84, 104);
      } else if (board[i][j] == 1) {
        fill(250, 190, 77);
      } else {
        fill(77, 250, 144);
      } 
      ellipse(30+60*i, 30+60*j, 50, 50);
    }
  }
}

void mousePressed() {
  int i = (int) (mouseX / 60);
  int j = (int) (mouseY / 60);
  if (i < N && j < N) {
    int dx = 30+60*i - mouseX;
    int dy = 30+60*j - mouseY; 
    if (dx*dx + dy*dy < 625) {
      board[i][j] = (board[i][j]+1) % 3;
      if (i > 0) {
        board[i-1][j] = (board[i-1][j]+1) % 3;
      }
      if (i < N-1) {
        board[i+1][j] = (board[i+1][j]+1) % 3;
      }
      if (j > 0) {
        board[i][j-1] = (board[i][j-1]+1) % 3;
      }
      if (j < N-1) {
        board[i][j+1] = (board[i][j+1]+1) % 3;
      }
    } 
  } else if ((392 <= mouseX) && (mouseX <= 476) && (276 <= mouseY) && (mouseY <= 300)) {
    for (i=0; i<N; i++){
      for (j=0; j<N; j++){
        board[i][j] = 0;
      }
    }
  }
}


