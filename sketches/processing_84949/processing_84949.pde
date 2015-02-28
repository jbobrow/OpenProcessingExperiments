


// sets Y ccoordinates for ball
int ballY = height/2;
// sets the X coordinates for the ball
int ballX = width/2;
// sets the speed of the ball
int speed = 10;
// sets the X direction of the ball when moving
int dirX = speed;
// sets the Y direction of the ball when moving
int dirY = speed;
// stops the game from starting until the player starts
boolean started =  false;
// sets player score
int playerScore = 0;
// sets computer score
int computerScore = 0;
// sets the ball in the middle
float ballPos = height/2;
// sets the speed the computer paddles moves at
float computerSpeed = 8;
//stops the game when player wins or loses
boolean gameOver = false;

void setup() {
  // size of the window
  size (1000, 600);
  // black background
  background(0);
  // smooth edges
  smooth();
}

void draw() {

  // MENU


  // if the player hasn't started the game, keep the menu shown
  if (started == false) {
    // set the background to black
    background(0);
    // loads a font
    PFont font = loadFont("SansSerif.vlw");
    // makes the text green
    fill(30, 255, 0);
    // makes the font 150 pixels
    textFont (font, 150);
    // sets the text to align in CENTER mode
    textAlign(CENTER, CENTER);
    // write "Ping"
    text("Ping", width/2, 100);
    rectMode(CENTER);
    // draws the button
    // makes the font white
    fill(255);
    // sets rectangle to be drawn from centre
    rect(width/2, height/2 +100, 300, 100);
    // sets fill to black
    fill(0);
    // set font size to 50
    textFont(font, 50);
    // write "Start Game" on the button
    text("Start Game", width/2, height/2 +100);
    // set font size to 30
    textFont(font, 30); 
    // set fill to white
    fill(255);
    //write "Dermot Hughes" at the bottom of the screen
    text("Dermot Hughes", width/2, height -100);




    // START GAME BUTTON

    // sets the hit box of the button
    if (mousePressed && mouseY < height/2 + 150 && mouseY > height/2 +50 && mouseX < width/2 +150 && mouseX > width/2 - 150) {
      // sets the scores to zero
      playerScore = 0;
      computerScore = 0;
      // when button hit, the games begin
      started = true;
      gameOver = false;
    }
  }


  // GAME


  // starts when started = true and doesn't run if gameOver == true to prevent the game running in the background
  else {
    if (gameOver == false) {
      // sets background to black
      background(0);
      // removes the mouse cursor
      noCursor();



      // SCOREBOARD

      // loads the font
      PFont font = loadFont("SansSerif.vlw");
      // sets font size
      textFont (font, 50);
      // display the scores either side of the divide
      text(computerScore, width/2 - 50, 30);
      text(playerScore, width/2 + 50, 30);

      // DIVIDING LINE
      rectMode(CENTER);
      // fill it white
      fill(255);
      // draws a thin rectangle (10px) down the middle of the window
      rect(width/2, height/2, 10, height);




      // PLAYER PADDLE
      // set the rectangle drawing mode to Center 
      rectMode(CENTER);
      // Fill it white
      fill(255);
      // draws a 20x120 rectangle which follows the mouse Y position
      rect(width -10, mouseY, 20, 120);
      // removes stroke from paddle
      noStroke();


      // COMPUTER PADDLE

      // set the rectangle drawing mode to Centre
      rectMode(CENTER);
      // fill it white
      fill(255);
      // draws paddle which will follow the balls position 
      rect(10, ballPos, 20, 120);
      // removes stroke from paddle
      noStroke();
      //println(ballPos);
      //moves the computer paddle up or down depending on where the ball is
      if (ballPos < ballY) {
        ballPos = ballPos + computerSpeed ;
      }
      if (ballPos > ballY) {
        ballPos = ballPos - computerSpeed ;
      }


      // BALL



      // set the ellipse mode to Centre
      ellipseMode(CENTER);
      // colour it green
      fill(30, 255, 0);
      // draw the ball and position it
      ellipse(ballX, ballY, 20, 20);
      // remove the stroke
      noStroke();


      // make the ball move
      ballY = ballY + dirY;
      ballX = ballX + dirX;



      // COLLISION DETECTION

      // PLAYER PADDLE
      // if the ball hits the player paddle (mouseY plus and minus half length of the paddle
      if (ballX == width -30 && ballY <= mouseY+60 && ballY >= mouseY-60) {

        // if ball hits bottom half make ball bounce up
        if (ballY < mouseY) {
          dirX =  -speed;
          dirY =  -speed;
        }
        // if ball hits top half make ball bounce down
        if (ballY > mouseY) {
          dirX =  -speed;
          dirY =  +speed;
        }
        // if ball hits centre make ball bounce straight
        if (ballY == mouseY) {
          dirX =  -speed;
          dirY = 0;
        }
      }

      // COMPUTER PADDLE

      // if the ball hits the computer paddle (ballY plus and minus half length of the paddle
      if (ballX == 30 && ballY <= ballPos + 60 && ballY >= ballPos - 60) {

        // if ball hits bottom half make ball bounce up
        if (ballY < ballPos) {
          dirX =  speed;
          dirY =  - speed;
        }
        // if ball hits top half make ball bounce down
        if (ballY > ballPos) {
          dirX =  speed;
          dirY =  + speed;
        }
        // if ball hits centre make ball bounce straight
        if (ballY == ballPos) {
          dirX =  speed;
          dirY = 0  ;
        }
      }


      // WALLS

      // if ball hits top, bounce back (-10px tolerance for width of ball)
      if ( ballY == 10) {
        dirY =   speed;
      }
      // if ball hits bottom, bounce back (-10px tolerance for width of ball)
      if ( ballY == height -10) {
        dirY =  - speed;
      }


      //SCORING

      if (ballX < 0) {
        // if the ball doesn't hit the computer paddle add one to player score
        playerScore ++;
        // add 1.5 second delay after a score so the game doesn't resume immediately
        delay(1500);
        //resets the ball to centre
        ballX = width/2;
        ballY = height/2;
      }
      if (ballX > width) {
        // if the ball doesn't hit the player paddle add one to player score
        computerScore ++;
        // add 1.5 second delay after a score so the game doesn't resume immediately
        delay(1500);
        //resets the ball to centre
        ballX = width/2;
        ballY = height/2;
      }
    }
    // if the players score equals ten then end the game 
    if (playerScore == 10) {

      // sets the background to black
      background(0);
      // loads a font
      PFont font = loadFont("SansSerif.vlw");
      // sets font
      textFont (font, 100);
      // writes "You Won!"
      text("You Won!", width/2, height/2);
      textFont (font, 50);
      // writes "Click to Continue
      text("Click to Continue", width/2, height - 200);
      // shows a hand cursor for the player
      cursor(HAND);
      //sets the game to over so the game doesn't continue to play in the background
      gameOver = true;

      if (mousePressed) {
        // bring the player back to the menu when the mouse is clicked
        started = false;
      }
    }
    // if the enemies score equals ten then end the game
    if (computerScore == 10) {

      // sets the background to black
      background(0);
      // loads a font
      PFont font = loadFont("SansSerif.vlw");
      // sets font
      textFont (font, 100);
      // writes "You Lost!"
      text("You Lost!", width/2, height/2);
      textFont (font, 50);
      // writes "Click to Continue
      text("Click to Continue", width/2, height - 200);
      // shows a hand cursor for the player
      cursor(HAND);
      //sets the game to over so the game doesn't continue to play in the background
      gameOver = true;


      if (mousePressed) {
        // bring the player back to the menu when the mouse is clicked
        started = false;
      }
    }
  }
}


