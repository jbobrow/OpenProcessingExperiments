
color backgroundColor = color(204);
color squareColor = color(204,0,0);
color squareColorEmpty = color(51);
color squareColorHighlight = color(204,102,0);

int newEmptyLocation;
int newEmptyX;
int newEmptyY;

int totalMoves;
boolean playing;
boolean gameOver;
 
SquareButton[] squares = new SquareButton[10];
SquareEmpty empty;
 
void setup() {
  size(480,640);
  //size(720,1280);
  background(backgroundColor);
  frameRate(15);
   
  playing = false;
  gameOver = false;
  totalMoves = 0;
 
  newEmptyLocation = 0;
  newEmptyX = 350;
  newEmptyY = 250;
  
  squares[0] = new SquareButton(350,250,0);
  squares[1] = new SquareButton(50,50,1);
  squares[2] = new SquareButton(150,50,2);
  squares[3] = new SquareButton(250,50,3);
  squares[4] = new SquareButton(50,150,4);
  squares[5] = new SquareButton(150,150,5);
  squares[6] = new SquareButton(250,150,6);
  squares[7] = new SquareButton(50,250,7);
  squares[8] = new SquareButton(150,250,8);
  squares[9] = new SquareButton(250,250,9);
  empty = new SquareEmpty(350,250,0);
 
  /* draw the squares on the grid */
  empty.display(squareColorEmpty);
  for(int i=1; i<=9; i++) {
    squares[i].display(squareColor);
  }
   
  /* shuffle to start game */
  shuffleSquares();
  
  fill(0,0,0);
  textAlign(LEFT);
  text("กรุณาเรียงข้อความใหม่ให้ได้ดังนี้", 50, 350);
  text("        R        |      S      |     U      ", 50, 400);
  text("--------------------------------------", 50, 420);
  text("  Rangsit  |  Univer  |  sity  ", 50, 440);
  text("--------------------------------------", 50, 460);
  text("     มหา     | วิทยาลัย |  รังสิต  ", 50, 480);
  text("--------------------------------------", 50, 500);
}
 
void draw() {
  
}
 
/* play random moves game */
void shuffleSquares(){
  int shuffleMoves = 0;
  int oldSelected = 0;
  int selected = 9;
  while(shuffleMoves<=99) {
    if(selected!=oldSelected) {
      playSquare(selected);
      oldSelected = selected;
      shuffleMoves++;
    }
    selected = int(random(8))+1;
  }
  playing=true;
}

void mouseReleased() {
  if(gameOver!=true) {
    for(int i=1; i<=9; i++) {
      if(squares[i].selected()==true) {
        playSquare(i);
        break;
      }
    }
  }
}
 
void playSquare(int selected) {
    switch(squares[selected].location) {
       case 1:
         if(empty.location==2 ||
            empty.location==4) { moveSquare(selected); }
         break;
       case 2:
         if(empty.location==1 ||
            empty.location==3 ||
            empty.location==5) { moveSquare(selected); }
         break;
       case 3:
         if(empty.location==2 ||
            empty.location==6) { moveSquare(selected); }
         break;
       case 4:
         if(empty.location==1 ||
            empty.location==5 ||
            empty.location==7) { moveSquare(selected); }
         break;
       case 5:
         if(empty.location==2 ||
            empty.location==4 ||
            empty.location==6 ||
            empty.location==8) { moveSquare(selected); }
         break;
       case 6:
         if(empty.location==3 ||
            empty.location==5 ||
            empty.location==9) { moveSquare(selected); }
         break;
       case 7:
         if(empty.location==4 ||
            empty.location==8) { moveSquare(selected); }
         break;
       case 8:
         if(empty.location==5 ||
            empty.location==7 ||
            empty.location==9) { moveSquare(selected); }
         break;
       case 9:
         if(empty.location==6 ||
            empty.location==8 ||
            empty.location==0) { moveSquare(selected); }
         break;
       case 0:
         if (empty.location==9) {
            moveSquare(selected);
            checkResult();
        }
        break;
    }
}
 
void moveSquare(int selected) {
         newEmptyLocation = squares[selected].location;
         newEmptyX = squares[selected].x;
         newEmptyY = squares[selected].y;
 
         squares[selected].location = empty.location;
         squares[selected].x = empty.x;
         squares[selected].y = empty.y;
          
         empty.location = newEmptyLocation;
         empty.x = newEmptyX;
         empty.y = newEmptyY;
 
         empty.display(squareColorEmpty);
         squares[selected].display(squareColor);
         if (playing==true) { totalMoves++; }
}
 
void checkResult() {
  gameOver = true;
  int c = 1;
  while (gameOver==true && c<=9) {
    if (squares[c].location!=c) {
      gameOver=false;
    }
    c++;
  }
  if (gameOver==true) {
    empty.display(backgroundColor);
    for(int i=1; i<=9; i++) {
      squares[i].display(squareColorHighlight);
    }
    noStroke();
    fill(0);
    textAlign(LEFT);
    text("ยินดีด้วย คุณชนะ",310,25);
    text("ด้วยการย้าย "+totalMoves+" ครั้ง",310,50);
    text("Press a key:",310,225);
    text("[R] restart",310,250);
    text("[Q] quit",310,275);
  }
}
 
void keyPressed() {
  if (key==ESC) {
    key=0;
  }
  if (key=='q' || key=='Q') {
    exit();
  }
  if (key=='r' || key=='R') {
    setup();
  }
}
 
/* ****************************** classes ****************************** */
 
class Square {
  String number;
  int location;
  int x;
  int y;
  int s;
  color c;
  boolean selected;
   
  boolean selected() {
/* check if the mouse is over the square */
   if (mouseX >= x-(s/2) && mouseX <= x+(s/2) &&
         mouseY >= y-(s/2) && mouseY <= y+(s/2)) {
      return true;
    } else {
      return false;
    }
  }
}
   
class SquareButton extends Square {
 
  SquareButton (int tempX, int tempY, int tempN) {
    x = tempX;
    y = tempY;
    s = 96;
    c = color(192);
    if(tempN == 1){number = "R";}
    else if(tempN == 2){number = "S";}
    else if(tempN == 3){number = "U";}
    else if(tempN == 4){number = "Rangsit";}
    else if(tempN == 5){number = "Univer";}
    else if(tempN == 6){number = "sity";}
    else if(tempN == 7){number = "มหา";}
    else if(tempN == 8){number = "วิทยาลัย";}
    else if(tempN == 9){number = "รังสิต";}
    //number = tempN;
    location = tempN;
  }
   
  void display(int squareColor) {
    int margin = 49;
    rectMode(CENTER);
    noStroke();
    fill(squareColor);
    rect(x,y,s,s);
    
    noStroke();
    fill(255);
    textAlign(CENTER);
    text(number,x,y+18);
  }
}
 
class SquareEmpty extends Square {
 
  SquareEmpty(int tempX, int tempY, int tempN) {
    x = tempX;
    y = tempY;
    s = 96;
    c = color(42);
    if(tempN == 1){number = "R";}
    else if(tempN == 2){number = "S";}
    else if(tempN == 3){number = "U";}
    else if(tempN == 4){number = "Rangsit";}
    else if(tempN == 5){number = "Univer";}
    else if(tempN == 6){number = "sity";}
    else if(tempN == 7){number = "มหา";}
    else if(tempN == 8){number = "วิทยาลัย";}
    else if(tempN == 9){number = "รังสิต";}
    //number = tempN;
    location = 0;
  }
  void display(int squareColor) {
    /* draw the empty square */
    rectMode(CENTER);
    noStroke();
    fill(squareColor);
    rect(x,y,s,s);
  }
}


