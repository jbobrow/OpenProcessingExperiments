
import processing.video.*;
import java.awt.Rectangle;
Capture video;
PShape ballBoundary, paddle1Boundary, paddle2Boundary;
PFont taraFont;
PImage previousFrame;
int i;
int ballX, ballY;
int playerScore, computerScore;
int paddleHeight = 50;
int paddleWidth = 5;
int paddleSpeed = 3;
int arrowKeySpeed = 3;
int dividingLineWidth = 3;
int dividingLineHeight = 10;
int ballSize = 10;
int buttonSize = 150;
int postBounceAngle = 5;
int paddle1X, paddle1Y, paddle2X, paddle2Y;
int pixelCount_top;
int pixelCount_bottom;
int pixVidBeginW, pixVidEndW, pixVidBeginH, pixVidEndH, pixVidMidH;
float directionX, directionY;
float previousPaddle1Y, previousPaddle2Y;
float attentionSpan = 0.5;
float filterThreshold = 0.5;
float percentOfVidPixels = 0;
float threshold = 50;
boolean beginGame;


void setup() {
  //PREFERENCES
  size(640, 480);


  //GAME'S INITIAL VALUES
  ballX = width/2;
  ballY = height/2;
  directionX = 1;
  directionY = 0;
  paddle1X = 0;
  paddle2X = width-paddleWidth;

  //SET UP WEBCAM
  video = new Capture(this, width, height/4*2, 30);
  previousFrame = createImage(video.width, video.height, RGB);
  video.start();

  //INITIALIZING VARIABLES FOR USE WITH FRAME DIFFERENCING
  pixVidBeginW = video.width/14*9;
  pixVidEndW = video.width/14*13;
  pixVidBeginH = video.height/16;
  pixVidEndH = video.height;
  pixVidMidH = video.height/2;

  //FONT
  taraFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(taraFont);
}


/*********************************************
 DRAW
 *********************************************/

void draw() {

  //DESIGN
  background(0); 
  fill(255);

  /*********************************************
   START-UP MENU
   *********************************************/

  //DISPLAY MENU
  if (beginGame==false) {

    //TEXT ON START-UP MENU
    text("Pong 2014", width/20, height/4);
    text("Press 'b' to begin", width/20, height/4*2);
    text("Press 'r' to restart", width/20, height/4*3);
  }


  //IF PLAYER HAS PRESSED B START GAME
  if (beginGame == true) {


    /*********************************************
     GAME SETUP
     *********************************************/


    //DRAW DIVIDING MIDDLE LINE
    for (i = height/8; i <= height/8*7; i+= 20) {
      rect(width/2, i, dividingLineWidth, dividingLineHeight);
    }


    //TEXT TO DISPLAY SCORES
    text(playerScore, (width/10)*4, height/4);
    text(computerScore, (width/10)*5.5, height/4);


    //INITIALIZING VARIABLES
    ballX += directionX * 2.0;
    //CONSTRAIN BALL'S STARTING-POSITION Y-COORDINATE TO AVOID GETTING STUCK AT TOP OR BOTTOM
    ballY = constrain(ballY +=directionY, ballSize, height-ballSize);
    //ASSIGN VALUE TO PREVIOUS PADDLE VARIABLE FOR USE WITH BOUNDING BOX INTERSECTION
    previousPaddle2Y = paddle2Y;
    previousPaddle1Y = paddle1Y;
    //PIXEL COUNT FOR FRAME DIFFERENCING
    pixelCount_top = 0;
    pixelCount_bottom = 0;




    /*********************************************
     VIDEO CAPTURE AND DISPLAY
     *********************************************/


    //BEGIN VIDEO CAPTURE
    if (video.available()) {
      //SAVE PREVIOUS FRAME FOR COMPARISON
      previousFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); 
      previousFrame.updatePixels();
      video.read();
    }

    loadPixels();
    video.loadPixels();
    previousFrame.loadPixels();




    /*********************************************
     PLAYER CONTROLS - USE OF CAMERA - FRAME DIFFERENCING
     *********************************************/


    //ANALYSING PIXELS IN TOP HALF OF VIDEO DISPLAYED ON SCREEN
    for (int x = pixVidBeginW; x < pixVidEndW; x ++ ) {
      for (int y = pixVidBeginH; y < pixVidMidH; y ++ ) {


        //PIXEL LOCATION
        int loc = x + y*video.width;   
        //PIXEL COLOUR
        color current = video.pixels[loc]; 
        //PREVIOUS COLOUR
        color previous = previousFrame.pixels[loc]; 


        //COMPARE PREVIOUS AND CURRENT COLOUR
        float r1 = red(current); 
        float g1 = green(current); 
        float b1 = blue(current);
        float r2 = red(previous); 
        float g2 = green(previous); 
        float b2 = blue(previous);
        float diff = dist(r1, g1, b1, r2, g2, b2);


        //IF COLOUR HAS CHANGED, THERE IS MOTION
        if (diff > threshold) { 
          //IF MOTION IN TOP HALF OF VIDEO, DISPLAY MOVEMENT AS BLACK, INCREMENT TOP HALF'S PIXEL COUNT VARIABLE, DECREMENT BOTTOM HALF'S PIXEL COUNT VARIABLE
          //THIS PREVENTS THE USER'S SHOULDER MOVEMENT IN BOTTOM HALF OF VIDEO FROM INTERFERING WITH PADDLE MOVEMENT WHEN USER'S HAND IS IN TOP HALF OF VIDEO
          pixels[loc] = color(0);
          pixelCount_top +=1;
          pixelCount_bottom -=1;
        } 
        else {
          //IF NO MOTION DISPLAY WHITE (PADDLE DOES NOT MOVE IF NO MOTION SHOWN IN BOTH TOP AND BOTTOM OF VIDEO DISPLAY)
          pixels[loc] = color(255);
        }
      }
    }


    //ANALYSING PIXELS IN BOTTOM HALF OF VIDEO DISPLAYED ON SCREEN
    for (int x = pixVidBeginW; x < pixVidEndW; x ++ ) {
      for (int y = pixVidMidH; y < pixVidEndH; y ++ ) {

        int loc = x + y*video.width;
        color current = video.pixels[loc];      
        color previous = previousFrame.pixels[loc]; 


        float r1 = red(current); 
        float g1 = green(current); 
        float b1 = blue(current);
        float r2 = red(previous); 
        float g2 = green(previous); 
        float b2 = blue(previous);
        float diff = dist(r1, g1, b1, r2, g2, b2);


        if (diff > threshold) { 

          pixels[loc] = color(0);
          pixelCount_bottom +=1;
          pixelCount_top -=1;
        } 
        else {

          pixels[loc] = color(255);
        }
      }
    }


    updatePixels();


    //IF OVER 0% OF TOP HALF OF VIDEO'S PIXELS DISPLAY MOTION, MOVE PLAYER'S PADDLE UPWARDS
    if (pixelCount_top > percentOfVidPixels * video.pixels.length) {
      paddle1Y  = constrain(paddle1Y -=paddleSpeed, 0, height-paddleHeight);
    }

    //IF OVER 0% OF BOTTOM HALF OF VIDEO'S PIXELS DISPLAY MOTION, MOVE PLAYER'S PADDLE DOWNWARDS
    if (pixelCount_bottom > percentOfVidPixels * video.pixels.length) {
      paddle1Y  = constrain(paddle1Y +=paddleSpeed, 0, height-paddleHeight);
    }



    /*********************************************
     PLAYER CONTROLS - USE OF ARROW KEYS
     *********************************************/


    //CONTROLLING THE PLAYER'S MOVEMENT WITH KEYS
    if (keyPressed) { 
      if (keyCode == UP) {
        paddle1Y  = constrain(paddle1Y -=arrowKeySpeed, 0, height-paddleHeight);
      }

      if (keyCode == DOWN) {
        paddle1Y = constrain(paddle1Y +=arrowKeySpeed, 0, height -paddleHeight);
      }
    }


    /*********************************************
     COMPUTER'S MOVEMENT
     *********************************************/


    //THE COMPUTER'S STRATEGY
    float newRandom = random(0, 1);

    //COMPUTER PAYS ATTENTION HALF OF THE TIME
    if (newRandom < attentionSpan) {
      if (directionX != -1) {
        if (paddle2Y > ballY) {  
          paddle2Y = constrain(paddle2Y -=paddleSpeed, 0, height-paddleHeight);
        } 
        else {
          paddle2Y = constrain(paddle2Y +=paddleSpeed, 0, height-paddleHeight);
        }
      }
    }



    /*********************************************
     OBJECTS AND THEIR BOUNDING BOXES
     *********************************************/


    //PADDLE ONE AND BOUNDING BOX
    rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
    Rectangle paddle1Boundary = new Rectangle(paddle1X, paddle1Y, paddleWidth, paddleHeight);

    //PADDLE TWO AND BOUNDING BOX
    rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);
    Rectangle paddle2Boundary = new Rectangle(paddle2X, paddle2Y, paddleWidth, paddleHeight);

    //BALL AND  BOUNDING BOX
    Rectangle ballBoundary = new Rectangle(ballX, ballY, ballSize, ballSize);
    rect(ballX, ballY, ballSize, ballSize);



    /*********************************************
     BOUNDING BOX INTERSECTION
     *********************************************/


    //IF BALL HITS OFF PADDLE BOUNCE BACK
    if (ballBoundary.intersects(paddle1Boundary)) {
      //CHANGE DIRECTION
      directionX *= -1;
      //IF PADDLE MOVES
      if (paddle1Y != previousPaddle1Y);
      {
        //ANGLE OF BALL-DIRECTION CHANGES
        directionY = (paddle1Y - previousPaddle1Y)/2.0;
        if (directionY > postBounceAngle) {
          directionY = postBounceAngle;
        }
        if (directionY < -postBounceAngle) {
          directionY = -postBounceAngle;
        }
      }
    }

    if (ballBoundary.intersects(paddle2Boundary)) {
      directionX *= -1;

      if (paddle2Y != previousPaddle2Y) {
        directionY = (paddle2Y - previousPaddle2Y)/2.0;
        if (directionY > postBounceAngle) {
          directionY = postBounceAngle;
        }
        if (directionY < -postBounceAngle) {
          directionY = -postBounceAngle;
        }
      }
    }


    /*********************************************
     KEEPING BALL WITHIN SCREEN BOUNDARY
     *********************************************/


    //IF THE BALL GOES OUTSIDE THE BOUNDS, SERVE AGAIN
    if (ballX > width + ballSize/2) {
      //INCREMENT USER SCORE
      playerScore +=1;
      //BEGIN AT CENTREPOINT
      ballX = width/2;
      //CONSTRAIN Y COORDINATE TO AVOID GETTING STUCK AT TOP OR BOTTOM OF SCREEN
      ballY = floor(random(ballSize, height-ballSize));
      directionY = 0;
    }

    if (ballX < 0) {
      computerScore +=1;
      ballX = width/2;
      ballY = floor(random(ballSize, height-ballSize));
      directionY = 0;
    }


    //IF BALL HITS TOP OR BOTTOM BOUNCE BACK/CHANGE DIRECTION
    if (ballY >= height-ballSize) {

      directionY = directionY *= -1;
    }

    if (ballY <= ballSize) {

      directionY = directionY *= -1;
    }




    /*********************************************
     INCREMENTING SCORE
     *********************************************/

    if (ballX > width+ballSize/2) {
      playerScore += 1;
    }

    if (ballX < 0) {
      computerScore +=1;
    }
  }
}


/*********************************************
 DEALING WITH BEGIN AND RESTART BUTTONS
 *********************************************/

void keyPressed() {

  //BEGIN BUTTON
  if (key == 'b' || key == 'B') {
    beginGame = true;
  }

  //RESTART BUTTON
  if (key == 'r' || key == 'R') {
    //RETURN  BALL-COORDINATE AND SCORE VARIABLES TO INITIAL VALUES
    playerScore =0;
    computerScore=0;
    ballX = width/2;
    ballY = height/2;
    directionX = 1;
    directionY = 0;
  }
}



