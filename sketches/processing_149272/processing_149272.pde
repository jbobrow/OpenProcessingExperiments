
PImage startBackGround;
PImage gameOver;
PImage howToPlayImage;
PImage scope;
PImage shots;
dodgePlayer one;
dodgePlayer two;
dodgePlayer robotWally;
dodgeBall ball;
boolean showHowToPlayImage = false;
boolean ONEVSONE = false;
boolean startUpScreen = true;
boolean roundOver;
boolean playerOneHasBall = false;
boolean playerTwoHasBall = false;
boolean clickSetRounds = false;
boolean setRounds = true;
boolean gameOverScreen = false;
boolean URF = false;
boolean oneRideRobot = false;
boolean twoRideRobot = false;
boolean rapidFire = false;
int robotHealth;
int visualNumRound;
int playerOneWon = 0;
int playerTwoWon = 0;
int realTime;
int remainingTime = 61;
int visualTime;
int restartTime = 0;
int maxRound;
int numRound = 0;
String scopeUrl = "http://i589.photobucket.com/albums/ss335/rumblefighter87/0cea02ef-62c4-4d6c-82d4-eb9b325bf4c1.png";
String playerText = "";
String howToPlay = "http://i589.photobucket.com/albums/ss335/rumblefighter87/7b11510f-7461-4a01-8a5b-516a618762f3.png";
String bg = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Crunchers_Dodgeball_800x600.jpg";
String playerOneImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Super_Dodge_Ball_player_big-2.png";
String playerTwoImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/player.png";
String dodgeBallUrl = "http://i589.photobucket.com/albums/ss335/rumblefighter87/81203dff-8be2-4e74-b71f-4c856e21991b.png";
String gameOverImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/gameover.jpg";
String robotUrl = "http://i589.photobucket.com/albums/ss335/rumblefighter87/d87e9ce0-77cc-4158-94fb-f5b165aba245.png";
String shotsUrl = "http://i589.photobucket.com/albums/ss335/rumblefighter87/66f830e5-f872-4b6f-a006-8b18c442aef7.png";

void setup() {
  frameRate(80);
  size(600, 455);
  startBackGround = loadImage(bg);
  gameOver = loadImage(gameOverImage);
  scope = loadImage(scopeUrl);
  one = new dodgePlayer(20, 165, 3, loadImage(playerOneImage), 1);
  two = new dodgePlayer(545, 165, 3, loadImage(playerTwoImage), 2);
  robotWally = new dodgePlayer(60, 130, 1, loadImage(robotUrl), 0);
  ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBallUrl) );
  howToPlayImage = loadImage(howToPlay);
  shots = loadImage(shotsUrl);
}

void draw() {
  // timer
  realTime = (int)(millis()/1000);
  visualTime = remainingTime - ( realTime - restartTime );

  if (startUpScreen) { // startUpScreen starts
    //load the image background
    image(startBackGround, 0, 0);
    //choose the mode
    chooseMode();
  }

  if ( showHowToPlayImage ) {
    image( howToPlayImage, 0, 0);
    menuButton();
  }

  if ( ONEVSONE && !startUpScreen ) {
    if ( setRounds == true ) {
      numRound = 0;
      maxRound = 0;
      playerOneWon = 0;
      playerTwoWon = 0;
      setNumRounds();
    } 
    else if ( setRounds == false ) {
      setRounds = false;
      background(31, 183, 4);
      drawField(); // the game field
      stroke(255);
      strokeWeight(5);
      line(290, 82, 290, height-32); // the middle line that separates the field
      one.display(); // draw player one
      two.display(); // draw player two
      ball.display(); // draw the ball
      ballCollision(); // checks for ball collision between the ball and players
      checkField(); // checks the limits of the field for the ball
      if ( one.x > 250 ) {
        one.x = 250;
      }
      if ( two.x < 294 ) {
        two.x = 294;
      }

      resetMatch(); // resets the match when the round is over
      isGameOver(); // checks if the game is over
    }
  }

  if ( URF && !startUpScreen ) {
    if ( setRounds == true ) {
      numRound = 0;
      maxRound = 0;
      playerOneWon = 0;
      playerTwoWon = 0;
      setNumRounds();
    } 
    else if ( setRounds == false ) {
      setRounds = false;
      background(166, 166, 166);
      drawField(); // the game field
      stroke(255);
      strokeWeight(5);
      line(17, height/2, 583, height/2); // the middle line that separates the field
      robotWally.display();
      one.display(); // draw player one
      two.display(); // draw player two
      ball.display(); // draw the ball
      ballCollision(); // checks for ball collision between the ball and players
      if ( two.x < 20 ) {
        two.x = 20;
      }
      if ( one.x > 545 ) {
        one.x = 545;
      }
      checkField();
      resetMatch(); // resets the match when the round is over
      isGameOver(); // checks if the game is over
      if ( oneRideRobot || twoRideRobot ) {
        noCursor();
        image(scope, mouseX-scope.width/2, mouseY-scope.height/2);
        if ( mousePressed ) {
           image(shots, mouseX,mouseY);
        }
        if ( two.headShot(mouseX , mouseY) && !two.RideRobot && mousePressed ) {
          roundOver = true;
        } else if ( one.headShot(mouseX,mouseY) && !one.RideRobot && mousePressed ) {
          roundOver = true;
        }
      }
    }
  }
}

void isGameOver() {
  if ( playerOneWon == playerTwoWon ) {
    moreWins = 0;
  } 
  else if ( playerOneWon < playerTwoWon ) {
    moreWins = playerTwoWon;
  } 
  else if ( playerOneWon > playerTwoWon ) {
    moreWins = playerOneWon;
  }

  if ( numRound-(playerOneWon+playerTwoWon)-1 > maxRound-(playerOneWon+playerTwoWon) ) {
    image(gameOver, -20, -25);
    menuButton();
    gameOverScreen = true;
  }
}

void ballCollision() {
  if ( ball.speed == 0 && ball.collision(one.x, one.y) && !playerTwoHasBall && !oneRideRobot ) {
    playerOneHasBall = true;
    ball.x = one.x+13;
    ball.y = one.y+18;
  }
  if ( ball.speed == 0 && ball.collision(two.x, two.y) && !playerOneHasBall && !twoRideRobot  ) {
    playerTwoHasBall = true;
    ball.x = two.x-10;
    ball.y = two.y+18;
  }
  if ( ball.speed < 0 && ball.collision(one.x, one.y) ) {
    if ( URF  && !twoRideRobot ) {
      playerTwoHasBall = true;
      ball.x = two.x-10;
      ball.y = two.y+18;
    } 
    else if ( ONEVSONE ) {
      one.out();
      roundOver = true;
      playerTwoWon++;
    }
  }
  if ( ball.speed > 0 && ball.collision(two.x, two.y)  ) {
    if ( URF && !oneRideRobot ) {
      playerOneHasBall = true;
      ball.x = one.x+13;
      ball.y = one.y+18;
    } 
    else if (ONEVSONE) {
      two.out();
      roundOver = true;
      playerOneWon++;
    }
  }

  if ( ( (oneRideRobot && one.collisionRobot(ball.x, ball.y) ) || (twoRideRobot && two.collisionRobot(ball.x, ball.y))) && ball.speed != 0 ) {
    if ( robotHealth > 0 ) {
      robotHealth--;
    }
  }
}

void resetMatch() {
  if ( visualTime == 0 ) {
    roundOver = true;
  }
  if ( roundOver ) {
    if ( numRound != 0 ) { //  ( Round 2 )
      if ( URF ) {
        oneRideRobot = false;
        twoRideRobot = false;
        one = new dodgePlayer(width/2-60, height/2-50, 3, loadImage(playerOneImage), 1);
        two = new dodgePlayer(width/2+5, height/2-50, 3, loadImage(playerTwoImage), 2);
        robotWally = new dodgePlayer(width/2-60, height-130, 1, loadImage(robotUrl), 0);
        ball = new dodgeBall(width/2, 80, 0, loadImage(dodgeBallUrl));
      } 
      else { // one versus one
        one = new dodgePlayer(20, (int)random(10, height-100), 3, loadImage(playerOneImage), 1);
        two = new dodgePlayer(545, (int)random(10, height-100), 3, loadImage(playerTwoImage), 2);
        ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBallUrl));
      }
    } 
    else {
      if ( URF ) { // initial game state ( Round 1 )
        oneRideRobot = false;
        twoRideRobot = false;
        one = new dodgePlayer(width/2-60, height/2-50, 3, loadImage(playerOneImage), 1);
        two = new dodgePlayer(width/2+5, height/2-50, 3, loadImage(playerTwoImage), 2);
        robotWally = new dodgePlayer(width/2-60, height-130, 1, loadImage(robotUrl), 0);
        ball = new dodgeBall(width/2, 80, 0, loadImage(dodgeBallUrl));
      } 
      else { // one versus one
        one = new dodgePlayer(20, 165, 3, loadImage(playerOneImage), 1);
        two = new dodgePlayer(545, 165, 3, loadImage(playerTwoImage), 2);
        ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBallUrl));
      }
    }
    restartTime = realTime;
    visualTime = remainingTime;
    numRound++;
    roundOver = false;
  }
}

void menuButton() {
  fill ( 92, 227, 236 );
  rect(0, 390, 90, 50, 10, 10, 10, 10);
  textSize(15);
  fill(76, 140, 250);
  text(" Main Menu ", 4, 420);
  if ( mouseX > 0 && mouseX < 90 && mouseY > 390 && mouseY < 440 ) {
    fill(255, 255, 0);
    rect(0, 390, 90, 50, 10, 10, 10, 10);
    textSize(15);
    fill(76, 140, 250);
    text(" Main Menu ", 4, 420 );

    if ( mousePressed && showHowToPlayImage ) {
      startUpScreen = true;
      showHowToPlayImage = false;
    } 
    else if ( mousePressed && gameOverScreen ) {
      startUpScreen = true;
      ONEVSONE = false;
      gameOverScreen = false;
      setRounds = true;
    }
  }
}


void setNumRounds() {
  background(0);
  fill(252, 255, 0);
  rect(width/6, height/3, 400, 40, 10, 10, 10, 10);
  textSize(25);
  fill(0);
  text("How Many Rounds? (click here) ", width/6+15, height/3+30);

  if ( mouseX > width/6 && mouseX < width/6+400 && mouseY > height/3 && mouseY < height/3+40 ) {
    fill(252, 255, 0);
    rect(width/6, height/3, 400, 40, 10, 10, 10, 10);
    textSize(25);
    fill(0);
    text("How Many Rounds? (click here) ", width/6+15, height/3+30);

    if ( mousePressed ) {
      clickSetRounds = true;
    }
  } 
  else if ( mousePressed ) {
    playerText = "";
    clickSetRounds = false;
  }

  if ( clickSetRounds ) {
    background(0);
    fill(252, 255, 0);
    rect(width/6, height/3, 400, 40, 10, 10, 10, 10);
    fill(0);
    textSize(33);
    text(playerText + ( frameCount % (10) == 0 ? " " : "|"), width/6+15, height/3+30);
  }
}
void chooseMode() {

  // One Versus One
  fill(92, 227, 236);
  rect(180, 50, 250, 50, 10, 10, 10, 10);
  textSize(30);
  fill(76, 140, 250);
  text("One Versus One", 195, 85);

  // Two Versus Two
  fill(92, 227, 236);
  rect(180, 120, 250, 50, 10, 10, 10, 10);
  textSize(30);
  fill(76, 140, 250);
  text("Ultra Rapid Fire", 188, 155);

  // Instructions
  fill(92, 227, 236);
  rect(180, 360, 250, 50, 10, 10, 10, 10);
  textSize(33);
  fill(260, 20, 20);
  text("HOW TO PLAY", 190, 400);

  //check if mouse hoover over the "One Versus One"
  if ( mouseX > 180 && mouseX < 430 && mouseY > 50 && mouseY < 100 ) {
    fill(117, 242, 253);
    rect(180, 50, 250, 50, 10, 10, 10, 10);
    textSize(30);
    fill(76, 140, 250);
    text("One Versus One", 195, 85);

    if ( mousePressed ) {
      restartTime = realTime;
      visualTime = remainingTime;
      ONEVSONE = true;
      startUpScreen = false;
    }
  } 
  else if ( mouseX > 180 && mouseX < 430 && mouseY > 120 && mouseY < 170 ) { // check if mouse hoover over the "Two Versus Two"
    fill(117, 242, 253);
    rect(180, 120, 250, 50, 10, 10, 10, 10);
    textSize(30);
    fill(76, 140, 250);
    text("Ultra Rapid Fire", 188, 155);

    if ( mousePressed ) {
      restartTime = realTime;
      visualTime = remainingTime;
      URF = true;
      startUpScreen = false;
    }
  } 
  else if ( mouseX > 180 && mouseX < 430 && mouseY > 360 && mouseY < 410 ) { // check if the mouse hoover over the "HOW TO PLAY"
    fill(117, 242, 253);
    rect(180, 360, 250, 50, 10, 10, 10, 10);
    textSize(33);
    fill(260, 20, 20);
    text("HOW TO PLAY", 190, 400);

    if ( mousePressed ) {
      startUpScreen = false;
      showHowToPlayImage = true;
    }
  }
}

void checkField() {
  if ( one.x < 20 ) {
    one.x = 20;
  }
  if ( two.x > 545 ) {
    two.x = 545;
  }
  if ( ball.x > 545 ) {
    ball.speed = 0;
    ball.x -= 130;
    if ( URF ) {
      if ( rapidFire ) {
        ball.speed = 25;
      }
      playerOneHasBall = true;
      ball.x = one.x+13;
      ball.y = one.y+18;
    }
  }
  if ( ball.x < 20  ) {
    ball.speed = 0;
    ball.x += 130;
    if ( URF ) {
      if ( rapidFire ) {
        ball.speed -= 25;
      }
      playerTwoHasBall = true;
      ball.x = two.x-10;
      ball.y = two.y+18;
    }
  }
}


void drawField() {

  stroke(255);
  strokeWeight(3);
  line(15, 30, width-15, 30); // the highest vertical line

  stroke(255);
  strokeWeight(3);
  line(15, height-30, width-15, height-30); // lowest vertical line


  stroke(255);
  strokeWeight(3);
  line(15, 30, 15, height-30); // the left line

  stroke(255);
  strokeWeight(3);
  line(width-15, 30, width-15, height-30); // the right line

  stroke(255);
  if ( ONEVSONE ) {
    fill(31, 183, 4);
  } 
  else if ( URF ) {
    fill(166, 166, 166);
  }
  rect(width/2-70, 10, 120, 70, 10);
  textSize(50);
  fill(242, 246, 2);
  text("0"+ visualTime, width/2-55, 55); // 61 Secs timer

  visualNumRound = numRound;

  if ( visualNumRound % 2 != 0 && (visualTime > 55) ) { // shows the number of rounds for 5 seconds
    textSize(13);
    text("Round " + numRound + " / " + maxRound, width/2-53, 75);
  } 
  else if ( visualTime < 25 ) {
    textSize(13);
    text("Round " + numRound + " / " + maxRound, width/2-53, 75);
  } 
  else if ( visualTime > 30 ) {
    if ( playerOneWon >= 10 ) {
      textSize(20);
      fill(67, 137, 181);
      text(" " + playerOneWon, width/2-58.5, 75);
    } 
    else {
      textSize(20);
      fill(67, 137, 181);
      text(" " + playerOneWon, width/2-54, 75);
    }
    if ( playerTwoWon >= 10 ) {
      textSize(20);
      fill(206, 161, 2);
      text(" " + playerTwoWon, width/2-3, 75);
    } 
    else {
      textSize(20);
      fill(206, 161, 2);
      text(" " + playerTwoWon, width/2+5, 75);
    }
  }
}

void keyPressed() {
  if ( (key == 'j' || key == 'J') ) {
    if ( playerOneHasBall && URF ) {
      ball.speed = 20;
      playerOneHasBall = false;
      rapidFire = true;
    } 
    if ( robotWally.collisionRobot(one.x, one.y) && !playerOneHasBall && URF ) {
      one = robotWally;
      oneRideRobot = true;
      robotHealth = 1000;
    }
    if ( ONEVSONE && playerOneHasBall ) {
      playerOneHasBall = false;
      ball.speed = 15;
    }
  }

  // no else if because the first player will have an advantage
  if ( key == '1' ) {
    if ( playerTwoHasBall && URF ) {
      ball.speed = -20;
      playerTwoHasball = false;
      rapidFire = true;
    }
    if ( robotWally.collisionRobot(two.x, two.y) && URF ) {
      two = robotWally;
      twoRideRobot = true;
      robotHealth = 1000;
    } 
    if ( ONEVSONE && playerTwoHasBall ) {
      playerTwoHasBall = false;
      ball.speed -= 15;
    }
  }

  if ( key == 'w' || key == 'W') {
    one.moveForward = true;
  } 
  else if ( key == 's' || key == 'S'   ) {
    one.moveBackward = true;
  } 
  else if ( key == 'a' || key == 'A' ) {
    one.moveLeft = true;
  } 
  else if ( key == 'd' || key == 'D'  ) {
    one.moveRight = true;
  } 
  else if (key == CODED ) {
    if ( keyCode == UP ) {
      two.moveForward = true;
    } 
    else if (keyCode == DOWN ) {
      two.moveBackward = true;
    } 
    else if ( keyCode == LEFT ) {
      two.moveLeft = true;
    } 
    else if ( keyCode == RIGHT ) {
      two.moveRight = true;
    }
  } 
  else if ( key >= '0' && key <= '9' && playerText.length() < 3 && clickSetRounds ) {
    playerText += ""+ key-48;
  } 
  else if ( key == BACKSPACE || key == DELETE && clickSetRounds ) {
    playerText = playerText.substring(0, playerText.length()-1);
  } 
  else if ( key == ENTER || key == RETURN && clickSetRounds ) {
    maxRound = int(playerText);
    if ( maxRound > 0 ) {
      setRounds = false;
      roundOver = true;
    }
  }
}

void keyReleased() {
  if ( key == 'w' || key == 'W') {
    one.moveForward = false;
  } 
  else if ( key == 's' || key == 'S'   ) {
    one.moveBackward = false;
  } 
  else if ( key == 'a' || key == 'A' ) {
    one.moveLeft = false;
  } 
  else if ( key == 'd' || key == 'D'  ) {
    one.moveRight = false;
  } 
  else if (key == CODED && keyCode == UP) {
    two.moveForward = false;
  } 
  else if (key == CODED && keyCode == DOWN ) {
    two.moveBackward = false;
  } 
  else if (key == CODED && keyCode == LEFT ) {
    two.moveLeft = false;
  } 
  else if (key == CODED && keyCode == RIGHT ) {
    two.moveRight = false;
  } 
  else if ( key == '1' && URF ) {
    rapidFire = false;
  } 
  else if ( ( key == 'j' || 'J' ) && URF ) {
    rapidFire = false;
  }
}


class dodgePlayer {
  int x; // x coordinate
  int y; // y coordinate
  int speed; // movement speed of the player
  PImage imagePlayer;
  int playerType;
  boolean moveForward = false;
  boolean moveBackward = false;
  boolean moveLeft = false;
  boolean moveRight = false;

  dodgePlayer(int leftOrRight, int upOrDown, int s, PImage pl, int type ) {
    x = leftOrRight;
    y = upOrDown;
    speed = s;
    imagePlayer = pl;
    playerType = type;
  }

  void display() {
    move();
    image(imagePlayer, x, y);
  }

  void move() {
    if ( moveForward && y > 10 ) {
      y -= speed;
    } 
    else if ( moveBackward && y < height-100 ) {
      y += speed;
    } 
    else if ( moveLeft) {
      x -= speed;
    } 
    else if ( moveRight) {
      x += speed;
    }
  }


  void out() {
    x = 1500;
    speed = 0;
  }

  boolean collisionRobot(int h, int v) {
    return ( h > x-imagePlayer.width+96 && h < x + imagePlayer.width && v > y - imagePlayer.height+108 && v < y + imagePlayer.height );
  }


  boolean headShot(int h, int v) {
    return ( h > x-imagePlayer.width+43 && h < x + imagePlayer.width-6 && v > y - imagePlayer.height+52 && v < y + imagePlayer.height-33);
  }
}

class dodgeBall {
  int x, y, speed;
  PImage imageBall;

  dodgeBall ( int hon, int vert, int s, PImage b ) {
    x = hon-25;
    y = vert-25;
    speed = s;
    imageBall = b;
  }

  void display() {
    x += speed;
    image(imageBall, x, y);
  }

  boolean collision(int h, int v) {
    return ( h > x - imageBall.width-5 && h < x + imageBall.width-5 && v > y - imageBall.height-5 && v < y + imageBall.height-5 );
  }
}

