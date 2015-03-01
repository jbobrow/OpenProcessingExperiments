
EachBox [] eachbox;
boolean crossTurn, aiTurn, mouseReleased, tied;
int howmany, time, finalTime, boxSize, fps = 10;
float c;

void setup() {
  size(700, 700);
  background(150, 225, 220);
  boxSize = round(min(width, height)/4);
  crossTurn = true;
  aiTurn = false;
  tied = false;
  howmany = 0;
  c = 0;
  strokeWeight(3);
  tied = false;
  eachbox = new EachBox[9];
  for (int i = 0; i < 9; i ++) eachbox[i] = new EachBox(i);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textAtTop();
  
  fps = 10;
  frameRate(fps);
}

void draw() {
  finalTime = (int)frameRate;
  howmany = 0;
  for (int i = 0; i < 9; i ++) {
    if (GIO()) eachbox[i].drawBoard();
    if (!GIO()) eachbox[i].drawEachBox(crossTurn);
    eachbox[i].active();
    if (eachbox[i].crossed || eachbox[i].circled) howmany++;
  }
  switchTurns();
  checkIfGameOver();
  if (!GIO()) {
    if (aiTurn && howmany == 1) aiFirstMove();
    else if (aiTurn) aiMoves();
  }
  checkHowMany();
  checkFrameRate();
}

void checkFrameRate() {
  noStroke();
  rectCreator(color(150, 225, 220), 100, 50, 80, 30);
  stroke(0);
  textCreator(15, color(0), "Lag: " + round(100-100*(frameRate)/fps) + " %", 100, 50);
}

void mousePressed() {
  mouseReleased = true;
}

void mouseReleased() {
  mouseReleased = false;
}

void textAtTop() {
  textCreator(40, color(0), "Tic-Tac-Toe", width/2, 40);
  textCreator(20, color(255, 0, 0), "Impossible Difficulty", width/2, 75);
  textCreator(25, color(0), "By Tanay Singhal", width/2, 100);
}

void textCreator(int ts, color c, String s, float x, float y) {
  textSize(ts);
  fill(c);
  text(s, x, y);
}

void rectCreator(color c, float x, float y, float w, float h) {
  fill(c);
  rect(x, y, w, h);
}

void moveTo(int a) {
  eachbox[a].circled = true; //TAG
  aiTurn = false;
}

void startCorner() {
  int r = round(random(3));
  int a = 0;
  if (r == 0) a = 0;
  else if (r == 1) a = 2;
  else if (r == 2) a = 6;
  else if (r == 3) a = 8;
  eachbox[a].circled = true;
  aiTurn = false;
}

void aiFirstMove() {
  if (bfwcro(4)) startCorner();
  else moveTo(4);
}

void aiMoves() {
  //ATTACK MOVES
  if (ccirclep(1, 2, 0)) moveTo(0);
  else if (ccirclep(0, 2, 1)) moveTo(1);
  else if (ccirclep(0, 1, 2)) moveTo(2);
  else if (ccirclep(4, 5, 3)) moveTo(3);
  else if (ccirclep(3, 5, 4)) moveTo(4);
  else if (ccirclep(3, 4, 5)) moveTo(5);
  else if (ccirclep(7, 8, 6)) moveTo(6);
  else if (ccirclep(6, 8, 7)) moveTo(7);
  else if (ccirclep(6, 7, 8)) moveTo(8);
  //done with hor
  else if (ccirclep(3, 6, 0)) moveTo(0);
  else if (ccirclep(4, 7, 1)) moveTo(1);
  else if (ccirclep(5, 8, 2)) moveTo(2);

  else if (ccirclep(0, 6, 3)) moveTo(3);
  else if (ccirclep(1, 7, 4)) moveTo(4);
  else if (ccirclep(2, 8, 5)) moveTo(5);

  else if (ccirclep(0, 3, 6)) moveTo(6);
  else if (ccirclep(1, 4, 7)) moveTo(7);
  else if (ccirclep(2, 5, 8)) moveTo(8);
  //done with vert
  else if (ccirclep(4, 8, 0)) moveTo(0);
  else if (ccirclep(6, 4, 2)) moveTo(2);
  else if (ccirclep(0, 8, 4)) moveTo(4); //DISASTER
  else if (ccirclep(6, 2, 4)) moveTo(4); //DISASTER
  else if (ccirclep(2, 4, 6)) moveTo(6);
  else if (ccirclep(0, 4, 8)) moveTo(8);

  //SWITCH TO DEFENSE----
  else if (ccrossp(1, 2, 0)) moveTo(0);
  else if (ccrossp(0, 2, 1)) moveTo(1);
  else if (ccrossp(0, 1, 2)) moveTo(2);
  else if (ccrossp(4, 5, 3)) moveTo(3);
  else if (ccrossp(3, 5, 4)) moveTo(4);
  else if (ccrossp(3, 4, 5)) moveTo(5);
  else if (ccrossp(7, 8, 6)) moveTo(6);
  else if (ccrossp(6, 8, 7)) moveTo(7);
  else if (ccrossp(6, 7, 8)) moveTo(8);
  //done with hor
  else if (ccrossp(3, 6, 0)) moveTo(0);
  else if (ccrossp(4, 7, 1)) moveTo(1);
  else if (ccrossp(5, 8, 2)) moveTo(2);

  else if (ccrossp(0, 6, 3)) moveTo(3);
  else if (ccrossp(1, 7, 4)) moveTo(4);
  else if (ccrossp(2, 8, 5)) moveTo(5);
  else if (ccrossp(0, 3, 6)) moveTo(6);
  else if (ccrossp(1, 4, 7)) moveTo(7);
  else if (ccrossp(2, 5, 8)) moveTo(8);
  //done with vert
  else if (ccrossp(4, 8, 0)) moveTo(0);
  else if (ccrossp(4, 6, 2)) moveTo(2);
  else if (ccrossp(0, 8, 4)) moveTo(4);
  else if (ccrossp(2, 6, 4)) moveTo(4);
  else if (ccrossp(2, 4, 6)) moveTo(6); //REPEAT1
  else if (ccrossp(0, 4, 8)) moveTo(8);

  //check weird positions
  else if (ccrossp(1, 3, 0)) moveTo(0);
  else if (ccrossp(1, 5, 2)) moveTo(2);
  else if (ccrossp(3, 7, 6)) moveTo(6);
  else if (ccrossp(5, 7, 8)) moveTo(8);

  //third set weird positions
  else if (ccrossp(3, 8, 7)) moveTo(7); //3,8--> 7
  else if (ccrossp(5, 6, 7)) moveTo(7);//6,5--> 7
  else if (ccrossp(2, 7, 5)) moveTo(5); //2,7--> 5
  else if (ccrossp(1, 8, 5)) moveTo(5);//1,8--> 5
  else if (ccrossp(0, 7, 3)) moveTo(3); //2,7--> 3
  else if (ccrossp(1, 6, 3)) moveTo(3);//1,8--> 3
  else if (ccrossp(0, 5, 1)) moveTo(1);//0,5-->1
  else if (ccrossp(2, 3, 1)) moveTo(1);//2,3-->1

    //fourth set weird position
  else if (ccrossp(2, 4, 8)) moveTo(8);//0,5-->1
  else if (ccrossp(0, 4, 6)) moveTo(6);//2,3-->1
  else if (ccrossp(4, 8, 2)) moveTo(2);//0,5-->1
  else if (ccrossp(4, 6, 0)) moveTo(0);//2,3-->1
  //random

  //second set weird positions
  else if (bfwcro(2) && bfwcro(6)) randomAction(); //2, 6
  else if (bfwcro(0) && bfwcro(8)) randomAction(); //0, 8
  else while (true) {
    int i = round(random(8));
    if (boxEmpty(i) && i != 1) {
      moveTo(i); 
      break;
    }
  }
}

void randomAction() {
  while (true) {
    int i = round(random(1, 4))*2 - 1;
    if (boxEmpty(i)) {
      println(i);
      moveTo(i); 
      break;
    }
  }
}

void checkHowMany () {
  if (howmany == 9) tied = true;
}

void checkIfGameOver() {
  if (circleWins()) gameOver("YOU LOSE");
  else if (crossWins()) gameOver("YOU WIN");
  else if (tied) gameOver("GAME TIED");
}

boolean cfr;

void gameOver(String message) {
  if (c < 200) c += 120/fps;
  stroke(0, c);
  rectCreator(color(0, c), width/2, height/2 + 50, width-100, 200);
  textCreator(round(95*min(width, height)/800), color(255, c), message, width/2, height/2);
  rect(width/3, height/2 + 100, 100, 50);
  rect(width*2/3, height/2 + 100, 100, 50);

  textCreator(round(25*min(width, height)/800), color(0, c), "Restart", width/3, height/2+100);
  text("Save", width*2/3, height/2 + 100);

  if (overRect(width/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    setup();
  }
  else if (overRect(width*2/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    saveFrame();
  }
  stroke(0);
}

void switchTurns() {
  if (howmany % 2 == 0) {
    crossTurn = true;
    aiTurn = false;
  } 
  else if (howmany % 2 == 1 && !tied) {
    crossTurn = false;
    aiTurnTrue();
  }
}

void aiTurnTrue() {
  if (time < finalTime) time++;
  if (time >= finalTime) {
    aiTurn = true;
    time = 0;
  }
}

boolean overRect(float x, float y, float w, float h) {
  return (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2);
}

boolean boxEmpty(int a) {
  return (!eachbox[a].crossed && !eachbox[a].circled);
}

boolean boxFull(int a) {
  return (eachbox[a].crossed || eachbox[a].circled);
}

boolean bfwcir(int a) { //bfwcir
  return (eachbox[a].circled);
}

boolean bfwcro(int a) { //bfwcro
  return (eachbox[a].crossed);
}

boolean Op(int a, int b, int c) {
  if (bfwcir(a) && bfwcir(b) && bfwcir(c)) {
    drawLines(a, c);
    return true;
  } 
  else return false;
}

boolean Xp(int a, int b, int c) {
  if (bfwcro(a) && bfwcro(b) && bfwcro(c)) {
    drawLines(a, c);
    return true;
  } 
  else return false;
}

boolean GIO() {
  return (circleWins() || crossWins() || howmany == 9);
}

boolean ccirclep(int a, int b, int c) { //check circle position
  return (bfwcir(a) && bfwcir(b) && boxEmpty(c));
}
boolean ccrossp(int a, int b, int c) { //check circle position
  return (bfwcro(a) && bfwcro(b) && boxEmpty(c));
}

void drawLines(int a, int c) {
  line(eachbox[a].x, eachbox[a].y, eachbox[c].x, eachbox[c].y);
}

boolean circleWins() {
  if (Op(0, 1, 2)) return true;
  else if (Op(3, 4, 5)) return true;
  else if (Op(6, 7, 8)) return true;
  else if (Op(0, 3, 6)) return true;
  else if (Op(1, 4, 7)) return true;
  else if (Op(2, 5, 8)) return true;
  else if (Op(0, 4, 8)) return true;
  else if (Op(2, 4, 6)) return true;
  else return false;
}

boolean crossWins() {
  if (Xp(0, 1, 2)) return true;
  else if (Xp(3, 4, 5)) return true;
  else if (Xp(6, 7, 8)) return true;
  else if (Xp(0, 3, 6)) return true;
  else if (Xp(1, 4, 7)) return true;
  else if (Xp(2, 5, 8)) return true;
  else if (Xp(0, 4, 8)) return true;
  else if (Xp(2, 4, 6)) return true;
  else return false;
}



class EachBox {
  int n, r = 1;
  int x, y;
  boolean over, cross = true, crossed, circled;

  EachBox(int num) {
    n = num;
    num ++;
    if (num <= 3) setBoxSize(num, 0, height/2+50-boxSize);
    else if (num <= 6) setBoxSize(num, 3, height/2+50);
    else if (num <= 9) setBoxSize(num, 6, height/2+50+boxSize);
  }

  void setBoxSize(int num, float a, float h) {
    x = round(boxSize * (num-a));
    y = round(h);
  }

  void drawEachBox(boolean cross) {
    cross = crossTurn;
    if (!crossed && !circled && cross && over && mouseReleased) {
      crossed = true;
      mouseReleased = false;
    }
    drawBoard();
    checkIfOver();
  }

  void active() {
    if (crossed) drawCross();
    if (circled) drawCircle();
    overAnimation();
  }

  void overAnimation() {
    if (over && r < 50) r += round(60/fps);
    else if (r > 0) r -= round(60/fps);
  }

  void drawBoard() {
    rectCreator(color(255-r, 255, 220), x, y, boxSize, boxSize);
  }

  void drawCross() {
    line(x-boxSize/2.5, y-boxSize/2.5, x+boxSize/2.5, y+boxSize/2.5);
    line(x-boxSize/2.5, y+boxSize/2.5, x+boxSize/2.5, y-boxSize/2.5);
  }

  void drawCircle() {
    fill(255-r, 255, 220);
    ellipse(x, y, boxSize/1.25, boxSize/1.25);
    circled = true;
  }

  void checkIfOver() {
    if (overRect(x, y, boxSize, boxSize)) over = true;
    else over = false;
  }
}

class EachBox {
  int n, r = 1;
  int x, y;
  boolean over, cross = true, crossed, circled;

  EachBox(int num) {
    n = num;
    num ++;
    if (num <= 3) setBoxSize(num, 0, height/2+50-boxSize);
    else if (num <= 6) setBoxSize(num, 3, height/2+50);
    else if (num <= 9) setBoxSize(num, 6, height/2+50+boxSize);
  }

  void setBoxSize(int num, float a, float h) {
    x = round(boxSize * (num-a));
    y = round(h);
  }

  void drawEachBox(boolean cross) {
    cross = crossTurn;
    if (!crossed && !circled && cross && over && mouseReleased) {
      crossed = true;
      mouseReleased = false;
    }
    drawBoard();
    checkIfOver();
  }

  void active() {
    if (crossed) drawCross();
    if (circled) drawCircle();
    overAnimation();
  }

  void overAnimation() {
    if (over && r < 50) r += round(60/fps);
    else if (r > 0) r -= round(60/fps);
  }

  void drawBoard() {
    rectCreator(color(255-r, 255, 220), x, y, boxSize, boxSize);
  }

  void drawCross() {
    line(x-boxSize/2.5, y-boxSize/2.5, x+boxSize/2.5, y+boxSize/2.5);
    line(x-boxSize/2.5, y+boxSize/2.5, x+boxSize/2.5, y-boxSize/2.5);
  }

  void drawCircle() {
    fill(255-r, 255, 220);
    ellipse(x, y, boxSize/1.25, boxSize/1.25);
    circled = true;
  }

  void checkIfOver() {
    if (overRect(x, y, boxSize, boxSize)) over = true;
    else over = false;
  }
}

