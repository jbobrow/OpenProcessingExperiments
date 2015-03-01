


//Difficulties instructions
//Easy AI speed 3 ball Xspeed & ball Xspeed2 20 Yspeed5
//Normal AI speed 4 ball Xspeed & ball xspeed2 20 Yspeed5
//Hard AI speed 6 ball Xspeed & ball Xspeed2 30 Yspeed 7
//Impossable AI speed 7 ball Xspeed & ballXspeed2 40 Yspeed 7

//Variables
int speedx = 5;
int speedy = 1;
int ballX = 50;
int ballY = 50;
int padX = 1450;
int padY = 50;
int speedy2 = 5;
int score = 0;
boolean playingE = false;
boolean playingN = false;
boolean playingH = false;
boolean playingI = false;
boolean Lose = false;
boolean Win = false;


void setup () {

  //Setup
  background(255, 0, 0);
  size(1500, 700);
  fill(0, 255, 0);
  textSize(150);
  text("PONG", 550, 150);
  textSize(25);
  text("by Milkshaker Games", 620, 175);
  padX = 1325;
  System.out.println(padX);
  strokeWeight(3);
  stroke(0, 255, 0);
  fill(0);
  rect(300, 200, 400, 150);
  rect(800, 200, 400, 150);
  rect(300, 400, 400, 150);
  rect(800, 400, 400, 150);
  fill(255);
  textSize(50);
  text("EASY", 450, 300);
  text("NORMAL", 900, 300);
  text("HARD", 450, 500);
  text("IMPOSSIBLE", 850, 500);
}

void draw () {


  if (score == -11) {
    Lose = true;
  }
  if (score == 11) {
    Win = true;
  }
  if (mousePressed) {
    println("mouseX: " + mouseX);
    println("mouseY: " + mouseY);
  }

  //easy
  if (mouseX>300&&mouseX<700&&mouseY>200&&mouseY<350&&mousePressed) {
    playingE = true;
  }

  if (playingE) {

    //Background and Score text
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("SCORE " + score, 600, 100);

    //Ball
    noStroke();
    ellipse(ballX, ballY, 40, 40); 

    //Setup
    ballX = ballX + speedx;
    ballY = ballY + speedy;
    padY = padY + speedy2;


    //XBall speed
    if (ballX > 1500) {
      speedx = -20;
    }

    //XBall speed
    if (ballX < 0) {
      speedx = 20;
    }

    //YBall speed
    if (ballY < 0) {
      speedy = 5;
    }

    //YBall speed
    if (ballY > 700) {
      speedy = -5;
    }

    //AI Setup
    if (padY < 0) {
      speedy2 = 5;
    }

    if (padY > 850) {
      speedy2 = -5;
    }

    //Collisions
    if (ballX+25>=padX) {
      if (ballY>=mouseY && ballY <= mouseY+190) {

        //Ball Xspeed2
        speedx = -20;
      }
    }

    //Collisions
    if (ballX-25<=50) {
      if (ballY>=padY && ballY <= padY+190) {

        //Ball Xspeed2
        speedx = 20;
      }
    }

    //AI
    if (padY+100>ballY) {
      //AI speed
      speedy2 = -3;
    }

    //AI
    if (padY+100<ballY) {
      //AI speed
      speedy2 = 3;
    }

    //Paddles
    fill(0, 255, 0);
    rect(padX, mouseY, 10, 190);
    rect(50, padY, 10, 190);


    //Score +
    if (ballX < 0) {
      score = score +1;
      ballX = 60; 
      ballY = 350;
    }
    //Score -
    if (ballX > 1500) {
      score = score -1;
      ballX = 1315; 
      ballY = 350;
    }
  if (Lose) {
    background(0, 255, 0);
    fill(255, 0, 0);
    textSize(100);
    text("YOU LOSE", 550, 350);
    }
    
        if (Win) {
    background(255, 0, 0);
    fill(0, 255, 0);
    textSize(100);
    text("YOU WIN!", 550, 350);
    }
  }

  //Normal
  if (mouseX>800&&mouseX<1200&&mouseY>200&&mouseY<350&&mousePressed) {
    playingN = true;
  }

  if (playingN) {

    //Background and Score text
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("SCORE " + score, 600, 100);

    //Ball
    noStroke();
    ellipse(ballX, ballY, 40, 40); 

    //Setup
    ballX = ballX + speedx;
    ballY = ballY + speedy;
    padY = padY + speedy2;


    //XBall speed
    if (ballX > 1500) {
      speedx = -20;
    }

    //XBall speed
    if (ballX < 0) {
      speedx = 20;
    }

    //YBall speed
    if (ballY < 0) {
      speedy = 5;
    }

    //YBall speed
    if (ballY > 700) {
      speedy = -5;
    }

    //AI Setup
    if (padY < 0) {
      speedy2 = 5;
    }

    if (padY > 850) {
      speedy2 = -5;
    }

    //Collisions
    if (ballX+25>=padX) {
      if (ballY>=mouseY && ballY <= mouseY+190) {

        //Ball Xspeed2
        speedx = -20;
      }
    }

    //Collisions
    if (ballX-25<=50) {
      if (ballY>=padY && ballY <= padY+190) {

        //Ball Xspeed2
        speedx = 20;
      }
    }

    //AI
    if (padY+100>ballY) {
      //AI speed
      speedy2 = -4;
    }

    //AI
    if (padY+100<ballY) {
      //AI speed
      speedy2 = 4;
    }

    //Paddles
    fill(0, 255, 0);
    rect(padX, mouseY, 10, 190);
    rect(50, padY, 10, 190);


    //Score +
    if (ballX < 0) {
      score = score +1;
      ballX = 60; 
      ballY = 350;
    }
    //Score -
    if (ballX > 1500) {
      score = score -1;
      ballX = 1315; 
      ballY = 350;
    }
  if (Lose) {
    background(0, 255, 0);
    fill(255, 0, 0);
    textSize(100);
    text("YOU LOSE", 550, 350);
    }
    
        if (Win) {
    background(255, 0, 0);
    fill(0, 255, 0);
    textSize(100);
    text("YOU WIN!", 550, 350);
    }
  }

  //Hard
  if (mouseX>300&&mouseX<700&&mouseY>400&&mouseY<550&&mousePressed) {
    playingH = true;
  }

  if (playingH) {

    //Background and Score text
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("SCORE " + score, 600, 100);

    //Ball
    noStroke();
    ellipse(ballX, ballY, 40, 40); 

    //Setup
    ballX = ballX + speedx;
    ballY = ballY + speedy;
    padY = padY + speedy2;


    //XBall speed
    if (ballX > 1500) {
      speedx = -30;
    }

    //XBall speed
    if (ballX < 0) {
      speedx = 30;
    }

    //YBall speed
    if (ballY < 0) {
      speedy = 7;
    }

    //YBall speed
    if (ballY > 700) {
      speedy = -7;
    }

    //AI Setup
    if (padY < 0) {
      speedy2 = 5;
    }

    if (padY > 850) {
      speedy2 = -5;
    }

    //Collisions
    if (ballX+25>=padX) {
      if (ballY>=mouseY && ballY <= mouseY+190) {

        //Ball Xspeed2
        speedx = -30;
      }
    }

    //Collisions
    if (ballX-25<=50) {
      if (ballY>=padY && ballY <= padY+190) {

        //Ball Xspeed2
        speedx = 30;
      }
    }

    //AI
    if (padY+100>ballY) {
      //AI speed
      speedy2 = -6;
    }

    //AI
    if (padY+100<ballY) {
      //AI speed
      speedy2 = 6;
    }

    //Paddles
    fill(0, 255, 0);
    rect(padX, mouseY, 10, 190);
    rect(50, padY, 10, 190);


    //Score +
    if (ballX < 0) {
      score = score +1;
      ballX = 60; 
      ballY = 350;
    }
    //Score -
    if (ballX > 1500) {
      score = score -1;
      ballX = 1315; 
      ballY = 350;
    }
  if (Lose) {
    background(0, 255, 0);
    fill(255, 0, 0);
    textSize(100);
    text("YOU LOSE", 550, 350);
    }
    
        if (Win) {
    background(255, 0, 0);
    fill(0, 255, 0);
    textSize(100);
    text("YOU WIN!", 550, 350);
    }
  }

  //Impossable
  if (mouseX>800&&mouseX<1200&&mouseY>400&&mouseY<550&&mousePressed) {
    playingI = true;
  }

  if (playingI) {

    //Background and Score text
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("SCORE " + score, 600, 100);

    //Ball
    noStroke();
    ellipse(ballX, ballY, 40, 40); 

    //Setup
    ballX = ballX + speedx;
    ballY = ballY + speedy;
    padY = padY + speedy2;


    //XBall speed
    if (ballX > 1500) {
      speedx = -40;
    }

    //XBall speed
    if (ballX < 0) {
      speedx = 40;
    }

    //YBall speed
    if (ballY < 0) {
      speedy = 7;
    }

    //YBall speed
    if (ballY > 700) {
      speedy = -7;
    }

    //AI Setup
    if (padY < 0) {
      speedy2 = 5;
    }

    if (padY > 850) {
      speedy2 = -5;
    }

    //Collisions
    if (ballX+25>=padX) {
      if (ballY>=mouseY && ballY <= mouseY+190) {

        //Ball Xspeed2
        speedx = -40;
      }
    }

    //Collisions
    if (ballX-25<=50) {
      if (ballY>=padY && ballY <= padY+190) {

        //Ball Xspeed2
        speedx = 40;
      }
    }

    //AI
    if (padY+100>ballY) {
      //AI speed
      speedy2 = -7;
    }

    //AI
    if (padY+100<ballY) {
      //AI speed
      speedy2 = 7;
    }

    //Paddles
    fill(0, 255, 0);
    rect(padX, mouseY, 10, 190);
    rect(50, padY, 10, 190);


    //Score +
    if (ballX < 0) {
      score = score +1;
      ballX = 60; 
      ballY = 350;
    }
    //Score -
    if (ballX > 1500) {
      score = score -1;
      ballX = 1315; 
      ballY = 350;
    }
  }
  if (Lose) {
    background(0, 255, 0);
    fill(255, 0, 0);
    textSize(100);
    text("YOU LOSE", 550, 350);
  }
  
    if (Win) {
    background(255, 0, 0);
    fill(0, 255, 0);
    textSize(100);
    text("YOU WIN!", 550, 350);
    }
}

