
/**
 * Synthesis 2: Input and Response
 * Tennis by Casey Reas (www.processing.org)
 * 
 */

//
//Maxim maxim;
//AudioPlayer player;
int ballX;
int ballY;
int ballDir = 1;
int ballSize = 10;  // Radius
float ballAngle = 0.0;  // Direction
int score_r=0;
int score_l=0;
// Global variables for the paddle
int paddleWidth = 20;
int paddleHeight = 40;
int player=1;
int pause =0;
int wallGap = 50;

int netSegment;

void setup() {
  size(640, 480);
  noStroke();
  ballY = height/2;
  ballX = 0;
  noCursor();
  netSegment = height/32;
//setup sound
//  player2 = maxim.loadFile("mykbeat.wav");
//  player2.setLooping(true);
//  player.volume(0.25);
  textFont(createFont("Georgia", 36));
}

void draw()  {
  background(0);
  
  if (key == 'N' || key == 'n') {
    
    score_r=0;
    score_l=0;
    
  }
  
  stroke(255);
  // Draw Net
  for(int i=0; i<height; i=i+netSegment) {
    line(width/2, i, width/2, i+netSegment/3);
  } 
  noStroke();
  
  
  ballX += ballDir * 1;
  ballY += ballAngle;
  
  if(ballX > width+ballSize*2) {
    ballX = -ballSize;
    ballY = int(random(0, height-ballSize));
    ballAngle = 0;
    println(ballX + ":" + ballY + ":" + ballAngle);
  }
  
  if(ballX < -ballSize*2) {
    ballX = width;
    ballY = int(random(0, height-ballSize));
    ballAngle = 0;
    println(ballX + ":" + ballY + ":" + ballAngle);
  }
  
  // Constrain paddle to screen
  float paddleY = constrain(mouseY, 0, height-paddleHeight);

  // Test to see if the ball is touching the paddle
  float py = width-wallGap-ballSize-paddleWidth;
  float px = wallGap+paddleWidth;
  if((ballX >= py && ( ballY+ballSize >= paddleY && ballY <= paddleY + paddleHeight)) || (ballX <= px && ( ballY+ballSize >= paddleY && ballY <= paddleY + paddleHeight))) {
       
    ballDir *= -1;
    if(mouseY != pmouseY) {
      ballAngle = (mouseY-pmouseY)/2.0;
      ballAngle = constrain(ballAngle, -5, 5);
    }
  } 
  
  // If ball hits back wall, reverse direction
  if(ballX < 0) {
    ballDir *= -1;
    score_r++;
  }
  
  if(ballX > width) {
    ballDir *= -1;
    score_l++;
  }
  
  
  // If the ball is touching top or bottom edge, reverse direction
  if((ballY > height-ballSize) || (ballY < 0)) {
    ballAngle = ballAngle * -1;
  }
  
  text("Score: " + score_r, 0, 30);
  text("Score: " + score_l, width - 150, 30);
  
  // Draw ball
  fill(255);
  rect(ballX, ballY, ballSize, ballSize);
  float paddle_r_h=height-paddleY-paddleHeight;

  // Draw the paddle
  fill(153);
  if(ballX >= width/2 ){
  rect(width-wallGap-paddleWidth, paddleY, paddleWidth, paddleHeight);
  rect(wallGap, height/2, paddleWidth, paddleHeight); 
  text("Right", width/2-45, 30);
  }
  if(ballX <= width/2 ){
  rect(wallGap, paddleY, paddleWidth, paddleHeight); 
  rect(width-wallGap-paddleWidth, height/2, paddleWidth, paddleHeight);  
  text("Left", width/2-30, 30);
  }
  
  text("Press N to start New Game", width/2-200, height);
//  player.cue(0);
//  player.play();
  
}


void keyPressed() {
  //saveFrame("pong-####.tif"); 
}
