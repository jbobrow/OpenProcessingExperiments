
int cols = 600;
int rows = 600;
int i, j;

float pi = 3.14;

// for ball
float ballX = 300;
float ballY = 300;
int ballRadius = 20;
// for making ball move
float speed = 2;
float directionX = 1;
float directionY = 1;
// for calculating distance
float longestDistance, shortestDistance; 
float distance1, distance2;
// for paddles
int paddle1X; 
int paddle2X;
int paddleY;

// Declare pixel Array
int[][] pixelRed = new int[cols][rows];
int[][] pixelGreen = new int[cols][rows];
int[][] pixelBlue = new int[cols][rows];

void setup() {
  size (600, 600);

  // distances between paddle and ball  
  longestDistance = sqrt(50*50 + 30*30);
  shortestDistance = 15;

  // Initialize pixel RGB values
  for (j = 0; j < cols; j++) {
    for (i = 0; i < rows; i++) {
      pixelRed[i][j] = 255;
      pixelGreen[i][j] = i/3;
      pixelBlue[i][j] = j/3;
    }
  }

  //Draw background gradience
  for (i = 0; i < cols; i++) {
    for (j = 0; j < rows; j++) {
      fill(0, pixelGreen[i][j]/3, pixelBlue[i][j]/3);
      noStroke();
      ellipse(i, j, 20, 20);
    }
  }

  //background(0);
}

void draw () {
  /* draws ball
   fill(255);
   noStroke();
   ellipse(ballX, ballY, ballRadius*2, ballRadius*2); */

  // draws gradience based on ball location
  if (ballY > 0 && ballY < cols && ballX > 0 && ballX < rows) {
    i = int(ballX);
    j = int(ballY);
    fill(pixelRed[i][j], pixelGreen[i][j], pixelBlue[i][j]);
    noStroke();
    ellipse(i, j, ballRadius*2, ballRadius*2);
  }  

  fill(255, 255, 255, 5);
  noStroke();
  ellipse(ballX, ballY, ballRadius*2, ballRadius*2); 

  move(); // make ball move

    noStroke();
  fill(0);
  rect(0, 0, 20, 1200); // cover left paddle trail
  fill(0, 66, 37);
  rect(cols, 0, 20, 1200); // cover right paddle trail

  // draws paddles
  fill(255);
  noStroke();
  paddleY = mouseY;
  paddle1X = 0;
  paddle2X = width;
  rectMode(CENTER);
  rect(paddle1X, paddleY, 20, 100); // left paddle
  rect(paddle2X, paddleY, 20, 100); // right paddle

  bounce(); // make ball bounce
}

/******************************* Functions */
// function make ball move
void move () {
  if (!mousePressed) {
    ballX = ballX + speed * directionX;
    //ballY = ballY + (pow(speed, 4) * directionY);
    ballY = ballY + speed * directionY;
  } else {
    //ballY = ballY + speed * directionY;
    //ballY = ballY + (sin(speed*2) * directionY);

    //ballY = ballY + (pow(speed, 2) * directionY);
    ballX = ballX + speed;

    ballY = ballY + (pow(speed, 2) * directionY);
    // fill(255,0,0);
    // ellipse(i, j, 40, 40);
  }
}

// function make ball bounce
void bounce () {  
  // distances between paddle and ball
  distance1 = sqrt((paddleY - ballY) * (paddleY - ballY) + (paddle1X - ballX) * (paddle1X - ballX));
  distance2 = sqrt((paddleY - ballY) * (paddleY - ballY) + (paddle2X - ballX) * (paddle2X - ballX));

  // ball bounce if hit top or bottom of screen
  if (ballY < 0+20 || ballY > height-20) {
    directionY = directionY * -1 + random(-.3, .3);
  }
  // ball bounce if touch paddles
  else if (distance1 <= longestDistance || distance2 <= longestDistance) { 
    if (ballX == 30 || ballX == width - 30) {
      directionX = directionX * -1; 
      directionY = directionY + random(-.3, .3); 
      //counter++;
    }
  }
}

// void mousePressed() {
//   ballY = ballY + (pow(speed, 5) * directionY);
// }


