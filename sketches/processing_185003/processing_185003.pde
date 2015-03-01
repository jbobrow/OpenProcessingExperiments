



import processing.video.*;
PFont font;

  // Variable for capture device
Capture video;

  // A variable for the colour tracking
color trackColor; 

boolean keypress = false;

  // left paddle variables (computer)
int leftPaddleX = 5;
int leftPaddleY = 250;
int leftPaddleW = 15;
int leftPaddleH = 90;
int speedLeftPaddleY = 3;

  // right paddle variables (player)
int rightPaddleX = 780;
int rightPaddleY = 80;
int rightPaddleW = 15;
int rightPaddleH = 90;

  // ball variables
float ballX = 400;
float ballY = 300;
int ballW = 15;
int dirX = 0;
int dirY = 0;

  //score variables
  //set the score for left (computer)
int score1 = 0;
  // set the score for right (player)
int score2 = 0;

  //setup 
void setup() {
  size(800, 600);
  

  
  video = new Capture(this, width, height);
  video.start();

  // Start off tracking for red
  trackColor = color(255, 0, 0);
  smooth();

  // load font
  PFont font;
  font = loadFont("Monospaced.bold-48.vlw");
  textFont (font, 30);
}

void draw() {
  // Capture and display the video
  if (video.available()) {
    video.read();
  }
  
  image(video, 0, 0);
   //flip video on horizontal axis
  // pushMatrix();
  // scale(-1.0, 1.0);
  // image(video,-video.width,0);
  // popMatrix();
 
  ball();
  leftPaddle();
  rightPaddle();
  stroke(0);
  line(width/2, 0, width/2, height);
  fill(255);
  
  //display the score
  text(score1, width/2 - 300, 30);
  text(score2, width/2 + 300, 30);
  

  text("Click on a marker to lock to colour", 20, 570,10);
  text("then hit 'enter' to start", 60, 590,10);
  

}


    
//Left Paddle.............................................................................
void leftPaddle() {
  fill(255);
  rect(leftPaddleX, leftPaddleY, leftPaddleW, leftPaddleH);

  if (leftPaddleY + leftPaddleH /2 < ballY) {
    leftPaddleY += speedLeftPaddleY;
  }

  if (leftPaddleY + leftPaddleH /2 > ballY) {
    leftPaddleY -= speedLeftPaddleY;
  }
}
//Right Paddle.............................................................................

void rightPaddle() {
  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
 int loc = (video.width - x - 1) + y*video.width;  // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // dist() function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // Draw paddle at the tracked y pixel
  rightPaddleY = closestY;
  fill(255);
  rect(rightPaddleX, closestY, rightPaddleW, rightPaddleH);
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}
void keyPressed() {
  dirX = 4;
    dirY = 4;

if ( key == ENTER) {

      keypress = !keypress;
    }
}
//BALL..................................................................................
void ball() {
  ellipse(ballX, ballY, ballW, ballW);
  ballX += dirX;
  ballY += dirY;

  // rebound the ball from top and bottom sides
  if (ballX > width) {
    dirX *= -1;
  }

  if (ballX < 0) {
    dirX *= -1;
  }

  if (ballY > height) {
    dirY *= -1;
  }

  if (ballY < 0) {
    dirY *= -1;
  }

  //reverse direction of the ball from right paddle
  if (ballX > rightPaddleX - rightPaddleW && ballX < rightPaddleX && ballY < rightPaddleY + rightPaddleH && ballY > rightPaddleY) {
    dirX *= -1;

  }
  //reverse direction of the ball from left paddle
  if (ballX < leftPaddleX + 2 * leftPaddleW && ballX > leftPaddleX && ballY < leftPaddleY + leftPaddleH && ballY > leftPaddleY) {
    dirX *= -1;
  }

  // scoring
  if (ballX < 0) {
    // when ball hits left wall, right player scores point 
    score2 ++;
    //    background(0,0,0,255);
    //    text("ready?", width/2,height/2);
    //    fill(255);
    
    // 1 second delay after point is scored
    delay(1000);
    
    //set ball off again from centre random point
    ballX = width/2;
    ballY = random(height);
  }

  if (ballX > width) {
    // when ball hits right wall, left player scores point 
    score1 ++;
    //         background(0,0,0,255);
    //         text("ready?", width/2,height/2);
    //         fill(255);
    delay(1000);

    //set ball off again from centre random point
    ballX = width/2;
    ballY = random(height);
  }
  
  // if player scores 5 points 
  if (score2 == 5) {
    background(0);
    text("YOU WIN", width/2, height/2);
    fill(255);
  }

  // if player concedes 5 points
  if (score1 == 5) {
    background(0);

    text("YOU LOSE", width/2, height/2);
    fill(255);
  }
}



