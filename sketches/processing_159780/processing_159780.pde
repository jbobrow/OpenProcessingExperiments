
//Ciaran Carrick - C12548143
//Assignment - 3


Paddles player, player2;
Background B;
Ball ball;
CollisionManager cm;
Interface UI;
boolean start, single, pause; //False by default

void setup() {
  background(0);
  size(500, 600); 
  B = new Background(height/20);
  ball = new Ball(width/2, height/2);
  player = new Paddles(width-10, height/2, 0); //Position X, Position Y, Intial Score
  player2= new Paddles(0, height/2, 0); 
  cm = new CollisionManager();
  UI = new Interface();
}//end setup

void keyReleased() {
  //Resets game
  if (pause && key == 'r') {
    setup();
    fill(255);
    pause = !pause;
    UI.reset(player);
  }
  else if (start && key == BACKSPACE) {
    UI.TitleMenu();
    setup();
  }
  //Difficulty setting
  //Offers higher challenge upon sucessful completion of game
  if (pause && single == true && key == 'h' && player.score1 == 10) {
    fill(255);
    pause = !pause;
    player.score1 =0;
    player2.score2 = 0+5;
    player2.Ph =300;
    player2.yPaddle=width/2;
  }
}//end keyReleased


void draw() {
  //Displays main hud
  if (!start) {
    UI.TitleMenu();
  }//end !start if


  //List of function calls
  if (start && !pause) {
    cm.update(B, ball, player, player2);
    B.display();
    player.move();
    player.display();
    player2.AImove();
    player2.AIdisplay();
    ball.move();
    ball.display();
    UI.display(player);
  }
  else if (pause && player.score1 == 10 || pause && player2.score2 == 10) {
    B.display();
    UI.display(player);
  }//end Pause
}//end Draw

class Background {
  //Fields
  int Lineamount;
  int H=10, W=5, gap=10;
  //Constructor
  Background(int LineCount) {
    Lineamount=LineCount;
  }
  //Methods
  void display() {
    noStroke();
    rectMode(CORNER);
    background(0);
    //For loop to print multiple lines
    for (int i =0; i<Lineamount;i++) {
      rect((width/2)-W, gap/2+((H+gap) * i), W, H);
    }
    //Borders
    stroke(255);
    rect(gap, 0, width-gap*2, gap/2);
    rect(gap, height-gap/2, width-gap*2, gap);
  }//end display method
}//end class

class Ball {
  //Fields
  float xPos, yPos, directionx, directiony, maxSpeedX, maxSpeedY;
  int Ballsize;
  //Constructor
  Ball(float xIn, float yIn) {
    xPos = xIn; //X-position
    yPos = yIn; //Y-position
    Ballsize = 10;
    directionx =6; //Balls X speed
    directiony = (int)random(-6, 6); //Ball Y speed
    maxSpeedX = 15; //X top speed
    maxSpeedY = 8;  //Y top speed
  }
  //Methods
  void move() {
    //Top and bottom screen collisions
    xPos = xPos + directionx;
    yPos = yPos + directiony;
    if ((yPos > height-Ballsize) ||(yPos < 0+Ballsize))
    {
      directiony *= -1; //If balls bounces of off either top or bottom of screen, reverse direction.
    }

    if (directionx >= maxSpeedX) {
      directionx = maxSpeedX; //caps X momentum to MaxSpeedX
    }
    if (directiony >= maxSpeedY) {
      directiony = maxSpeedY; //caps Y momentum to MaxSpeedY
    }
  }//end move method

  void display() {
    rectMode(CENTER);
    noStroke();
    noFill();
    rect(xPos, yPos, Ballsize+5, Ballsize+5); //Balls Hitbox.
    fill(255);
    rect(xPos, yPos, Ballsize, Ballsize);
  }//end display method
}//end class


class CollisionManager {
  //No Fields

  //Constructor
  CollisionManager() {
  }
  //Methods
  void update(Background B, Ball ball, Paddles player, Paddles player2) {
    //If the ball is inbetween the paddle, bounce in opposite direction
    if ((ball.xPos >= player.xPaddle - ball.Ballsize/2)&& (ball.yPos-player.Ph >= player.yPaddle-player.Ph && ball.yPos <= player.yPaddle+player.Ph)) {
      ball.directionx *= -1;
      ball.directionx -= 1;
    }
    if ((ball.xPos < player2.xPaddle+ball.Ballsize*2) && (ball.yPos-player2.Ph >= player2.yPaddle-player2.Ph && ball.yPos <= player2.yPaddle+player2.Ph)) {
      //If the ball is below and above the paddle, bounce in opposite direction
      ball.directionx *= -1;
      ball.directionx += 1;
    }
    //Score for PaddleL
    if (ball.xPos >= width)
    {
      player2.score2 +=1;
      //Reset at different Y-position above and below border
      ball.xPos = width/2;
      ball.yPos = random(B.gap, height-B.gap);
      ball.directionx = -4;   // spawns ball going left
      ball.directiony = (int)random(-6, 6);
    }
    //Score for Paddles
    if (ball.xPos <= 0) {
      player.score1 +=1;
      //Reset at different Y-position above and below border
      ball.xPos = width/2;
      ball.yPos = random(B.gap, height-B.gap);
      ball.directionx = 4;   // spawns ball going right
      ball.directiony = (int)random(-6, 6);
    }
  }
}//end collision class

class Interface {
  //Fields

  //Constructor
  Interface() {
  }
  //Methods
  void TitleMenu() {
    start= false;
    pause=false;

    noStroke();
    fill(255);
    background(0);
    textAlign(CENTER);
    rectMode(CENTER);
    textSize(20);
    text("PONG", width/2, height/2);
    textSize(10);
    text("BACKSPACE to return", width/2, height-20);
    textSize(11);
    rect(width/4, 340, 90, 30);   //2-Player option
    rect(width*3/4, 340, 90, 30);  //Single player option
    fill(0);
    text("1-PLAYER", width/4, 345);
    text("2-PLAYER", width*3/4, 345);
    //4 if statements: 1st one changes colour and size, 2nd if takes input mouseinput inside rect, 2nd row is for 2-player button.
    if (mouseX < width/4 + 45 && mouseX > width/4 - 45 && mouseY < 340 + 15 && mouseY > 340 - 15) {
      fill(0, 50, 255);
      rect(width/4, 340, 90, 30);   //1-Player option
      fill(0);
      textSize(13);
      text("1-PLAYER", width/4, 345);
    }
    //Takes mouseclick and changes booleans to start game
    if (!start && mousePressed && mouseX < width/4 + 45 && mouseX > width/4 - 45 && mouseY < 340 + 15 && mouseY > 340 - 15) { //Only clicking inside the box activates if
      single = true;
      start = true;
    }
    if (mouseX < width*3/4 + 45 && mouseX > width*3/4 - 45 && mouseY < 340 + 15 && mouseY > 340 - 15) {
      fill(0, 50, 255);
      rect(width*3/4, 340, 90, 30);   //2-Player option
      fill(0);
      textSize(13);
      text("2-PLAYER", width*3/4, 345);
    }
    if (!start && mousePressed && mouseX < width*3/4 + 45 && mouseX > width*3/4 - 45 && mouseY < 340 + 15 && mouseY > 340 - 15) { //Only clicking inside the box activates if
      start = true;
      single = false;
    }
  }

  void reset(Paddles player) {
    //Resets scores kept in Paddle class
    player.score1 = player.score1;
    player2.score2 = player2.score2;
  }

  //Deplays UI
  void display(Paddles player) {
    fill(255);
    stroke(255);
    textSize(30);
    text(player.score1, width/2+50, 50);
    text(player2.score2, width/2-50, 50);
    // once wins accumulated, display score, retry, and option for harder difficulty
    if (player.score1 == 10) {
      pause=true;
      fill(200, 0, 150);
      text("'R'\n to retry", width/2+150, height/2);
      textSize(20);
      text("Player1 \nwins!", width/2+50, 80);
      if (player.score1 ==10 && single == true) {
        textSize(15);
        text("'h'for hard mode", width/2+155, height/2+70);
      }
    }
    else if (player2.score2 == 10) {
      fill(150, 0, 200);
      pause=true;
      text("'R'\n to retry", width/2-150, height/2);
      textSize(20);
      text("Player2 \nwins!", width/2-50, 80);
    }
  }//end display method
}//end class

class Paddles {
  //Fields
  float xPaddle, yPaddle, Pw, Ph, directiony, speed;
  int score1, score2;
  //Constructor
  Paddles(int xIn, int yIn, int scoreIn) {
    xPaddle = xIn;
    yPaddle = yIn;
    Pw = 10;
    Ph = 50;
    score1 = scoreIn; //Scores
    score2 = scoreIn;
    directiony=6; //Paddle Y 
  }
  //Methods
  void AImove() {
    //if true, AI Controls
    if (single == true) {  
      yPaddle =yPaddle + directiony;
      if (yPaddle> height-Ph) {
        directiony *= -1;
      }
      else if (yPaddle<0) {
        directiony *= -1;
      }
    }// end single if

    //If false, 2-player controls
    if (single==false) {
      if (keyPressed) {
        //sees the keys if pressed
        if (keyCode == UP) {
          yPaddle -= 15;
        }
        if (keyCode == DOWN) {
          yPaddle += 15;
        }
      }
      //Keeps paddle from moving off screen
      if (yPaddle> height-Ph) {
        yPaddle = 550;
      }
      else if ( yPaddle<0) {
        yPaddle = 0;
      }
    }//end single false if
  }


  // Prevents Paddles from moving off screen
  void move() {
    yPaddle = mouseY;
    if (mouseY> height-Ph) {
      mouseY = 550;
    }
    else if (mouseY<0) {
      mouseY = 0;
    }
  }//end move method
  //Display Paddle
  void display() {
    stroke(255);
    fill(255);
    rect(xPaddle, mouseY, Pw, Ph);
  }//end display method

  void AIdisplay() { //AI Display for keys
    stroke(255);
    fill(255);
    rect(xPaddle, yPaddle, Pw, Ph);
  }//end display method
}//end class



