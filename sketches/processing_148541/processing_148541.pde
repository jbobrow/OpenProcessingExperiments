
PImage startBackGround;
PImage gameOver;
dodgePlayer one;
dodgePlayer two;
dodgeBall ball;
boolean ONEVSONE = false;
boolean startUpScreen = true;
boolean restartVisualTime = true;
boolean roundOver;
boolean playerOneHasBall = false;
boolean playerTwoHasBall = false; 
int numPlayersAlive;
int realTime;
int remainingTime = 61;
int visualTime;
int reremainingTime = 0;
int timeRecord;
int maxRound = 5;
int numRound = 1;
String bg = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Crunchers_Dodgeball_800x600.jpg";
String playerOneImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Super_Dodge_Ball_player_big-2.png";
String playerTwoImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/player.png";
String dodgeBall = "http://i589.photobucket.com/albums/ss335/rumblefighter87/81203dff-8be2-4e74-b71f-4c856e21991b.png";
String gameOverImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/gameover.jpg";




void setup() {
  frameRate(60);
  size(600, 455);
  startBackGround = loadImage(bg);
  gameOver = loadImage(gameOverImage);
  one = new dodgePlayer(20, 165, 3, loadImage(playerOneImage), 1);
  two = new dodgePlayer(545, 165, 3, loadImage(playerTwoImage), 2);
  ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBall));
}

void draw() {
  // timer
  realTime = millis()/1000;
  visualTime = remainingTime - ( realTime - reremainingTime );

  if (startUpScreen) { // startUpScreen starts
    //load image background
    image(startBackGround, 0, 0);
    //choose mode
    chooseMode();
  }

  if ( ONEVSONE && !startUpScreen ) {
    drawField(); // the game field

      one.display(); // draw player one
    two.display(); // draw player two
    ball.display(); // draw the ball
    playerControls(); // controls of the player
    ballCollision(); // checks for ball collision between the ball and players
    resetGame(); // resets the game when the round is over
    checkField(); // checks the limits of the field for the ball
    isGameOver(); // checks if the game is over
  }
}

void isGameOver() {
  if ( numRound >= maxRound+1 ) {
    image(gameOver, -20, -25);
  } 
  else if ( visualTime == 0 ) {
    roundOver = true;
  }
}

void ballCollision() {
  if ( ball.speed == 0 ) {
    if ( ball.collision(one.x, one.y) ) {
      playerOneHasBall = true;
    } 
    else if ( ball.collision(two.x, two.y) ) {
      playerTwoHasBall = true;
    }
  } 
  else if ( ball.speed < 0 && ball.collision(one.x, one.y) ) {
    one.out();
    roundOver = true;
  } 
  else if ( ball.speed > 0 && ball.collision(two.x, two.y)) {
    two.out(); 
    roundOver = true;
  }
}

void resetGame() {
  if ( roundOver == true ) {
    one = new dodgePlayer(20, (int)random(10, height-100), 3, loadImage(playerOneImage), 1);
    two = new dodgePlayer(545, (int)random(10, height-100), 3, loadImage(playerTwoImage), 2);
    ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBall));
    reremainingTime = realTime;
    visualTime = remainingTime;
    numRound++;
    roundOver = false;
  }
}

void chooseMode() {
  // One Versus One
  fill(92, 227, 236);
  rect(180, 50, 250, 50, 10, 10, 10, 10);
  textSize(30);
  fill(76, 140, 250);
  text("One Versus One", 188, 85);

  // Two Versus Two
  fill(92, 227, 236);
  rect(180, 120, 250, 50, 10, 10, 10, 10);
  textSize(30);
  fill(76, 140, 250);
  text("Two Versus Two", 188, 155);

  // Instructions
  fill(92, 227, 236);
  rect(180, 360, 250, 50, 10, 10, 10, 10);
  textSize(33);
  fill(260, 20, 20);
  text("HOW TO PLAY", 193, 400);

  //check if mouse hoover over the "One Versus One"
  if ( mouseX > 180 && mouseX < 430 && mouseY > 50 && mouseY < 100 ) {
    fill(117, 242, 253);
    rect(180, 50, 250, 50, 10, 10, 10, 10);
    textSize(30);
    fill(76, 140, 250);
    text("One Versus One", 188, 85);

    if ( mousePressed ) {
      reremainingTime = realTime;
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
    text("Two Versus Two", 188, 155);
  } 
  else if ( mouseX > 180 && mouseX < 430 && mouseY > 360 && mouseY < 410 ) { // check if the mouse hoover over the "HOW TO PLAY"
    fill(117, 242, 253);
    rect(180, 360, 250, 50, 10, 10, 10, 10);
    textSize(33);
    fill(260, 20, 20);
    text("HOW TO PLAY", 193, 400);
  }
}

void checkField() {
  if ( ball.x > width-45 ) {
    ball.x -= 150;
    ball.speed = 0;
  } 
  else if ( ball.x < 5 ) {
    ball.x += 150;
    ball.speed = 0;
  }
}

void drawField() {
  background(31, 183, 4);
  strokeWeight(3);
  line(15, 30, width-15, 30); // the highest vertical line
  strokeWeight(3);
  line(15, height-30, width-15, height-30);
  strokeWeight(5);
  line(290, 70, 290, height-32); // the middle line that separates the field
  stroke(255);
  strokeWeight(3);
  line(15, 30, 15, height-30); // the left line
  stroke(255);
  strokeWeight(3);
  line(width-15, 30, width-15, height-30); // the right line
  stroke(255);
  fill(31, 183, 4);
  rect(width/2-70, 10, 120, 70, 10);
  textSize(45);
  fill(242, 246, 2);
  text("0"+ (int)(visualTime), width/2-55, 50); // 61 Secs timer
  textSize(15);
  text("Round " +numRound + " / " + maxRound, width/2-55, 70);
}

void playerControls() {
  if ( keyPressed == true && one.playerType == 1 ) {
    if ( key == 'w' && one.y > 10 ) {
      one.y -= one.speed;
    } 
    else if ( key == 's' && one.y < height-100   ) {
      one.y += one.speed;
    } 
    else if ( key == 'a' && one.x > 20 ) {
      one.x -= one.speed;
    } 
    else if ( key == 'd' && one.x < 250  ) {
      one.x += one.speed;
    } 
    else if ( key == 'x' && playerOneHasBall == true ) {
      playerOneHasBall = false;
      ball.speed = 15;
      timeRecord = visualTime;
    }
  }
  if ( keyPressed == true && two.playerType == 2) {
    if ( keyCode == UP && two.y > 10 ) {
      two.y -= two.speed;
    } 
    else if ( keyCode == DOWN && two.y < height-100   ) {
      two.y += two.speed;
    } 
    else if ( keyCode == LEFT && two.x > 294 ) {
      two.x -= two.speed;
    } 
    else if ( keyCode == RIGHT && two.x < 545  ) {
      two.x += two.speed;
    } 
    else if ( key == '1' && playerTwoHasBall == true ) {
      playerTwoHasBall = false;
      ball.speed = -15;
      timeRecord = visualTime;
    }
  }
}

class dodgePlayer {
  int x; // x coordinate
  int y; // y coordinate
  int speed; // movement speed of the player
  PImage imagePlayer;
  int playerType;

  dodgePlayer(int leftOrRight, int upOrDown, int s, PImage pl, int type ) {
    x = leftOrRight;
    y = upOrDown;
    speed = s;
    imagePlayer = pl;
    playerType = type;
  }

  void display() {
    image(imagePlayer, x, y);
    if ( playerOneHasBall == true ) {

      ball.x = x+13;
      ball.y = y+18;
    } 
    else if ( playerTwoHasBall == true ) {

      ball.x = x-10;
      ball.y = y+18;
    }
  }

  void out() {
    x = 1500;
    speed = 0;
  }
}

class dodgeBall {
  int x;
  int y;
  int speed;
  PImage imageBall;

  dodgeBall ( int leftOrRight, int upOrDown, int s, PImage b ) {
    x = leftOrRight-25;
    y = upOrDown-25;
    speed = s;
    imageBall = b;
  }

  void display() {
    move();
    image(imageBall, x, y);
  }

  void move() {
    x += speed;
  }



  boolean collision(int h, int v) {
    return ( h > x - imageBall.width-5 && h < x + imageBall.width-5 && v > y - imageBall.height-5 && v < y + imageBall.height-5 );
  }
}

