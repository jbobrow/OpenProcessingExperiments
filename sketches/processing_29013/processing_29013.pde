
Boolean[][] board;
// true = x, false = o; null = empty;
Integer[] win;
Boolean winner;
Boolean turn;
Boolean gameover = false;
String s;

void setup() {
  background(255);
  size(600, 600);
  smooth();
  strokeWeight(5);
  board = new Boolean[3][3];
  win = new Integer[4];
  winner = null;

  int random =(int)(random(0, 1));
  if (random==0) {
    turn = true;
  }
  else if ( random == 1) {
    turn = false;
  }
}

void draw() {
  if (!gameover) {
    smooth();
    drawGrid();
    drawBoard();
    drawLine();
 
  }
  else if ( gameover) {
  
    if (winner != null) {
     
      if (winner == false) {
        s = "X wins";
      }
      else
        s = "O wins";
    }
    else {
      s = "Stalemate!";
    }

    fill(255, 200);
    rect(0, 0, 599, 599);
 

    text(s);
    background(255);
    gameover = false;
    drawGrid();
    drawBoard();
    drawLine();
  }
}


void mousePressed() {

  int x = mouseX/200;
  int y = mouseY/200;

  if (winner != null || noSpacesLeft()) {
    setup();
    gameover=true;
  }
  else if (board[x][y] == null) {
    if (turn == false) {
      board[x][y] = true;
      turn = true;
    }
    else {
      board[x][y] = false;
      turn = false;
    }
    findwin();
  }
}

void drawBoard() {
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (board[i][j] != null) {
        if (board[i][j] == true)
          drawo(i, j);
        else if (board[i][j] == false)
          drawx(i, j);
      }
    }
  }
}


void drawGrid() {
  smooth();
  line(200, 0, 200, 599);
  line(400, 0, 400, 599);
  line(0, 200, 599, 200);
  line(0, 400, 599, 400);
}

void drawo(int x, int y) {
  smooth();
  fill(0, 0, 0, 0);
  ellipse(100+x*200, 100+y*200, 180, 180);
}

void drawx(int x, int y) {
  smooth();
  line(x*200+20, y*200+20, x*200+180, y*200+180);
  line(x*200+180, y*200+20, x*200+20, y*200+180);
}

void findwin() {
  for (int i=0; i<3; i++) {
    if (board[i][0] != null && board[i][1] != null && board[i][2] != null)
      if (board[i][0] == board[i][1] && board[i][0] == board[i][2])
        setwin(100+200*i, 0, 100+200*i, 599, board[i][0]);

    if (board[0][i] != null && board[1][i] != null && board[2][i] != null)
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i])
        setwin(0, 100+200*i, 599, 100+200*i, board[0][i]);
  }

  if (board[0][0] != null && board[1][1] != null && board[2][2] != null)
    if (board[0][0] == board[1][1] && board[0][0] == board[2][2])
      setwin(0, 0, 599, 599, board[0][0]);

  if (board[0][2] != null && board[1][1] != null && board[2][0] != null)
    if (board[0][2] == board[1][1] && board[0][2] == board[2][0])
      setwin(0, 599, 599, 0, board[1][1]);
}

void setwin(int a, int b, int c, int d, Boolean w) {
  win[0] = a;
  win[1] = b;
  win[2] = c;
  win[3] = d;
  winner = w;
}

void drawLine() {
  if (win[0] != null || noSpacesLeft()) {
    smooth();
    stroke(255);
    if (win[0] !=null) {
      line(win[0], win[1], win[2], win[3]);
    }
    winner();
  }
}

void winner() {
  String s;

  if (winner != null) {
    if (winner == false) {
      s = "X wins";
    }
    else
      s = "O wins";
  }
  else {
    s = "Stalemate!";
  }

  fill(255,50);
  rect(0, 0, 599, 599);
  stroke(0);

  text(s);
}


boolean noSpacesLeft() {
  boolean noSpacesLeft = true;
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] == null)
        noSpacesLeft = false;
  return noSpacesLeft;
}



