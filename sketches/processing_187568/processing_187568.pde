
/* Tic Tac Toe Clone by Kika Derbyshire
Starts a replayable TicTacToe program that keeps score */
void setup() {
  size(600,750); //height = width + 150
}

int player1Score = 0;
int player2Score = 0;
boolean gameStart = false;
boolean pauseGame = false;
boolean gameOverDraw = false;
boolean a1Occupied = false;
boolean a2Occupied = false;
boolean a3Occupied = false;
boolean b1Occupied = false;
boolean b2Occupied = false;
boolean b3Occupied = false;
boolean c1Occupied = false;
boolean c2Occupied = false;
boolean c3Occupied = false;
boolean player1 = true;
boolean player1hasa1 = false;
boolean player1hasa2 = false;
boolean player1hasa3 = false;
boolean player1hasb1 = false;
boolean player1hasb2 = false;
boolean player1hasb3 = false;
boolean player1hasc1 = false;
boolean player1hasc2 = false;
boolean player1hasc3 = false;
boolean player2hasa1 = false;
boolean player2hasa2 = false;
boolean player2hasa3 = false;
boolean player2hasb1 = false;
boolean player2hasb2 = false;
boolean player2hasb3 = false;
boolean player2hasc1 = false;
boolean player2hasc2 = false;
boolean player2hasc3 = false;
boolean player1Win = false;
boolean player2Win = false;
int gamesPlayed = 0;
long mssStart = millis();
long frameCountClick = 0;
void draw() {
  fill(0);
  noStroke();
  rectMode(CORNER);
  rect(0,0,2*width,2*height);
  stroke(255);
  strokeWeight(10);
  line(width/3,0,width/3,height-150);
  line(2 * width / 3,0,2 * width / 3, height-150);
  line(0,(height-150)/3,width,(height-150)/3);
  line(0,2*(height-150)/3,width,2*(height-150)/3);
  line(0,height-150,width,height-150);
  line(((width/3)+20),(height-150),(width/3)+20,height);
  line(2*width/3+10,(height-150),2*width/3+10,height);
  fill(255);
  textSize(45);
  textAlign(MODEL);
  text("Turn:",0,height-75);
  textSize(24);
  fill(255,0,0);
  text("Player 1 Score",width/3+30,height-100);
  fill(0,0,255);
  text("Player 2 Score",2*width/3+20,height-100);
  textSize(45);
  text(player2Score,2*width/3+20,height-60);
  fill(255,0,0);
  text(player1Score,width/3+30,height-60);
  if (player1 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line((width/3)-(width/9),width+20,width/3,width+(width/9)+20);
    line((width/3)-(width/9),width+(width/9)+20,width/3,width+20);
  } else {
    strokeWeight(10);
    stroke(0,0,255);
    ellipseMode(CORNER);
    noFill();
    ellipse((width/3)-(width/9),width+20,width/9,width/9);
  }
  if (player1hasa1 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(0,0,width/3,(height-150)/3);
    line(width/3,0,0,(height-150)/3);
  }
  if (player1hasa2 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(0,(height-150)/3,width/3,2*(height-150)/3);
    line(width/3,(height-150)/3,0,2*(height-150)/3);
  }
  if (player1hasa3 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(0,2*(height-150)/3,width/3,(height-150));
    line(width/3,2*(height-150)/3,0,(height-150));
  }
  if (player1hasb1 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(width/3,0,2*width/3,(height-150)/3);
    line(2*width/3,0,width/3,(height-150)/3);
  }
  if (player1hasb2 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(width/3,(height-150)/3,2*width/3,2*(height-150)/3);
    line(2*width/3,(height-150)/3,width/3,2*(height-150)/3);
  }
  if (player1hasb3 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(width/3,2*(height-150)/3,2*width/3,(height-150));
    line(2*width/3,2*(height-150)/3,width/3,(height-150));
  }
  if (player1hasc1 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(2*width/3,0,width,(height-150)/3);
    line(width,0,2*width/3,(height-150)/3);
  }
  if (player1hasc2 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(2*width/3,(height-150)/3,width,2*(height-150)/3);
    line(width,(height-150)/3,2*width/3,2*(height-150)/3);
  }
  if (player1hasc3 == true) {
    strokeWeight(10);
    stroke(220,0,0);
    line(2*width/3,2*(height-150)/3,width,(height-150));
    line(width,2*(height-150)/3,2*width/3,(height-150));
  }
  if (player2hasa1 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(0,0,width/3,(height-150)/3);
  }
  if (player2hasa2 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(0,(height-150)/3,width/3,(height-150)/3);
  }
  if (player2hasa3 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(0,2*(height-150)/3,width/3,(height-150)/3);
  }
  if (player2hasb1 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(width/3,0,width/3,(height-150)/3);
  }
  if (player2hasb2 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(width/3,(height-150)/3,width/3,(height-150)/3);
  }
  if (player2hasb3 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(width/3,2*(height-150)/3,width/3,(height-150)/3);
  }
  if (player2hasc1 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(2*width/3,0,width/3,(height-150)/3);
  }
  if (player2hasc2 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(2*width/3,(height-150)/3,width/3,(height-150)/3);
  }
  if (player2hasc3 == true) {
    ellipseMode(CORNER);
    noFill();
    stroke(0,0,255);
    ellipse(2*width/3,2*(height-150)/3,width/3,(height-150)/3);
  }
  textAlign(CENTER);
  if (((player1hasa1 == true) && (player1hasa2 == true) && (player1hasa3 == true)) || ((player1hasb1 == true) && (player1hasb2 == true) && (player1hasb3 == true)) || ((player1hasc1 == true) && (player1hasc2 == true) && (player1hasc3 == true)) || ((player1hasa1 == true) && (player1hasb1 == true) && (player1hasc1 == true)) || ((player1hasa2 == true) && (player1hasb2 == true) && (player1hasc2 == true)) || ((player1hasa3 == true) && (player1hasb3 == true) && (player1hasc3 == true)) || ((player1hasa1 == true) && (player1hasb2 == true) && (player1hasc3 == true)) || ((player1hasa3 == true) && (player1hasb2 == true) && (player1hasc1 == true)) && (gameOverDraw == false)) {
    textSize(60);
    rectMode(CENTER);
    fill(250,150,0);
    stroke(230,115,0);
    rect(width/2,(height-150)/2,3*width/4,7*(height-150)/8);
    fill(random(255),random(190),random(100));
    text("Player 1 wins.",width/2,(height-150)/2);
    player1Win = true;
    stroke(220,0,0);
    fill(255,0,0);
    rect(width/2,5*(height-150)/6,110,60);
    stroke(0,220,0);
    fill(0,255,0);
    rect(width/2,(height-150)/6,110,60);
    fill(0);
    textSize(18);
    text("Quit?",width/2,5*(height-150)/6);
    text("Play Again?",width/2,(height-150)/6);
  } else if (((player2hasa1 == true) && (player2hasa2 == true) && (player2hasa3 == true)) || ((player2hasb1 == true) && (player2hasb2 == true) && (player2hasb3 == true)) || ((player2hasc1 == true) && (player2hasc2 == true) && (player2hasc3 == true)) || ((player2hasa1 == true) && (player2hasb1 == true) && (player2hasc1 == true)) || ((player2hasa2 == true) && (player2hasb2 == true) && (player2hasc2 == true)) || ((player2hasa3 == true) && (player2hasb3 == true) && (player2hasc3 == true)) || ((player2hasa1 == true) && (player2hasb2 == true) && (player2hasc3 == true)) || ((player2hasa3 == true) && (player2hasb2 == true) && (player2hasc1 == true)) && (gameOverDraw == false)) {
    textSize(60);
    rectMode(CENTER);
    fill(250,150,0);
    stroke(230,115,0);
    rect(width/2,(height-150)/2,3*width/4,7*(height-150)/8);
    fill(random(255),random(190),random(100));
    text("Player 2 wins.",width/2,(height-150)/2);
    player2Win = true;
    stroke(220,0,0);
    fill(255,0,0);
    rect(width/2,5*(height-150)/6,110,60);
    stroke(0,220,0);
    fill(0,255,0);
    rect(width/2,(height-150)/6,110,60);
    fill(0);
    textSize(18);
    text("Quit?",width/2,5*(height-150)/6);
    text("Play Again?",width/2,(height-150)/6);
  } else if ((a1Occupied == true) && (a2Occupied == true) && (a3Occupied == true) && (b1Occupied == true) && (b2Occupied == true) && (b3Occupied == true) && (c1Occupied == true) && (c2Occupied == true) && (c3Occupied == true) && (player1Win == false) && (player2Win == false)) { 
    textSize(60);
    rectMode(CENTER);
    fill(250,150,0);
    stroke(230,115,0);
    rect(width/2,(height-150)/2,3*width/4,7*(height-150)/8);
    fill(0,255,0);
    text("It's a draw.",width/2,(height-150)/2);
    gameOverDraw = true;
    stroke(220,0,0);
    fill(255,0,0);
    rect(width/2,5*(height-150)/6,110,60);
    stroke(0,220,0);
    fill(0,255,0);
    rect(width/2,(height-150)/6,110,60);
    fill(0);
    textSize(18);
    text("Quit?",width/2,5*(height-150)/6);
    text("Play Again?",width/2,(height-150)/6);
  }
  if (gameStart == false) {
    fill(0);
    stroke(0);
    rectMode(CORNER);
    rect(0,0,width,height);
    textSize(60);
    fill(250,150,0);
    textAlign(CENTER);
    text("Tic Tac Toe",width/2,height/4);
    textSize(30);
    text("Cloned By Kika Derbyshire",width/2,5*height/12);
    textSize(18);
    text("Press TAB to pause the game at any time",width/2,(height/2+(height-75))/2);
    rectMode(CENTER);
    stroke(230,115,0);
    rect(width/3,height-75,110,60);
    fill(255,0,0);
    stroke(220,0,0);
    rect(2*width/3,height-75,110,60);
    fill(0);
    text("Play",width/3,height-75);
    text("Quit",2*width/3,height-75);
  }
  if (pauseGame == true) {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,width*2,2*height);
    fill(255,150,0);
    textAlign(CENTER);
    textSize(45);
    text("Game Is Paused",width/2,height/2);
    strokeWeight(10);
    fill(255,0,0);
    stroke(220,0,0);
    rect(width/2,2*height/3,110,60);
    fill(0,255,0);
    stroke(0,220,0);
    rect(width/2,height/3,110,60);
    textSize(18);
    fill(0);
    text("Resume",width/2,height/3);
    text("Quit",width/2,2*height/3);
  }
}
void mouseClicked() {
  if ((gameStart == false) && (mouseX>width/3-55) && (mouseX<width/3+55) && (mouseY > height-105) && (mouseY < height-45)) {
    gameStart = true;
  } else if ((gameStart == false) && (mouseX>2*width/3-55) && (mouseX<2*width/3+55) && (mouseY > height-105) && (mouseY < height-45)) {
    exit();
  }
  if (pauseGame == true) {
    if ((mouseX > (width/2)-55) && (mouseX < (width/2)+55) && (mouseY > (height/3)-55) && (mouseY < (height/3)+55)) {
      pauseGame = false;
    } else if ((mouseX > (width/2)-55) && (mouseX < (width/2)+55) && (mouseY > (2*height/3)-55) && (mouseY < (2*height/3)+55)) {
      exit();
    }
  }
  if ((player1 == true) && (player1Win == false) && (player2Win == false) && (gameOverDraw == false) && (mouseX > 0) && (mouseX < width) && (mouseY < (height-150)) && (mouseY > 0) && (gameStart == true) && (pauseGame == false)) {
    if (mouseX < width/3) {
      if ((mouseY < (height-150)/3) && (a1Occupied == false)) {
        player1 = false;
        a1Occupied = true;
        player1hasa1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3) && (a2Occupied == false)) {
        player1 = false;
        a2Occupied = true;
        player1hasa2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (a3Occupied == false)) {
        player1 = false;
        a3Occupied = true;
        player1hasa3 = true;
      }
    } else if ((mouseX < 2*width/3) && (mouseX > width/3)) {
      if ((mouseY < (height-150)/3) && (b1Occupied == false)) {
        player1 = false;
        b1Occupied = true;
        player1hasb1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3) && (b2Occupied == false)) {
        player1 = false;
        b2Occupied = true;
        player1hasb2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (b3Occupied == false)) {
        player1 = false;
        b3Occupied = true;
        player1hasb3 = true;
      }
    } else if ((mouseX > 2*width/3) && (mouseX < width)) {
      if ((mouseY < (height-150)/3) && (c1Occupied == false)) {
        player1 = false;
        c1Occupied = true;
        player1hasc1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3) && (c2Occupied == false)) {
        player1 = false;
        c2Occupied = true;
        player1hasc2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (c3Occupied == false)) {
        player1 = false;
        c3Occupied = true;
        player1hasc3 = true;
      }
    }
  } else if ((player1 == false) && (player1Win == false) && (player2Win == false) && (gameOverDraw == false) && (mouseX > 0) && (mouseX < width) && (mouseY < (height-150)) && (mouseY > 0) && (gameStart == true) && (pauseGame == false)) {
    if (mouseX < width/3) {
      if ((mouseY < (height-150)/3) && (a1Occupied == false)) {
        player1 = true;
        a1Occupied = true;
        player2hasa1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3) && (a2Occupied == false)) {
        player1 = true;
        a2Occupied = true;
        player2hasa2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (a3Occupied == false)) {
        player1 = true;
        a3Occupied = true;
        player2hasa3 = true;
      }
    } else if ((mouseX < 2*width/3) && (mouseX > width/3)) {
      if ((mouseY < (height-150)/3) && (b1Occupied == false)) {
        player1 = true;
        b1Occupied = true;
        player2hasb1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3)&& (b2Occupied == false)) {
        player1 = true;
        b2Occupied = true;
        player2hasb2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (b3Occupied == false)) {
        player1 = true;
        b3Occupied = true;
        player2hasb3 = true;
      }
    } else if ((mouseX < width) && (mouseX > 2*width/3)) {
      if ((mouseY < height/3) && (c1Occupied == false)) {
        player1 = true;
        c1Occupied = true;
        player2hasc1 = true;
      } else if ((mouseY < 2*(height-150)/3) && (mouseY > (height-150)/3) && (c2Occupied == false)) {
        player1 = true;
        c2Occupied = true;
        player2hasc2 = true;
      } else if ((mouseY < (height-150)) && (mouseY > 2*(height-150)/3) && (c3Occupied == false)) {
        player1 = true;
        c3Occupied = true;
        player2hasc3 = true;
      }
    }
  }
  if (((player1Win == true) || (player2Win == true) || (gameOverDraw == true)) && (mouseY < (5*(height-150)/6 +30)) && (mouseY > (5*(height-150)/6 - 30)) && (mouseX > (width/2 -55)) && (mouseX < (width/2 + 55))) {
    exit(); 
  } else if (((player1Win == true) || (player2Win == true) || (gameOverDraw == true)) && (mouseY < ((height-150)/6 +30)) && (mouseY > ((height-150)/6 - 30)) && (mouseX > (width/2 -55)) && (mouseX < (width/2 + 55))) {
    if (player1Win == true) {
      player1Score++;
    } else if (player2Win == true) {
      player2Score++;
    }
    gamesPlayed++;
    gameOverDraw = false;
    a1Occupied = false;
    a2Occupied = false;
    a3Occupied = false;
    b1Occupied = false;
    b2Occupied = false;
    b3Occupied = false;
    c1Occupied = false;
    c2Occupied = false;
    c3Occupied = false;
    if (gamesPlayed % 2 == 0) {
      player1 = true;
    } else if (gamesPlayed % 2 != 0) {
      player1 = false;
    }
    player1hasa1 = false;
    player1hasa2 = false;
    player1hasa3 = false;
    player1hasb1 = false;
    player1hasb2 = false;
    player1hasb3 = false;
    player1hasc1 = false;
    player1hasc2 = false;
    player1hasc3 = false;
    player2hasa1 = false;
    player2hasa2 = false;
    player2hasa3 = false;
    player2hasb1 = false;
    player2hasb2 = false;
    player2hasb3 = false;
    player2hasc1 = false;
    player2hasc2 = false;
    player2hasc3 = false;
    player1Win = false;
    player2Win = false;    
  }
}

void keyPressed() {
  if (key == TAB) {
    if ((pauseGame == false) && (gameStart == true)) {
      pauseGame = true;
    } else {
      pauseGame = false;
    }
  }
}
