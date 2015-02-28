
void setup() {
  size(400, 500);
  createListPts();
}
boolean isX = true;
int currLetter; // 1 = 'x'   2 = O  0 = empty
void draw() {
  if(isX) println("It's X turn");
  else println("It's O turn");
  println("");
  println("");
  println("");
  println("");
  background(48, 180, 102);
  board();
  //Flips whos turn it is
  if (isX) {
    textSize(75);
    text("X", mouseX, mouseY);
    currLetter = 1;
  }
  else { 
    textSize(75);
    text("O", mouseX, mouseY);
    currLetter =2;
  }

  int nextX =0;
  int nextY =0;
  for (int r=0;r<3;r++) {
    for (int c=0;c<3;c++) {
      if (square[r][c] == 0) {  
        text("", (int)xPts.get(nextY), (int)yPts.get(nextX));
        nextX++;
        nextY++;
      }
      if (square[r][c] == 1) {
        text("X", (int)xPts.get(nextY), (int)yPts.get(nextX));
        nextX++;
        nextY++;
      }
      if ( square[r][c] == 2) {
        text("O", (int)xPts.get(nextY), (int)yPts.get(nextX));
        nextX++;
        nextY++;
      }
    }
  }
  if ( xWon()) {
    background(223,74,208);
    textSize(20);
    text("X Won that game!", 100, 100);
    text("Maybe next time O.....", 110, 150);
    text("X won YAYAYYAYAY!", random(3*width/4), random(3*height/4));
    p1Score++;
  }

  if (oWon()) {
    background(12,225,240);
    textSize(20);
    text("O Won that game!", 100, 100);
    text("Maybe next time X.....", 100, 150);
    text("O won YAYAYYAYAY!", random(3*width/4), random(3*height/4));
    noWinner();
  }
  }

int[][] square = new int[3][3];  

int getRow() {
  if (mouseY <height/3)return 0;
  else if (mouseY >height/3 && mouseY < 2*height/3) return 1;
  else return 2;
}
int getCol() {
  if (mouseX < width/3) return 0;
  else if (mouseX > width/3 && mouseX< 2*width/3) return 1;
  else return 2;
}



void mouseClicked() {
  //println(getRow()+":"+getCol());
  //convert();

  if (square[getRow()][getCol()] == 0) {
    square[getRow()][getCol()] = currLetter;
    //println(currLetter);
    if (isX) {
      isX = false;
    }
    else {
      isX=true;
    }
  }
}

ArrayList<Integer> xPts = new ArrayList<Integer>();
ArrayList<Integer> yPts = new ArrayList<Integer>();
void createListPts() {
  xPts.add(62);
  xPts.add(173);
  xPts.add(290);
  xPts.add(58);
  xPts.add(179);
  xPts.add(286);
  xPts.add(63);
  xPts.add(168);
  xPts.add(294);
  //Y POiNTS BELOW
  yPts.add(142);
  yPts.add(142);
  yPts.add(142);
  yPts.add(280);
  yPts.add(280);
  yPts.add(280);
  yPts.add(410);
  yPts.add(410);
  yPts.add(410);
}

int gap =80;
// prints out the board of the game
void board() {
  textSize(20);
  text("Press R to reset", 20, 30);
  //text("Press D for draw", 200, 30);
  textSize(10);
  text("Welcome To TicTacToe by @ChristopherSeruge", (width/2)-100, 480);
  strokeWeight(15);
  //Vertical Lines  (left then right )
  line(width/3, gap, width/3, height-gap);
  line(2* width/3, gap, 2*width/3, height-gap);
  //Horizontal Lines (Top then bottom)
  line((width/3)-gap, height/3, (2*width/3)+gap, height/3);
  line((width/3)-gap, 2*height/3, (2*width/3)+gap, 2*height/3);
}

int p1Score=0;
int p2Score=0;

boolean oWon() {
  //if(square[0][0]!=0 && square[1][1]!=0 && square[2][2]!=0){
  if (2 ==square[0][0] && 2 == square[0][1]&& 2 == square[0][2]) {
    return true;
  }
  else if (2 == square[1][0] && 2 == square[1][1] && 2== square[1][2]) {
    return true;
  }
  else if (2 == square[2][0] && 2 == square[2][1] && 2== square[2][2]) {
    return true;
  }
  else if (2 ==square[0][0] && 2 == square[1][0] && 2== square[2][0]) {
    return true;
  }
  else if (2 == square[0][1] && 2 == square[1][1] && 2== square[2][1]) {
    return true;
  }
  else if (2 == square[0][2] && 2 == square[1][2] &&  2== square[2][2]) {
    return true;
  }
  else if (2 == square[2][0] && 2 == square[1][1] && 2== square[0][2]) {
    return true;
  }
  else if (2 == square[0][0] && 2 == square[1][1] && 2== square[2][2]) {
    return true;
  }
  return false;
}
boolean xWon() {
  //if(square[0][0]!=0 && square[1][1]!=0 && square[2][2]!=0){
  if (1 ==square[0][0] && 1 == square[0][1]&& 1 == square[0][2]) {
    return true;
  }
  else if (1 == square[1][0] && 1 == square[1][1] && 1== square[1][2]) {
    return true;
  }
  else if (1 == square[2][0] && 1 == square[2][1] && 1== square[2][2]) {
    return true;
  }
  else if (1 ==square[0][0] && 1 == square[1][0] && 1== square[2][0]) {
    return true;
  }
  else if (1 == square[0][1] && 1 == square[1][1] && 1== square[2][1]) {
    return true;
  }
  else if (1 == square[0][2] && 1 == square[1][2] &&  1== square[2][2]) {
    return true;
  }
  else if (1 == square[2][0] && 1 == square[1][1] && 1== square[0][2]) {
    return true;
  }
  else if (1 == square[0][0] && 1 == square[1][1] && 1== square[2][2]) {
    return true;
  }
  return false;
}
int occupied =0;
void noWinner() {  
  for (int a =0; a<square.length; a++) {
    for (int i =0; i<square.length; i++) {
      if ((square[a][i] == 1 || square[a][i] ==2) && !xWon() && !oWon()) {
        background(0);
        textSize(25);
        text("NO WINNER :(", 120, 200);
      }
    }
  }
}

void keyPressed(){
  isX =true;
  if( key == 114){
    background(48, 180, 102);
    board();
  //Flips whos turn it is
  if (isX) {
    textSize(75);
    text("X", mouseX, mouseY);
    currLetter = 1;
  } else { 
    textSize(75);
    text("O", mouseX, mouseY);
    currLetter =2;
  }
  for(int r=0; r<3; r++){
    for(int c=0; c<3;c++){
      square[r][c] =0;
    }
  }
    p1Score=0;p2Score=0;
    draw();
  }
}
  
 


