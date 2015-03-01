
/*///////////////////////////////////////////////////////////////
 ** Assignment 2: Interactive Tow
 ** Trampoline Coin Bounce by Gabrielle Harte
/*///////////////////////////////////////////////////////////////


//Points variable
int points=0;


//Cloud Variables
float cloudX = random(0, 300);
float cloudY = random(0, 300);

float cloud2X = random(0, 300);
float cloud2Y = random(0, 300);

float cloud3X = random(0, 300);
float cloud3Y = random(0, 300);

//Coin Variables
float coinX = 0;
float coinY = 100;
float coinSpeed = 1;

//Player Variables
float playerX = 100 ;
float playerY = 0 ;
float playerSpeed = 0;

float gravity= .05;


///////////////////////////////////////////
// SETUP
///////////////////////////////////////////

void setup() {
  frameRate(60);
  size(400, 400);
  background(100, 180, 250);
}

///////////////////////////////////////////
//DRAW
///////////////////////////////////////////

void draw() {
  noStroke();

  background(100, 180, 250);

  drawGrass();
  drawClouds();
  drawTrampoline();
  drawCoin();
  drawPlayer();
  drawFont();
}

//draws Grass
void drawGrass() {
  fill (50, 100, 40);
  rect (0, 360, 400, 400);
}


//draws Clouds
void drawClouds() {
  fill(255);
  ellipseMode(CENTER);

  //cloud 1
  ellipse(cloudX, cloudY, 90, 40);
  ellipse(cloudX-30, cloudY+10, 60, 40);
  ellipse(cloudX-10, cloudY-10, 50, 50);

  //Cloud 2
  ellipse(cloud2X, cloud2Y, 90, 40);
  ellipse(cloud2X-30, cloud2Y+10, 60, 40);
  ellipse(cloud2X-10, cloud2Y-10, 50, 50);

  //Cloud 3
  ellipse(cloud3X, cloud3Y, 90, 40);
  ellipse(cloud3X-30, cloud3Y+10, 60, 40);
  ellipse(cloud3X-10, cloud3Y-10, 50, 50);


  //make X speeed of clouds slow 
  cloudX = cloudX + random(-0.1);
  cloud2X = cloud2X - random(-0.1);
  cloud3X = cloud3X + random(-0.1);
}


//draws trampoline
void drawTrampoline() {
  ellipseMode(CORNERS);
  fill(20);
  ellipse(50, 380, 350, 350);

  //trampoline legs
  rect(80, 370, 10, 100);
  rect(320, 370, 10, 100);
}

//draws coin
void drawCoin() {
  ellipseMode(CENTER);
  fill(240, 230, 90);
  ellipse(coinX, coinY, 30, 40);

  //have the coin move on the X axis
  coinX = coinX + coinSpeed;

  //when the coin reaches 400, put back to zero
  if ((coinX > width) || (coinX < 0)) {
    coinX = 0;
    coinY = random(70, 300);
  }

  // When coin collected,  change coinX position to - 50 and
  //increase points by 1
  if ((coinY > playerY && coinY < playerY+30 && coinX > playerX && coinX < playerX+30)) {
    points = points + 1;
    coinX = -100;
    coinSpeed = coinSpeed + 0.1;
  }
}
//draw player
void drawPlayer() {
  fill(200, 75, 20);
  rect (playerX, playerY, 20, 20); 


  //add speed to player
  playerY= playerY + playerSpeed;

  //add gravity
  playerSpeed = playerSpeed + gravity;


  //keep player inside screen
  playerX=constrain(playerX, 0, 380);
  playerY=constrain(playerY, 0, 400);


  //when player hits trampoline, reverse speed
  if (playerY > height/1.2) {
    playerSpeed = playerSpeed  -.9999;
  }


  //draw player movement with key pressed
  if (keyPressed) {
    if (keyCode == LEFT) {
      playerX-=5;
    } else if (keyCode == RIGHT) {
      playerX+=5;
    }
  }
}
void drawFont() {
  //Show points with text
  textSize(20);
  fill(0);
  text ("SCORE:"+points, 20, 20);


  //Display movement instructions
  textSize(13);
  text("Move with left and right arrows", 200, 40);
}

