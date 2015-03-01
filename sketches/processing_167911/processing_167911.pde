
int x = 200;
int y = 20;
int xspeed = 4;
int yspeed = 5;
int count = 0;
int[] xpos = new int[20]; 
int[] ypos = new int[20];
int state;
int START = 0;
int PLAY1 = 1;
int WIN1 = 2;
int LOSE = 3;
int PLAY2 = 4;
int WIN2 = 5;
int PLAY3 = 6;
int WIN3 = 7;
int PLAY4 = 8;
int WIN4 = 9;
int PLAY5 = 10;
int WIN5 = 11;
int mini1 = 12;
int mini2 = 13;
int mini3 = 14;
int mini4 = 15;
int mini5 = 16;
int mini6 =17;
int mini7 = 18;
int mini8 =19;
int PLAY6 = 20;
int WIN6 = 21;
int PLAY7 = 22;
int simon1 = 23;
int simon2 = 24;
int simon3 = 25;
int simon4 = 26;
int WIN7 = 27;
int RPS = 28;
int RPSPLAY = 29;
int BIGWIN = 30;

float G = random(3); 

Flower[] flowers = new Flower[20];


void setup() {
  size(500, 500);
  textSize(50);
  textAlign(CENTER, CENTER);
  background(255);
  state = START;
  smooth();
  strokeWeight(5);
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  for (int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower();
  }
}

void draw() {
  if (state == START) {
    startmenu();
  } 

  if (state == PLAY1) {
    textAlign(CENTER, CENTER);
    playGame1();


    if (count == 2) {
      state = WIN1;
      winGame1();
    }
    if (y > height) {
      state = LOSE;
      loseGame();
    }
  }

  if (state == PLAY2) {
    textAlign(CENTER, CENTER);
    playGame2();

    if (mouseX > 450 && mouseX < 500 && mouseY > 0 && mouseY < 50) {
      state = WIN2;
      winGame2();
    }

    if (mouseX > 50 && mouseY > 50 && mouseY < 375) {
      state = LOSE;
      loseGame();
    }
    if (mouseX > 50 && mouseX < 450 && mouseY < 450 && mouseY > 425) {
      state = LOSE;
      loseGame();
    }
    if (mouseX > 50 && mouseX < 175 && mouseY < 450 && mouseY > 200) {
      state = LOSE;
      loseGame();
    }
    if (mouseX > 500 || mouseX < 0 || mouseY > 500 || mouseY < 0) {
      state = LOSE;
      losegame();
    }
  }
  if (state == PLAY3) {
    textAlign(CENTER, CENTER);
    playGame3 ();

    if (count == 4) {
      state = LOSE;
      loseGame();
    }
  }
  if (state == PLAY4) {
    textAlign(CENTER, CENTER);
    playGame4();
  }
  if (state == PLAY5 || state == mini1 || state == mini2 || state == mini3 || state == mini4 || state == mini5 ||state == mini6 || state == mini7 || state == mini8) {
    textAlign(CENTER, CENTER);
    playGame5();
  }
  if (state == WIN5) {
    winGame5();
  }
  if (state == PLAY6) {
    textAlign(CENTER, CENTER);
    playGame6();
  }
  if (state == PLAY7) {
    textAlign(CENTER, CENTER);
    playGame7();
  }
  if (state == simon1) {
    simon1();
  }
  if (state == simon2) {
    simon2();
  }
  if (state == simon3) {
    simon3();
  }
  if (state == simon4) {
    simon4();
  }
  if (state == WIN7) {
    winGame7();
  }
  if (state == RPS) {
    RPS();
  }
  if (state == RPSPLAY) {
    RPSPLAY();
  }
  if (state == BIGWIN) {
    BIGWIN();
  }


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////GAME ENDINGS////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




  if (state == LOSE) {
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("RESTART", 250, 400);
    }
  }
  if (state == WIN1) { 
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN2) {
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN3) {
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      strokeWeight(5);
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN4) {
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      strokeWeight(5);
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN5) {
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      strokeWeight(5);
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN6) { 
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
  if (state == WIN7) { 
    if (mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
      hilite();
    } else {
      fill(255, 255, 0);
      rect(175, 375, 150, 50);
      textSize(25);
      fill(0);
      text("CONTINUE", 250, 400);
    }
  }
}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////GAMES////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



void startmenu() {
  background(255);
  fill(0);
  text("CLICK ANYWHERE", 250, 200);
  text("TO START", 250, 300);
}


void playGame1() {
  background(255);
  textSize(50);
  text(count + "/10", 75, 25);
  textSize(50);
  if (x > width - 10 || x < 0 + 10) { 
    xspeed = -xspeed;
  }
  if (y < + 10) {
    yspeed = -yspeed;
  }
  if (y > height - 20 && x < mouseX + 50 && x > mouseX - 50) {
    yspeed = -yspeed;
    background(0, 255, 0);
    count ++;
    fill(0);
  } 

  fill(0);
  ellipse(x, y, 20, 20);
  fill(0);
  rect(mouseX-50, 490, 100, 10);
  noStroke();
  if (y > height - 20 && x < mouseX + 50 && x > mouseX - 50) {
    noStroke();
    fill(255, 0, 0);
    rect(mouseX-50, 490, 25, 10);
    fill(0, 0, 255);
    rect(mouseX-25, 490, 25, 10);
    fill(0, 255, 0);
    rect(mouseX, 490, 25, 10);
    fill(0, 0, 255);
    rect(mouseX+25, 490, 25, 10);
  }
  fill(0);
  strokeWeight(5);
  stroke(0);

  x+=xspeed;
  y+=yspeed;
  strokeWeight(5);
}


void playGame2() {
  background(255);
  fill(0, 255, 255);
  noStroke();
  rect(450, 0, 50, 50);
  stroke(10);
  fill(0);
  rect(50, 50, 450, 325);
  rect(50, 50, 125, 375);
  rect(50, 425, 400, 25);
  strokeWeight(5);
  fill(255, 0, 0);
  textSize(50);
  text("DON'T TOUCH", 250, 200);
  text("THE WALLS", 250, 300);
}

void playGame3() {
  background(255);
  noStroke();
  fill(0, 0, 255);
  for (int i = 0; i < 10; i++) {

    for (int j = 0; j < 10; j++) {
      rect(50, 50, 30, 30);
      translate(0, 40);
    }

    translate(40, -400);
  }
  translate (-400, 0);
  fill(0, 150, 255);
  rect(130, 170, 30, 30);
  textSize(10);
  text("chances", 20, 45);
  text("left", 20, 55);
  textSize(50);
  text(4 - count, 20, 15);
  textSize(50);
  stroke(0);
  strokeWeight(5);
  fill(0);
  text("CLICK ON THE", 250, 20);
  text("ODD ONE OUT", 250, 460);
}

void playGame4() {
  background(255);

  noStroke();
  fill(0, 255, 0);
  ellipse(175, 165, 100, 50);
  ellipse(150, 140, 25, 25);
  ellipse(200, 140, 25, 25);
  fill(255);
  ellipse(150, 140, 15, 15);
  ellipse(200, 140, 15, 15);
  fill(0);
  ellipse(150, 140, 8, 8);
  ellipse(200, 140, 8, 8);
  strokeWeight(3);
  stroke(0);
  line(150, 165, 200, 165);

  strokeWeight(1);
  fill(255, 255, 0);
  ellipse(230, 270, 75, 100);
  fill(255, 127, 0);
  ellipse(230, 310, 100, 30);
  fill(255);
  ellipse(215, 280, 15, 15);
  ellipse(245, 280, 15, 15);
  fill(0);
  ellipse(215, 280, 8, 8);
  ellipse(245, 280, 8, 8);
  strokeWeight(3);
  line(180, 310, 280, 310);

  strokeWeight(3);
  line(200, 450, 300, 450);
  line(200, 455, 300, 455);
  line(200, 460, 300, 460);
  strokeWeight(1);
  fill(100);
  triangle(200, 375, 300, 375, 250, 475);
  ellipse(200, 375, 50, 50);
  ellipse(300, 375, 50, 50);
  strokeWeight(3);
  fill(255);
  ellipse(235, 400, 15, 15);
  ellipse(265, 400, 15, 15);
  fill(0);
  ellipse(235, 400, 8, 8);
  ellipse(265, 400, 8, 8);


  rectMode(CORNER);
  fill(200, 200, 255);
  rect(400, 125, 50, 50);
  rect(400, 275, 50, 50);
  rect(400, 425, 50, 50);
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }


  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;


  for (int i = 0; i < xpos.length; i ++ ) {
    noStroke();
    fill(255, 200, 200);
    rect(xpos[i], ypos[i], 15, 20);
  }
  fill(0);
  text("WHO'S TAIL?", 250, 50);
  stroke(0);
  strokeWeight(5);
}



void playGame5() {
  fill(0);
  text("DRAW A TREE", 250, 50);
  textSize(15);
  text("START^", 115, 400);
  textSize(25);
  fill(0);

  stroke(0);
  ellipse(150, 400, 5, 5); 
  ellipse(150, 200, 5, 5);
  ellipse(100, 175, 5, 5);
  ellipse(150, 100, 5, 5);
  ellipse(250, 75, 5, 5); 
  ellipse(350, 100, 5, 5);
  ellipse(400, 175, 5, 5);
  ellipse(350, 200, 5, 5);
  ellipse(350, 400, 5, 5);



  if (state == PLAY5) {
    if (mouseX>140 && mouseX<160 && mouseY>390 && mouseY<410) {
      state = mini1;
    }
  }
  if (state == mini1) {
    if (mouseX>140 && mouseX<160 && mouseY>190 && mouseY<210) {
      state = mini2;
    }
  }
  if (state == mini2) {
    if (mouseX>90 && mouseX<110 && mouseY>165 && mouseY<185) {
      state = mini3;
    }
  }
  if (state == mini3) {
    if (mouseX>140 && mouseX<160 && mouseY>90 && mouseY<110) {
      state = mini4;
    }
  }
  if (state == mini4) {
    if (mouseX>240 && mouseX<260 && mouseY>65 && mouseY<85) {
      state = mini5;
    }
  }
  if (state == mini5) {
    if (mouseX>340 && mouseX<360 && mouseY>90 && mouseY<110) {
      state = mini6;
    }
  }
  if (state == mini6) {
    if (mouseX>390 && mouseX<410 && mouseY>165 && mouseY<185) {
      state = mini7;
    }
  }
  if (state == mini7) {
    if (mouseX>340 && mouseX<360 && mouseY>190 && mouseY<210) {
      state = mini8;
    }
  }
  if (state == mini8) {
    if (mouseX>340 && mouseX<360 && mouseY>390 && mouseY<410) {
      state = WIN5;
    }
  }
  if (state == PLAY5 || state == mini1 || state == mini2 || state == mini3 || state == mini4 || state == mini5 ||state == mini6 || state == mini7) {
    if (mouseX>340 && mouseX<360 && mouseY>390 && mouseY<410) {
      state = LOSE;
      loseGame();
    }
  }
}

void playGame6() {
  background(255);
  text(count, 450, 450);
  textSize(25);
  text("KEEP THE WINDOW SAFE", 250, 50);
  if (x > width - 10 || x < 0 + 10) { 
    xspeed = -xspeed;
  }
  if (y < + 10 || y > height - 10) {
    yspeed = -yspeed;
  }

  ellipse(x, y, 20, 20);

  rectMode(CORNER);
  noStroke();
  fill(236, 200, 96);
  rect(mouseX-50, mouseY-50, 10, 100);
  rect(mouseX-5, mouseY-50, 10, 100);
  rect(mouseX+40, mouseY-50, 10, 100);
  rect(mouseX-50, mouseY-50, 100, 10);
  rect(mouseX-50, mouseY-5, 100, 10);
  rect(mouseX-50, mouseY+40, 100, 10);
  fill(131, 244, 252, 50);
  rect(mouseX-40, mouseY-40, 35, 35);
  rect(mouseX-40, mouseY+5, 35, 35);
  rect(mouseX+5, mouseY-40, 35, 35);
  rect(mouseX+5, mouseY+5, 35, 35);
  fill(0);

  x+=xspeed;
  y+=yspeed;

  count --;
  stroke(0);
  strokeWeight(5);


  if (x > mouseX - 60 && x < mouseX + 60 && y > mouseY - 60 && y < mouseY + 60) {
    state = LOSE;
    loseGame();
  } 
  if (count == 1700) {
    state = WIN6;
    winGame6();
  }
}

void playGame7() {
  background(255);
  textSize(50);
  fill(0);
  text("CLICK THE COLORS", 250, 50);
  text("IN THE ORDER THEY", 250, 125);
  text("APPEARED ON", 250, 200);
  text("THE PADDLE", 250, 275);
  text("IN GAME ONE", 250, 350);

  strokeWeight(5);
  fill(175);
  ellipseMode(CENTER);
  ellipse(250, 425, 50, 50);
  fill (0);
  textSize(30);
  text("START", 250, 480);
}

void simon1() {
  fill(255, 0, 0);
  rect(0, 0, 250, 250);
  fill(255, 255, 0);
  rect(250, 0, 250, 250);
  fill(0, 255, 0);
  rect(0, 250, 250, 250);
  fill(0, 0, 255);
  rect(250, 250, 250, 250);
  fill(0);
  ellipse(125, 125, 50, 50);
  ellipse(375, 125, 50, 50);
  ellipse(125, 375, 50, 50);
  ellipse(375, 375, 50, 50);
  ellipse(250, 250, 60, 60);
  noStroke();
  fill(255);
  arc(252, 248, 50, 50, PI+HALF_PI, TWO_PI);
}
void simon2() {
  fill(255, 0, 0);
  rect(0, 0, 250, 250);
  fill(255, 255, 0);
  rect(250, 0, 250, 250);
  fill(0, 255, 0);
  rect(0, 250, 250, 250);
  fill(0, 0, 255);
  rect(250, 250, 250, 250);
  fill(0);
  ellipse(200, 200, 50, 50);
  ellipse(300, 200, 50, 50);
  ellipse(200, 300, 50, 50);
  ellipse(300, 300, 50, 50);
  ellipse(250, 250, 60, 60);
  noStroke();
  fill(255);
  arc(252, 248, 50, 50, PI+HALF_PI, TWO_PI);
  arc(252, 252, 50, 50, 0, HALF_PI);
}
void simon3() {
  fill(255, 0, 0);
  rect(0, 0, 250, 250);
  fill(255, 255, 0);
  rect(250, 0, 250, 250);
  fill(0, 255, 0);
  rect(0, 250, 250, 250);
  fill(0, 0, 255);
  rect(250, 250, 250, 250);
  fill(0);
  ellipse(125, 125, 50, 50);
  ellipse(375, 125, 50, 50);
  ellipse(125, 375, 50, 50);
  ellipse(375, 375, 50, 50);
  ellipse(250, 250, 60, 60);
  noStroke();
  fill(255);
  arc(252, 248, 50, 50, PI+HALF_PI, TWO_PI);
  arc(252, 252, 50, 50, 0, HALF_PI);
  arc(248, 252, 50, 50, HALF_PI, PI);
}
void simon4() {
  fill(255, 0, 0);
  rect(0, 0, 250, 250);
  fill(255, 255, 0);
  rect(250, 0, 250, 250);
  fill(0, 255, 0);
  rect(0, 250, 250, 250);
  fill(0, 0, 255);
  rect(250, 250, 250, 250);
  fill(0);
  ellipse(200, 200, 50, 50);
  ellipse(300, 200, 50, 50);
  ellipse(200, 300, 50, 50);
  ellipse(300, 300, 50, 50);
  ellipse(250, 250, 60, 60);
  noStroke();
  fill(255);
  arc(252, 248, 50, 50, PI+HALF_PI, TWO_PI);
  arc(252, 252, 50, 50, 0, HALF_PI);
  arc(248, 252, 50, 50, HALF_PI, PI);
  arc(248, 248, 50, 50, PI, PI+HALF_PI);
}

void RPS() {
  background(255);
  textSize(50);
  fill(0);
  text("SEVEN GAMES DONE", 250, 50);
  text("THERE ARE NO MORE", 250, 125);
  text("BUT YOU CAN ONLY", 250, 200);
  text("WIN IF YOU WIN", 250, 275);
  text("THIS ROUND OF RPS", 250, 350);
  strokeWeight(5);
  ellipseMode(CENTER);
  fill(175);
  ellipse(450, 425, 50, 50);
  fill (0);
  textSize(30);
  text("START", 450, 480);
}

void RPSPLAY() {
  background(255);  
  textSize(50);
  textAlign(CENTER);
  text("ROCK", 350, 100);
  text("PAPER", 350, 250);
  text("SCISSORS", 350, 400);
  fill(0);
  rectMode(CENTER);
  rect(100, 75, 100, 100);
  rect(100, 225, 100, 100);
  rect(100, 375, 100, 100);
  fill(175);
  ellipse(100, 75, 75, 75);
  fill(255);
  rect(100, 225, 75, 75);
  fill(255);
  strokeWeight(5);
  stroke(0);
  line(75, 200, 125, 200);
  line(75, 210, 125, 210);
  line(75, 220, 125, 220);
  line(75, 230, 125, 230);
  line(75, 240, 125, 240);
  line(75, 250, 125, 250);
  noStroke();
  fill(255);
  triangle(60, 400, 90, 400, 125, 335);
  triangle(110, 400, 140, 400, 75, 335);
  fill(175);
  ellipse(75, 400, 40, 40);
  ellipse(125, 400, 40, 40);
  fill(0);
  ellipse(75, 400, 30, 30);
  ellipse(125, 400, 30, 30);
  fill(0);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////GAME END VOIDS////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void winGame1() {     
  background (0, 255, 0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
  xspeed = 0;
  yspeed = 0;
}


void winGame2() {     
  count = 0;
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
}
void winGame3() {     
  strokeWeight(5);
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
  count = 0;
}

void winGame4() {     
  strokeWeight(5);
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
  count = 0;
}

void winGame5() {     
  count = 0;
  strokeWeight(5);
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
}

void winGame6() {     
  count = 0;
  strokeWeight(5);
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
}

void winGame7() {     
  count = 0;
  strokeWeight(5);
  background (0, 255, 0);
  textSize(50);
  fill(0);
  text("YOU WIN", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("CONTINUE", 250, 400);
}

void BIGWIN() {
  background(0);
  colorMode(HSB, 360, 100, 100);
  textSize(225);
  fill(255);
  textAlign(CENTER);
  text("YOU", 250, 200);
  text("WIN", 250, 450);


  for (int i = 0; i < flowers.length; i++) {
    flowers[i].display();
  }
}


void loseGame() {    
  textAlign(CENTER, CENTER);
  stroke(0);
  strokeWeight(5);
  background (255, 0, 0);
  textSize(50);
  fill(0);
  text("YOU LOSE", 250, 200);
  fill(255, 255, 0);
  rect(175, 375, 150, 50);
  textSize(25);
  fill(0);
  text("RESTART", 250, 400);
}

void reset() {
  x = 10;
  y = 10;
  xspeed = 4;
  yspeed = 5;
  count = 0;
  state = PLAY1;
}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////MOUSECLICKED////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




void mouseClicked() {
  if (state == START) {
    state = PLAY1;
  }

  if (state == LOSE && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    reset();
  }
  if (state == WIN1 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY2;
  }
  if (state == WIN2 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY3;
  }
  if (state == PLAY3) {
    count ++;
  }  
  if (state == PLAY3 && mouseX > 130 && mouseX < 160 && mouseY > 170 && mouseY < 200) {
    state = WIN3;
    winGame3();
  }

  if (state == WIN3 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY4;
  }
  if (state == PLAY4 && mouseX > 400 && mouseX < 450 && mouseY > 125 && mouseY <175) {
    state = LOSE;
    loseGame();
  }
  if (state == PLAY4 && mouseX > 400 && mouseX < 450 && mouseY > 275 && mouseY <350) {
    state = LOSE;
    loseGame();
  }
  if (state == PLAY4 && mouseX > 400 && mouseX < 450 && mouseY > 425 && mouseY <475) {
    state = WIN4;
    winGame4();
  }
  if (state == WIN4 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY5; 
    background(255);
    count = 0;
    playGame5();
  }
  if (state == WIN5 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY6; 
    background(255);
    count = 1800;
    xspeed = 7;
    yspeed = 9;
    x = 10;
    y = 10;
    playGame6();
  }
  if (state == WIN6 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = PLAY7; 
    background(255);
    count = 0;
    stroke(0);
    playGame7();
  }
  if (state == PLAY7 && mouseX > 225 && mouseX < 275 && mouseY > 400 && mouseY < 450) {
    state = simon1;
    simon1();
  }
  if (state == WIN7 && mouseX > 175 && mouseX < 325 && mouseY > 375 && mouseY < 425) {
    state = RPS; 
    background(255);
    count = 0;
    stroke(0);
    RPS();
  }
  if (state == RPS && mouseX > 425 && mouseX < 475 && mouseY > 400 && mouseY < 450) {
    state = RPSPLAY;
    float G = random (255);
    RPSPLAY();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SIMON////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (state == simon1 && mouseX > 100 && mouseX < 150  && mouseY > 100 && mouseY < 150) {
    state = simon2;
    simon2();
  }
  if (state == simon1 && mouseX > 100 && mouseX < 150  && mouseY > 350 && mouseY < 400 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon1 && mouseX > 350 && mouseX < 400  && mouseY > 100 && mouseY < 150 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon1 && mouseX > 350 && mouseX < 400  && mouseY > 350 && mouseY < 400 ) {
    state = LOSE;
    loseGame();
  }



  if (state == simon2 && mouseX > 175 && mouseX < 225  && mouseY > 175 && mouseY < 225) {
    state = LOSE;
    loseGame();
  }
  if (state == simon2 && mouseX > 275 && mouseX < 325  && mouseY > 175 && mouseY < 225 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon2 && mouseX > 175 && mouseX < 225  && mouseY > 275 && mouseY < 325 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon2 && mouseX > 275 && mouseX < 325  && mouseY > 275 && mouseY < 325 ) {
    state = simon3;
    simon3();
  }



  if (state == simon3 && mouseX > 100 && mouseX < 150  && mouseY > 100 && mouseY < 150) {
    state = LOSE;
    loseGame();
  }
  if (state == simon3 && mouseX > 100 && mouseX < 150  && mouseY > 350 && mouseY < 400 ) {
    state = simon4;
    simon4();
  }
  if (state == simon3 && mouseX > 350 && mouseX < 400  && mouseY > 100 && mouseY < 150 ) {

    state = LOSE;
    loseGame();
  }
  if (state == simon3 && mouseX > 350 && mouseX < 400  && mouseY > 350 && mouseY < 400 ) {
    state = LOSE;
    loseGame();
  }


  if (state == simon4 && mouseX > 175 && mouseX < 225  && mouseY > 175 && mouseY < 225) {
    state = LOSE;
    loseGame();
  }
  if (state == simon4 && mouseX > 275 && mouseX < 325  && mouseY > 175 && mouseY < 225 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon4 && mouseX > 175 && mouseX < 225  && mouseY > 275 && mouseY < 325 ) {
    state = LOSE;
    loseGame();
  }
  if (state == simon4 && mouseX > 275 && mouseX < 325  && mouseY > 275 && mouseY < 325 ) {
    stroke(0);
    strokeWeight(5);
    state = WIN7;
    winGame7();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////RPS////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (state == RPSPLAY) {
    if (G > 0 && G < 1) {
      if (mouseX > 50 && mouseX < 150 && mouseY > 25 && mouseY < 125) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = RPS;
        RPS();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 175 && mouseY < 275) {
        state = BIGWIN;
        BIGWIN();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 325 && mouseY < 425) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = LOSE;
        loseGame();
      }
    }

    if (G > 1 && G < 2) {
      if (mouseX > 50 && mouseX < 150 && mouseY > 25 && mouseY < 125) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = LOSE;
        loseGame();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 175 && mouseY < 275) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = RPS;
        RPS();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 325 && mouseY < 425) {
        state = BIGWIN;
        BIGWIN();
      }
    }

    if (G > 2 && G < 3) {
      if (mouseX > 50 && mouseX < 150 && mouseY > 25 && mouseY < 125) {
        state = BIGWIN;
        BIGWIN();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 175 && mouseY < 275) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = LOSE;
        loseGame();
      }
      if (mouseX > 50 && mouseX < 150 && mouseY > 325 && mouseY < 425) {
        rectMode(CORNER);
        stroke(0);
        strokeWeight(5);
        state = RPS;
        RPS();
      }
    }
  }
}


void mouseDragged() {
  if (state == PLAY5 || state == mini1 || state == mini2 || state == mini3 || state == mini4 || state == mini5 ||state == mini6 || state == mini7 || state == mini8) {
    if (mouseY<200) {
      stroke(0, 255, 0);
    }
    if (mouseY>=200) {
      stroke(209, 162, 6);
    }
  }
  if (state == PLAY5) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini1) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini2) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini3) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini4) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini5) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini6) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini7) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (state == mini8) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void hilite() {
  fill(255, 255, 255, 10);
  rect(175, 375, 150, 50);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////CLASS////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Dot {
  float hue;

  float R = random(10, 100);
  float theta = random(TWO_PI);

  float x;
  float y;

  float goal_x = R * cos(theta);
  float goal_y = R * sin(theta);

  float easing_x = random(0.03, 0.07);
  float easing_y = random(0.03, 0.07);

  float sat = random(30, 100);
  float brt = random(30, 100);

  Dot(float tmpHue) {
    x = 0;
    y = 0;
    hue = tmpHue;
  }

  void move() {
    x += (goal_x - x) * easing_x;
    y += (goal_y - y) * easing_y;
  }

  void display(float alp) {
    stroke(hue, sat, brt, alp);
    point(x, y);
  }
}

class Flower {
  int dot_val = (int)random(100, 200);

  Dot[] dots = new Dot[dot_val];

  float x = random(width);
  float y = random(height);
  float hue = random(360);

  float alp = random(10, 255);
  float alp_spd = random(3, 6);

  Flower() {
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot(hue);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < dots.length; i++) {
      dots[i].move();
      dots[i].display(alp);
    }

    alp -= alp_spd;

    if (alp < 0) {
      x = random(width);
      y = random(height);
      hue = random(360);

      for (int i = 0; i < dots.length; i++) {
        dots[i].x = 0;
        dots[i].y = 0;
      }
      alp = 255;
    }

    popMatrix();
  }
}

