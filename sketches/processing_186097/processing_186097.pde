
PFont font;
boolean instruct = false;
int instructChangeBuffer = 0;

void setup(){
 size(700,850);
 boardSet();
 font = loadFont("LevenimMT-48.vlw");
}

void draw(){
  background(255);
  fill(100);
  stroke(0);
  strokeWeight(3);
  for(int x = 50; x < 650; x += 50){
    for (int y = 50; y < 650; y += 50){
      rect (x, y, 50,50);
    }
  }
  rect(50, 700, 600, 100);
  fill(0, 255, 255, 50);
  rect(325, 325, 50, 50);
  textFont(font, 48);
  fill(125);
  text("CAPTURED", 225, 760);
  boardMake();
  boardMove();
  fill(0);
  textFont(font, 24);
  text("Change Layout", 50, 835);
  text("Reset", 315, 835);
  text("How To Play", 500, 835);
  if (instruct == true){
    fill(240, 225);
    rect(100, 100, 500, 650);
    fill(0);
    textFont(font, 48);
    text("Hnefatafl", 150, 150);
    textFont(font, 16);
    text("1. Black team attacks, White team defends, The King is Red", 125, 200);
    text("2. Take turns moving one piece any amount of spaces either", 125, 225);
    text("horizontally or vertically (think Rook in chess)", 125, 240);
    text("3. Capture pieces by surrounding them on two opposite,", 125, 265);
    text("ajoining squares (Called custodial capture)", 125, 280);
    text("4. No piece except for the king may occupy the Konakis", 125, 305);
    text("(the center square)", 125, 320);
    text("5. The King may not reoccupy the Konakis after leaving it", 125, 355);
    text("6. The King may only be captured when surrounded on", 125, 380);
    text("all four sides, or three sides and the Konakis", 125, 395);
    text("7. If the King is captured successfully, Black wins", 125, 420);
    text("8. If the King has a clear path through to the", 125, 445);
    text("edge of the board that cannot be blocked by a Black", 125, 460);
    text("piece, or otherwise two clear paths to the edge", 125, 475);
    text("(as it is impossible for Black to move twice in", 125, 490);
    text("a single turn) that also does not go through the", 125, 505);
    text("initial starting area of the black pieces (i.e.", 125, 520);
    text("their territory), White Wins", 125, 535);
    instructChangeBuffer ++;
  }
}

void mouseReleased(){
  boardSnap();
}
void mousePressed(){
  if(mouseY <= 800){
    boardSelect();
  }
  else if (mouseY > 800 && mouseY <= 850){
    if(mouseX >= 50 && mouseX < 250){
      altLayout = !altLayout;
      boardSet();
    }
    else if(mouseX >=315 && mouseX < 415){
      boardSet();
    }
    else if (mouseX >= 500 && mouseX < 650){
      instruct = true;
    }
  }
  if (instruct == true && instructChangeBuffer > 30){
    instruct = false;
    instructChangeBuffer = 0;
  }
}
color w = color (255);
color b = color(0);
color king = color(255, 0, 0);
boolean altLayout = false;

piece w1;
piece w2;
piece w3;
piece w4;
piece w5;
piece w6;
piece w7;
piece w8;
piece w9;
piece w10;
piece w11;
piece w12;
piece wKing;

piece b1;
piece b2;
piece b3;
piece b4;
piece b5;
piece b6;
piece b7;
piece b8;
piece b9;
piece b10;
piece b11;
piece b12;
piece b13;
piece b14;
piece b15;
piece b16;
piece b17;
piece b18;
piece b19;
piece b20;
piece b21;
piece b22;
piece b23;
piece b24;

void boardSet(){
  w1 = new piece(250, 350, w);
  w2 = new piece(300, 350, w);
  w3 = new piece(400, 350, w);
  w4 = new piece(450, 350, w);
  w5 = new piece(350, 250, w);
  w6 = new piece(350, 300, w);
  w7 = new piece(350, 400, w);
  w8 = new piece(350, 450, w);
  w9 = new piece(300, 300, w);
  w10 = new piece(400, 400, w);
  w11 = new piece(300, 400, w);
  w12 = new piece(400, 300, w);
  wKing = new piece(350, 350, king);
  
  if(altLayout == true){
      w9 = new piece(200, 350, w);
      w10 = new piece(500, 350, w);
      w11 = new piece(350, 200, w);
      w12 = new piece(350, 500, w);
  }
  
  b1 = new piece(50, 250, b);
  b2 = new piece(50, 300, b);
  b3 = new piece(50, 350, b);
  b4 = new piece(50, 400, b);
  b5 = new piece(50, 450, b);
  b6 = new piece(100, 350, b);
  
  b7 = new piece(250, 50, b);
  b8 = new piece(300, 50, b);
  b9 = new piece(350, 50, b);
  b10 = new piece(400, 50, b);
  b11 = new piece(450, 50, b);
  b12 = new piece(350, 100, b);
  
  b13 = new piece(650, 250, b);
  b14 = new piece(650, 300, b);
  b15 = new piece(650, 350, b);
  b16 = new piece(650, 400, b);
  b17 = new piece(650, 450, b);
  b18 = new piece(600, 350, b);
  
  b19 = new piece(250, 650, b);
  b20 = new piece(300, 650, b);
  b21 = new piece(350, 650, b);
  b22 = new piece(400, 650, b);
  b23 = new piece(450, 650, b);
  b24 = new piece(350, 600, b);
}

void boardMake(){
  w1.makePiece();
  w2.makePiece();
  w3.makePiece();
  w4.makePiece();
  w5.makePiece();
  w6.makePiece();
  w7.makePiece();
  w8.makePiece();
  w9.makePiece();
  w10.makePiece();
  w11.makePiece();
  w12.makePiece();
  wKing.makePiece();
  
  b1.makePiece();
  b2.makePiece();
  b3.makePiece();
  b4.makePiece();
  b5.makePiece();
  b6.makePiece();
  b7.makePiece();
  b8.makePiece();
  b9.makePiece();
  b10.makePiece();
  b11.makePiece();
  b12.makePiece();
  b13.makePiece();
  b14.makePiece();
  b15.makePiece();
  b16.makePiece();
  b17.makePiece();
  b18.makePiece();
  b19.makePiece();
  b20.makePiece();
  b21.makePiece();
  b22.makePiece();
  b23.makePiece();
  b24.makePiece();
}

void boardMove(){
  w1.movePiece();
  w2.movePiece();
  w3.movePiece();
  w4.movePiece();
  w5.movePiece();
  w6.movePiece();
  w7.movePiece();
  w8.movePiece();
  w9.movePiece();
  w10.movePiece();
  w11.movePiece();
  w12.movePiece();
  wKing.movePiece();
  
  b1.movePiece();
  b2.movePiece();
  b3.movePiece();
  b4.movePiece();
  b5.movePiece();
  b6.movePiece();
  b7.movePiece();
  b8.movePiece();
  b9.movePiece();
  b10.movePiece();
  b11.movePiece();
  b12.movePiece();
  b13.movePiece();
  b14.movePiece();
  b15.movePiece();
  b16.movePiece();
  b17.movePiece();
  b18.movePiece();
  b19.movePiece();
  b20.movePiece();
  b21.movePiece();
  b22.movePiece();
  b23.movePiece();
  b24.movePiece();
}

void boardSnap(){
  w1.snapTo();
  w2.snapTo();
  w3.snapTo();
  w4.snapTo();
  w5.snapTo();
  w6.snapTo();
  w7.snapTo();
  w8.snapTo();
  w9.snapTo();
  w10.snapTo();
  w11.snapTo();
  w12.snapTo();
  wKing.snapTo();
  
  b1.snapTo();
  b2.snapTo();
  b3.snapTo();
  b4.snapTo();
  b5.snapTo();
  b6.snapTo();
  b7.snapTo();
  b8.snapTo();
  b9.snapTo();
  b10.snapTo();
  b11.snapTo();
  b12.snapTo();
  b13.snapTo();
  b14.snapTo();
  b15.snapTo();
  b16.snapTo();
  b17.snapTo();
  b18.snapTo();
  b19.snapTo();
  b20.snapTo();
  b21.snapTo();
  b22.snapTo();
  b23.snapTo();
  b24.snapTo();
}

void boardSelect(){
  w1.selectPiece();
  w2.selectPiece();
  w3.selectPiece();
  w4.selectPiece();
  w5.selectPiece();
  w6.selectPiece();
  w7.selectPiece();
  w8.selectPiece();
  w9.selectPiece();
  w10.selectPiece();
  w11.selectPiece();
  w12.selectPiece();
  wKing.selectPiece();
  
  b1.selectPiece();
  b2.selectPiece();
  b3.selectPiece();
  b4.selectPiece();
  b5.selectPiece();
  b6.selectPiece();
  b7.selectPiece();
  b8.selectPiece();
  b9.selectPiece();
  b10.selectPiece();
  b11.selectPiece();
  b12.selectPiece();
  b13.selectPiece();
  b14.selectPiece();
  b15.selectPiece();
  b16.selectPiece();
  b17.selectPiece();
  b18.selectPiece();
  b19.selectPiece();
  b2.selectPiece();
  b21.selectPiece();
  b22.selectPiece();
  b23.selectPiece();
  b24.selectPiece();
}
class piece{
  int xPos, yPos;
  boolean isCaptured, isSelected;
  color team;
  piece(int locX, int locY, color col){
    team = col;
    xPos = locX;
    yPos = locY;
    isCaptured = false;
    isSelected = false;
  }
  void makePiece(){
    fill(team);
    ellipse(xPos, yPos, 30, 30);
    fill(150);
    line(xPos-13, yPos-7, xPos+13, yPos+7);
    ellipse(xPos, yPos, 10, 10);
  }
  void selectPiece(){
    if(mouseX <= xPos+30 && mouseX >= xPos-30 && mouseY <= yPos+30 && mouseY >= yPos-30){
      isSelected = !isSelected;
    }
  }
  void movePiece(){
    if (isSelected == true){
      xPos = mouseX;
      yPos = mouseY;
    }
  }
  void snapTo(){
    if (xPos <25){
      xPos = 0;
    }
    else if (xPos >= 25 && xPos < 75){
      xPos = 50;
    }
    else if (xPos >= 75 && xPos < 125){
      xPos = 100;
    }
    else if (xPos >= 125 && xPos < 175){
      xPos = 150;
    }
    else if (xPos >= 175 && xPos < 225){
      xPos = 200;
    }
    else if (xPos >= 225 && xPos < 275){
      xPos = 250;
    }
    else if (xPos >= 275 && xPos < 325){
      xPos = 300;
    }
    else if (xPos >= 325 && xPos < 375){
      xPos = 350;
    }
    else if (xPos >= 375 && xPos < 425){
      xPos = 400;
    }
    else if (xPos >= 425 && xPos < 475){
      xPos = 450;
    }
    else if (xPos >= 475 && xPos < 525){
      xPos = 500;
    }
    else if (xPos >= 525 && xPos < 575){
      xPos = 550;
    }
    else if (xPos >= 575 && xPos < 625){
      xPos = 600;
    }
    else if (xPos >= 625 && xPos < 700 && yPos < 675){
    xPos = 650;
    }
    if (yPos <25){
      yPos = 0;
    }
    else if (yPos >= 25 && yPos < 75){
      yPos = 50;
    }
    else if (yPos >= 75 && yPos < 125){
      yPos = 100;
    }
    else if (yPos >= 125 && yPos < 175){
      yPos = 150;
    }
    else if (yPos >= 175 && yPos < 225){
      yPos = 200;
    }
    else if (yPos >= 225 && yPos < 275){
      yPos = 250;
    }
    else if (yPos >= 275 && yPos < 325){
      yPos = 300;
    }
    else if (yPos >= 325 && yPos < 375){
      yPos = 350;
    }
    else if (yPos >= 375 && yPos < 425){
      yPos = 400;
    }
    else if (yPos >= 425 && yPos < 475){
      yPos = 450;
    }
    else if (yPos >= 475 && yPos < 525){
      yPos = 500;
    }
    else if (yPos >= 525 && yPos < 575){
      yPos = 550;
    }
    else if (yPos >= 575 && yPos < 625){
      yPos = 600;
    }
    else if (yPos >= 625 && yPos < 675 && xPos < 675){
    yPos = 650;
    }
  }
}


