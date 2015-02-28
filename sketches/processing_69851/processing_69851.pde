
//Ball
int rad = 8;
float ballX = 200;
float ballY = 100;

float Xspeed = 1.5;
float Yspeed = 1;
float maxXSpeed = 7.25;
float maxYSpeed = 2;

int ballXDirection = 1;
int ballYDirection = 1;

//Paddle
float paddleX = 15;
float paddleY = 100;
float paddle2X = 385;
float paddle2Y = 100;

boolean upPressed = false;
boolean downPressed = false;
boolean wPressed = false;
boolean sPressed = false;

float paddleSpeed = 4;

//Constraint
int inner = 25;

//Score
int p1Score = 0;
int p2Score = 0;
int maxScore = 15;

//Time



//Game Mechanics
int gameState; /* 0: start up menu; 1: 2 player; 2: 1 player;
3: game over, player 1 won; 4: game over, player 2 won.
*/



void setup() {
  size(400, 300);
  smooth();
  frameRate(60);
  gameState = 0;


}

void draw() {
  fill(255);
  background (0);
  stroke(255);
  if (gameState == 0) {
    textAlign(CENTER);
    text("PONG",width/2 , 30);
    text("Are You Ready To Play?", width/2, 60);
    rectMode(CENTER);
    rect(width/4, 170, 90, 30);
    rect(width*3/4, 170, 120, 30);
    fill(0);
    text("2-PLAYER", width/4, 175);
    text("PRACTICE MODE", width*3/4, 175);
    if(mousePressed && mouseX <= width/4 + 45 && mouseX >= width/4 - 45 && mouseY <= 170 + 15 && mouseY >= 170 - 15) {
      gameState = 1;
    }
    if(mousePressed && mouseX <= width*3/4 + 60 && mouseX >= width*3/4 - 60 && mouseY <= 170 + 15 && mouseY >= 170 - 15) {
      gameState = 2;
      int start = millis();
    }
  }
  
  if (gameState == 1) {
    
    fill(255);
    line(width/2, 0, width/2, height);
  
    text(p1Score, 30, 50);
    text(p2Score, width - 40, 50);
    
    ellipseMode(RADIUS);
    ellipse(ballX, ballY, rad, rad);
    
    ballX = ballX + (Xspeed * ballXDirection);
    ballY = ballY + (Yspeed * ballYDirection);
    if (ballX > width + rad) {
      ballX = 200;
      ballXDirection *= -1;
      p1Score = p1Score + 1;
      Xspeed = 1.5;
      Yspeed = 1;
      if (p1Score == maxScore) {
        gameState = 3;
        Xspeed = 1.5;
        Yspeed = 1;
      }
    }
    if (ballX < -rad) {
      ballX = 200;
      ballXDirection *= -1;
      p2Score = p2Score + 1;
      Xspeed = 1.5;
      Yspeed = 1;
      if (p2Score == maxScore) {
        gameState = 4;
        Xspeed = 1.5;
        Yspeed = 1;
        paddleY = 100;
        paddle2Y = 100;
      }
    }
    
    if (ballY > height - rad || ballY < rad) {
      ballYDirection *= -1;
    }
    
    rectMode(CENTER);
  paddleY = constrain(paddleY, inner, height - inner);
  paddle2Y = constrain(paddle2Y, inner, height - inner);
    rect(paddleX, paddleY, 10, 50);
    rect(paddle2X, paddle2Y, 10, 50);
  
    if(wPressed) {
      paddleY = paddleY - paddleSpeed;
    }
    if(sPressed) {
      paddleY = paddleY + paddleSpeed;
    }
    if(upPressed) {
      paddle2Y = paddle2Y - paddleSpeed;
    }
    if(downPressed) {
      paddle2Y = paddle2Y + paddleSpeed;
    }
    
    if(ballY >= paddleY - 25 && ballY <= paddleY + 25 && ballX <= 20 + rad && ballX >= 10 + rad) {
      ballXDirection *= -1;
      Xspeed = Xspeed + .25;
      if (Xspeed >= maxXSpeed) {
      Xspeed = maxXSpeed;
    }
      Yspeed = Yspeed + .10;
      if (Yspeed >= maxYSpeed) {
      Yspeed = maxYSpeed;
    }
    }
    if(ballY >= paddle2Y - 25 && ballY <= paddle2Y + 25 && ballX >= width - 20 - rad && ballX <= width - 10 - rad) {
      ballXDirection *= -1;
      Xspeed = Xspeed + .25;
      if (Xspeed >= maxXSpeed) {
      Xspeed = maxXSpeed;
    }
      Yspeed = Yspeed + .10;
      if (Yspeed >= maxYSpeed) {
      Yspeed = maxYSpeed;
    }
    }
  }
  
  if (gameState == 2) {  
    fill(255);
    line(width/2, 0, width/2, height);
    
    text(p1Score, 30, 50);
    text("Hits:" + p2Score, width - 40, 50);
    
    ellipseMode(RADIUS);
    ellipse(ballX, ballY, rad, rad);
    
    ballX = ballX + (Xspeed * ballXDirection);
    ballY = ballY + (Yspeed * ballYDirection);
    if (ballX > width + rad) {
      ballX = 200;
      ballXDirection *= -1;
      p1Score = p1Score + 1;
      Xspeed = 1.5;
      Yspeed = 1;
      if (p1Score == maxScore) {
        gameState = 5;
        Xspeed = 1.5;
        Yspeed = 1;
      }
    }
    
    if (ballY > height - rad || ballY < rad) {
      ballYDirection *= -1;
    }
    
    rectMode(CENTER);
    paddleY = constrain(paddleY, inner, height - inner);
    paddle2Y = constrain(paddle2Y, inner, height - inner);
    rect(paddleX, paddleY = ballY, 10, 50);
    rect(paddle2X, paddle2Y, 10, 50);
  
    if(upPressed) {
      paddle2Y = paddle2Y - paddleSpeed;
    }
    if(downPressed) {
      paddle2Y = paddle2Y + paddleSpeed;
    }
    
    if(ballY >= paddleY - 25 && ballY <= paddleY + 25 && ballX <= 20 + rad && ballX >= 10 + rad) {
      ballXDirection *= -1;
      Xspeed = Xspeed + .25;
      if (Xspeed >= maxXSpeed) {
      Xspeed = maxXSpeed;
    }
      Yspeed = Yspeed + .10;
      if (Yspeed >= maxYSpeed) {
      Yspeed = maxYSpeed;
    }
    }
    if(ballY >= paddle2Y - 25 && ballY <= paddle2Y + 25 && ballX >= width - 20 - rad && ballX <= width - 10 - rad) {
      ballXDirection *= -1;
      Xspeed = Xspeed + .25;
      if (Xspeed >= maxXSpeed) {
      Xspeed = maxXSpeed;
    }
      Yspeed = Yspeed + .10;
      if (Yspeed >= maxYSpeed) {
      Yspeed = maxYSpeed;
    }
      p2Score = p2Score + 1;
    } 
  }
  
  if (gameState == 3) {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, 30);
    text("Player 1 VICTORY", width/2, 50);
    rectMode(CENTER);
    rect(width/4, 120, 90, 30);
    rect(width*3/4, 120, 90, 30);
    fill(0);
    text("RESTART", width/4, 125);
    text("MENU", width*3/4, 125);
    fill(255);
    if(p2Score <= 5) {
      text("Either Player 1 is a robot,", width/2, 66);
      text("or more likely, Player 2 just sucks.", width/2, 78);
    } else if (p2Score > 5 && p1Score <= 10) {
      text("K, comon Player 2. You can do way better.", width/2, 66);
      text("SO STEP IT UP A NOTCH!!!!!", width/2, 78);
    }else if (p2Score > 10 && p1Score <= 13) {
      text("That was a pretty close game. Next time,", width/2, 66);
      text("Player 2 is bringing their A game.", width/2, 78);
    } else if (p2Score == 14) {
      text("That was a close game. Honestly way to battle it out.", width/2, 66);
      text("Good job to the both of you. Maybe next time Player 2 wins", width/2, 78);
    }
    if(mousePressed && mouseX <= width/4 + 45 && mouseX >= width/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 1;
      p1Score = 0;
      p2Score = 0;
    }
    if(mousePressed && mouseX <= width*3/4 + 45 && mouseX >= width*3/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 0;
      p1Score = 0;
      p2Score = 0;
    }
  }
  if (gameState == 4) {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, 30);
    text("Player 2 VICTORY", width/2, 50);
    rectMode(CENTER);
    rect(width/4, 120, 90, 30);
    rect(width*3/4, 120, 90, 30);
    fill(0);
    text("RESTART", width/4, 125);
    text("MENU", width*3/4, 125);
    fill(255);
    if(p1Score <= 5) {
      text("Either Player 2 is a robot,", width/2, 66);
      text("or more likely, Player 1 just sucks.", width/2, 78);
    } else if (p1Score > 5 && p1Score <= 10) {
      text("K, comon Player 1. You can do way better.", width/2, 66);
      text("SO STEP IT UP A NOTCH!!!!!", width/2, 78);
    }else if (p1Score > 10 && p1Score <= 13) {
      text("That was a pretty close game. Next time,", width/2, 66);
      text("Player 1 is bringing their A game.", width/2, 78);
    } else if (p1Score == 14) {
      text("That was a close game. Honestly way to battle it out.", width/2, 66);
      text("Good job to the both of you. Maybe next time Player 1 wins", width/2, 78);
    }
    
    if(mousePressed && mouseX <= width/4 + 45 && mouseX >= width/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 1;
      p1Score = 0;
      p2Score = 0;
    }
    if(mousePressed && mouseX <= width*3/4 + 45 && mouseX >= width*3/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 0;
      p1Score = 0;
      p2Score = 0;
    }
  }
  if(gameState == 5) {

    textAlign(CENTER);
    text("GAME OVER", width/2, 30);
    text("Hits: " + p2Score, width/2, 50);
    
    if(p2Score <= 50) {
      text("Woot, woot. You managed a grand total of " + p2Score + ",", width/2, 66);
      text("Impressive really, just oustanding...", width/2, 78);
      text("That is, if you were playing with half a hand. That was terrible", width/2, 90);
    } else if(p2Score > 50 && p2Score <= 75) {
      text("Really?? Only " + p2Score + " hits.", width/2, 66);
      text("You sir, are really bad, that'd be an F. Please step up your game.", width/2, 78);
    } else if(p2Score > 75 && p2Score <= 100) {
      text(p2Score + " hits, alright. I'll give that a solid D-.", width/2, 66);
      text("Congratz.", width/2, 78);
    } else if(p2Score > 100 && p2Score <= 125) {
      text("I'd say, " + p2Score + " is a pretty mediocre score,", width/2, 66);
      text(" C for you.", width/2, 78);
    } else if(p2Score > 125 && p2Score <= 200) {
      text("You're alright...", width/2, 66);
      text(p2Score + " is a fairly average score, but alright. B-.", width/2, 78);
    } else if(p2Score > 200 && p2Score <= 250) {
      text("Wow (wo)man, you are a pretty good Pong Player.", width/2, 66);
      text(p2Score + " hits is an B+ worthy score.", width/2, 78);
    } else if(p2Score > 250 && p2Score <= 400) {
      text("Congratz, you have Excelling abilities in Pong", width/2, 66);
      text("I'll give you an A for that score of " + p2Score + ".", width/2, 78);
    } else if(p2Score > 400 && p2Score < 1000) {
      text("Seriously, you got " + p2Score + ",", width/2, 66);
      text("That's friggen ridiculous. Just Stahp already.", width/2, 78);
    } else if(p2Score >= 1000) {
      text("WTF, you played long enough to get " + p2Score + "??", width/2, 66);
      text("I mean, I don't mean to be rude, but...", width/2, 78);
      text("GET SOME FRIENDS!!", width/2, 90);
    }
    
    rectMode(CENTER);
    rect(width/4, 120, 90, 30);
    rect(width*3/4, 120, 90, 30);
    fill(0);
    text("RESTART", width/4, 125);
    text("MENU", width*3/4, 125);
    if(mousePressed && mouseX <= width/4 + 45 && mouseX >= width/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 2;
      p1Score = 0;
      p2Score = 0;
    }
    if(mousePressed && mouseX <= width*3/4 + 45 && mouseX >= width*3/4 - 45 && mouseY <= 120 + 15 && mouseY >= 120 - 15) {
      gameState = 0;
      p1Score = 0;
      p2Score = 0;
    }
  }
}


void keyPressed() {
  if (keyCode == 'W') {
    wPressed = true;
  }
  if (keyCode == 'S') {
    sPressed = true;
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
}

void keyReleased() {
  if (keyCode == 'W') {
    wPressed = false;
  }
  if (keyCode == 'S') {
    sPressed = false;
  }
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
}


