
int[] board = new int[9];
int botMove;
int shape;

boolean over;
boolean playerTurn;
boolean ai;

void setup() {
  size(300, 300);
  background(255);
  for (int i = 0; i<board.length;i++) {
    board[i] = 0;
  }
}

void draw() {
  strokeWeight(2);
  stroke(0);
  line(width/3, 0, width/3, height);
  line(2*width/3, 0, 2*width/3, height);
  line(0, height/3, width, height/3);
  line(0, 2*height/3, width, 2*height/3);

  if (over==false) {
    if (playerTurn) {
      player();
      pCheckGame();
    }
    else {
      bot();
      bCheckGame();
    }
  }
  else {
    delay(700);
    shape = (int) random(2);
    for (int i = 0; i<board.length;i++) {
      board[i] = 0;
    }
    background(255);
    over = false;
  }
  filledTest();
  mousePressed = false;
}
void filledTest() {
  if ( board[0]!=0 && board[1]!=0 && board[2]!=0 &&
    board[3]!=0 && board[4]!=0 && board[5]!=0 &&
    board[6]!=0 && board[7]!=0 && board[8]!=0) {
    delay(1000);
    over = true;
  }
}

void player() {
  if (mousePressed) {
    if (shape == 0) {
      if (0<mouseX && mouseX<width && 0<mouseY && mouseY<height && board[(3*mouseX/width)+3*round(3*mouseY/height)] == 0) {
        board[(3*mouseX/width)+3*round(3*mouseY/height)] = 1;
        line(width/3*round(3*mouseX/width)+10, height/3*round(3*mouseY/height)+10, width/3*round(3*mouseX/width)+90, height/3*round(3*mouseY/height)+90);
        line(width/3*round(3*mouseX/width)+90, height/3*round(3*mouseY/height)+10, width/3*round(3*mouseX/width)+10, height/3*round(3*mouseY/height)+90);
        playerTurn = false;
      }
    }
    if (shape == 1) {
      if (0<mouseX && mouseX<width && 0<mouseY && mouseY<height && board[(3*mouseX/width)+3*round(3*mouseY/height)] == 0) {
        board[(3*mouseX/width)+3*round(3*mouseY/height)] = 1;
        fill(255);
        ellipse((width/3)*(((3*mouseX/width)+3*round(3*mouseY/height))%3)+50, (height/3)*(((3*mouseX/width)+3*round(3*mouseY/height))/3)+50, 80, 80);
        playerTurn = false;
      }
    }
  }
}

void bot() {
  ai = false;
  if (ai == false && playerTurn == false) {
    botMove = (int)random(9);
    if (board[botMove]==0) {
      if (shape == 0) {
        board[botMove] = 2;
        fill(255);
        ellipse((width/3)*((botMove)%3)+50, (height/3)*((botMove)/3)+50, 80, 80);
        delay(700);
        playerTurn = true;
      }
      if (shape == 1) {
        board[botMove] = 2;
        line((width/3)*((botMove)%3)+10, (height/3)*((botMove)/3)+10, (width/3)*((botMove)%3)+90, (height/3)*((botMove)/3)+90);
        line((width/3)*((botMove)%3)+90, (height/3)*((botMove)/3)+10, (width/3)*((botMove)%3)+10, (height/3)*((botMove)/3)+90);
        delay(700);
        playerTurn = true;
      }
    }
    else {
      botMove = (int) random(9);
    }
  }
}


void pCheckGame() {
  if (board[0]==1 && board[1]==1 &&board[2]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, height/6, width, height/6);
    over = true;
  }
  else if (board[3]==1 && board[4]==1 &&board[5]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, height/2, width, height/2);
    over = true;
  }
  else if (board[6]==1 && board[7]==1 &&board[8]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, 5*height/6, width, 5*height/6);
    over = true;
  }
  else if (board[0]==1 && board[3]==1 &&board[6]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(width/6, 0, width/6, height);
    over = true;
  }
  else if (board[1]==1 && board[4]==1 &&board[7]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(width/2, 0, width/2, height);
    over = true;
  }
  else if (board[2]==1 && board[5]==1 &&board[8]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(5*width/6, 0, 5*width/6, height);
    over = true;
  }
  else if (board[2]==1 && board[4]==1 &&board[6]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, height, width, 0);
    over = true;
  }
  else if (board[0]==1 && board[4]==1 &&board[8]==1) {
    stroke(255, 0, 0);
    strokeWeight(5);
    line(0, 0, width, height);
    over = true;
  }
}

void bCheckGame() {
  if (board[0]==2 && board[1]==2 &&board[2]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(0, height/6, width, height/6);
    over = true;
  }
  else if (board[3]==2 && board[4]==2 &&board[5]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(0, height/2, width, height/2);
    over = true;
  }
  else if (board[6]==2 && board[7]==2 &&board[8]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(0, 5*height/6, width, 5*height/6);
    over = true;
  }
  else if (board[0]==2 && board[3]==2 &&board[6]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(width/6, 0, width/6, height);
    over = true;
  }
  else if (board[1]==2 && board[4]==2 &&board[7]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(width/2, 0, width/2, height);
    over = true;
  }
  else if (board[2]==2 && board[5]==2 &&board[8]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(5*width/6, 0, 5*width/6, height);
    over = true;
  }
  else if (board[0]==2 && board[4]==2 &&board[8]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(0, 0, width, height);
    over = true;
  }
  else if (board[2]==2 && board[4]==2 &&board[6]==2) {
    stroke(0, 0, 255);
    strokeWeight(5);
    line(0, height, width, 0);
    over = true;
  }
}


