
int boardSize = 500;

int padWidth = 100 ;
int padHeight = 5 ;

int offsetX = 0 ;
int offsetY = 0 ;

int ballX = 0;
int ballY = 0;

int ballSize = 26 ;

int ballMaxX = 0;
int ballMaxY = 0;
int ballMinX = 0;
int ballMinY = 0;

float ballAngle = 0;
float speedX = random (0.30, 0.5);
float speedY = random (0.10, 0.25);

int countdown = 3;
int countdownSize = 100;

int score = 0;
int time = 10;
int level = 1;

//Comment maxim js for openprocessing - NO SOUND
//Maxim maxim;
//AudioPlayer player, player2, player3;

void setup() {
  size (500, 500);

  ballX = width/2;
  ballY = height/2;
  ballMaxX = width - ballSize/2 - padHeight;
  ballMaxY = height - ballSize/2 - padHeight;
  ballMinX = ballSize/2 + padHeight;
  ballMinY = ballSize/2 + padHeight;

//Comment maxim js for openprocessing - NO SOUND

//  maxim = new Maxim(this);
//  player = maxim.loadFile("start.wav");
//  player2 = maxim.loadFile("score.wav");
//  player3 = maxim.loadFile("gameend.wav");

//  player.setLooping(false);
//  player2.setLooping(false);

  frameRate(1);
}
void endGame() {

  fill (255, 255, 0);
  ellipse (ballX, ballY, ballSize, ballSize);
  
//Comment maxim js for openprocessing - NO SOUND
 
//  player3.play();

  textSize(50);
  textAlign(CENTER);

  text("Final Score: " + score, width/2, height/2);
  if (mousePressed())
    exit();
}
void checkBounds () {
  if (ballX >= ballMaxX || ballX <= ballMinX) {

    if ( ballY < (int) (height/2 - padWidth/2 + offsetY) || ballY > (int) (height/2 + padWidth/2 + offsetY)) {
      endGame();
    }

    speedX = -speedX;
    score += 10;

//Comment maxim js for openprocessing - NO SOUND

//    player2.stop();
//    player2.cue(0);
//    player2.play();
  }

  if (ballY >= ballMaxY || ballY <= ballMinY) {

    if ( ballX < (int) (width/2 - padWidth/2 + offsetX) || ballX > (int) (width/2 + padWidth/2 + offsetX)) {
      endGame();
    }

    else {
      speedY = -speedY;
      score += 10;

//Comment maxim js for openprocessing - NO SOUND
      
//      player2.stop();  
//      player2.cue(0);
//      player2.play();
    }
  }
}

void drawBall() {
  fill (255, 255, 0);
  ballX += speedX * (1 + .25 * (level-1)) * time ;
  ballY += speedY * (1 + .25 * (level-1)) * time ; 
  ellipse (ballX, ballY, ballSize, ballSize);
}

void drawTextArea () {
  textSize(25);
  fill (0, 255, 0);
  text("Level: "+ level, 100, 25);  
  text("Score: "+ score, 350, 25);
}
void mouseClicked() {
}
void draw() {
  background(0);

  if (countdown > 0)
  {
    if (countdown == 3)
      fill (255, 0, 0);

    if (countdown == 2)
      fill (255, 255, 0);

    if (countdown == 1)
      fill (0, 255, 0);

    textSize(countdownSize);
    textAlign(CENTER);
    text(countdown, width/2, height/2);
    countdown--;
    
//Comment maxim js for openprocessing - NO SOUND
    
//    player.cue(0);
//    player.play();
  }
  else 
  {
    frameRate(60);
    drawPads();
    drawBall();
    checkBounds();
    drawTextArea();
    checkSpeed();
  }
}

void checkSpeed() {
  if (score > 100)
    level = 2;
  if (score > 200)
    level = 3;
  if (score > 300)
    level = 4;
  if (score > 400)
    level = 5;
}
void drawPads () {
  if (mouseX < padWidth/2  ) {
    offsetX = padWidth/2 - width/2;
  }
  if (mouseX > width - padWidth/2) {
    offsetX = width/2 - padWidth/2 ;
  }

  if (mouseX >= padWidth/2 && mouseX <=width - padWidth/2 )
  {
    offsetX = (int) map (mouseX, padWidth/2, width - padWidth/2, padWidth/2 - width/2, width/2- padWidth/2);
  }

  if (mouseY < padWidth/2  ) {
    offsetY = padWidth/2 - height/2;
  }
  if (mouseY > height - padWidth/2) {
    offsetY = height/2 - padWidth/2 ;
  }

  if (mouseY >= padWidth/2 && mouseY <=height - padWidth/2 )
  {
    offsetY = (int) map (mouseY, padWidth/2, height - padWidth/2, padWidth/2 - height/2, height/2- padWidth/2);
  }

  fill (255, 255, 255);

  //X pads
  rect (width/2 - padWidth/2 + offsetX, 0, padWidth, padHeight );
  rect (width/2 - padWidth/2 + offsetX, height-padHeight, padWidth, padHeight );

  //Y pads
  rect (0, height/2 - padWidth/2 + offsetY, padHeight, padWidth );
  rect (width - padHeight, height/2 - padWidth/2 + offsetY, padHeight, padWidth );
}

