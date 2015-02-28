
import hypermedia.video.*; //Loads the webcam live feed
import java.awt.Rectangle; //Creates the area for blob detection
import java.awt.Point; //Creates the point within area for blob detection

  OpenCV opencv; //opens CV library for blob detection

  int w = 640; //creates width of size of split-screen PONG
  int h = 480; //creates height of size of split-screen PONG
  int threshold = 60; //creates in-between area

  boolean find=true; //function to invert bg removal and find blob
  
private static final long serialVersionUID = 1L;
long lastFrame;
float appFps;
PFont unibody;
boolean freeze;
float freezeVal;



// Global variables for the pong ball
float ball_x = 0;
float ball_y = 0;
int ball_size = 6;
float ballSpeedX = 0;
float ballSpeedY = 0;

// Spielfeld
int padding = 25;

//variables for the paddles
int paddle_width = 4;
int paddle_height = 60;
float paddleSpeedY = 3;
// left paddle
float paddle_left;
float paddleLeSpeedY = 0;
// right paddle
float paddle_right;
float paddleRiSpeedY = 0;

// Score
int scoreLe = 0;
int scoreRi = 0;

float fps;



void setup() //set up of Pong
{
  PFont font; // loads font
  font = loadFont("Unibody8-Regular-28.vlw"); //selects font within sketch folder
  textFont(font);

  size(640, 480); // size of pong window, turn into main window
  background(0);
  rectMode(CORNER);
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  
  {
size(640, 480);
lastFrame = millis();
unibody = loadFont("Unibody8-Regular-28.vlw");
frameRate(60);
freeze = false;
freezeVal = 0;
}

  ball_x = width/2; // position ball x
  ball_y = height/2; // position ball y
  ballSpeedX = 5; // speed ball x
  ballSpeedY = 0; // speed ball y
  


  opencv = new OpenCV( this ); // open cv library (blob) inside the pong window
  opencv.capture(640, 480); // show webcam at 640 x 480

  //println( "Drag mouse inside sketch window to change threshold" ); //mouse to change treshold of blob recognition
  println( "Press space bar to record background image" ); //click spacebar to record background image (reference)
}

//{
 //frameRate(30);
//}
//int pos = 0;



void draw() { // this makes things appear or draw them inside previously designed parameters
  opencv.read();
  opencv.flip( OpenCV.FLIP_HORIZONTAL );

  image( opencv.image(),5,5);	            // RGB image
  image( opencv.image(OpenCV.GRAY), 20+w, 10 );   // GRAY image
  image( opencv.image(OpenCV.MEMORY), 10, 20+h ); // image in memory
  
  opencv.absDiff();
  opencv.threshold(threshold); // this detects the contrast
  image( opencv.image(OpenCV.GRAY), 20+w, 20+h ); // absolute difference image
  
  
  {
//background(0);
int timeElapsed = (int)(millis() - lastFrame);
if(timeElapsed != 0)
appFps =(float) 1000 / timeElapsed;
lastFrame = millis(); 

if(!freeze)
{
textFont(unibody);
fill(255);
text(appFps, 0, 40);
}
else
{
textFont(unibody);
fill(255);
text(freezeVal, 0, 40);
}
}

 

//Draw lines of the field
  stroke(64);
  line(padding, padding, width-padding, padding);
  line(padding, height-padding, width-padding, height-padding);
  line(width/2, padding, width/2, height-padding);

  // draw Score
  fill(255);
  textAlign(LEFT);
  text(scoreLe, padding, padding-1);
  textAlign(RIGHT);
  text(scoreRi, width-padding, padding-1);
  





  // Paddle left
  paddle_left += paddleLeSpeedY;
  if (paddle_left < padding) {
    paddle_left = padding;
  }
  else if (paddle_left+paddle_height > height-padding) {
    paddle_left = height-padding-paddle_height;
  }

  // Paddle right
  paddle_right += paddleRiSpeedY;
  if (paddle_right < padding) {
    paddle_right = padding;
  }
  else if (paddle_right+paddle_height > height-padding) {
    paddle_right = height-padding-paddle_height;
  }

  // Draw the paddle
  fill(255);
  rectMode(CORNER);
  rect(padding, paddle_left, 4, 60);
  rect(width-padding, paddle_right, 4, 60);
  
   // Ball
  ball_x += ballSpeedX;
  ball_y += ballSpeedY;

  // If ball touches top or bottom edge, reverse direction
  if ( ball_y-ball_size/2 < padding || ball_y+ball_size/2 > height-padding ) {
    ballSpeedY *= -1;
  }

  // Paddle left intersection (corner)
  if (ball_x-ball_size/2 <= padding && ball_x+ball_size/2 > padding) {
    if (ball_y >= paddle_left && ball_y <= paddle_left+paddle_height) {
      ballSpeedX *= -1;
      float hit = ball_y - (paddle_left+paddle_height/2);
      ballSpeedY += (hit / (paddle_height/2)) *2; // range -1 to 1 (*2)
    }
  }

  // Paddle right intersection (corner)
  if (ball_x+ball_size/2 >= width-padding && ball_x-ball_size/2 < width-padding) {
    if (ball_y >= paddle_right && ball_y <= paddle_right+paddle_height) {
      ballSpeedX *= -1;
      float hit = ball_y - (paddle_right+paddle_height/2);
      ballSpeedY += (hit / (paddle_height/2)) *2; // range -1 to 1 (*2)
    }
  }

  // Draw ball
  fill(255);
  ellipse(ball_x, ball_y, ball_size, ball_size);



//background(204);
  //pos++;
  //line(pos, 20, pos, 80);
  //if (pos > width) {
    //pos = 0;
  //}


// working with blobs
  Blob[] blobs = opencv.blobs( 100, w*h/3, 20, true );

  noFill();

  pushMatrix();

  translate(20+w, 20+h);

  Point specialCentroid = new Point(); // this selects point within rectangle
  specialCentroid.x = 0;
  specialCentroid.y = 0;

  if (blobs.length > 0) { //match blob length with its centroid
    specialCentroid = blobs[0].centroid;
  }


  //Draws the blob rectangle and the centroid
  for ( int i=0; i<blobs.length; i++ ) { 
    pushMatrix();
    Rectangle bounding_rect= blobs[i].rectangle;
    float area = blobs[i].area;
    float circumference = blobs[i].length;
    Point centroid = blobs[i].centroid;
    Point[] points = blobs[i].points;

   //Rectangle
    noFill();
    stroke( blobs[i].isHole ? 128 : 64 );
    rect( bounding_rect.x, bounding_rect.y, bounding_rect.width, bounding_rect.height );
 
  paddle_left = specialCentroid.y; //this makes the centroid of blob (my arm) be the left paddle, or y parameter

  // ball out -> reset
  if (ball_x >= width || ball_x <= 0 ) {
    // count score
    if ( ball_x >= width ) {
      scoreLe += 1;
    }
    else {
      scoreRi += 1;
    }

    // resets game after score
    ball_x =  width/2;
    ball_y = height/2;
    ballSpeedY = 0;
    paddle_left = height/2 - paddle_height/2;
    paddle_right = height/2 - paddle_height/2;
  }

  // background
  noStroke();
  fill(0);
  rectMode(CORNER);
  rect(0, 0, width, height);

  
   

     //centroid
    stroke(0, 0, 255);
    line( centroid.x-5, centroid.y, centroid.x+5, centroid.y );
    line( centroid.x, centroid.y-5, centroid.x, centroid.y+5 );
    noStroke();
    fill(0, 0, 255);
    text( area, centroid.x+5, centroid.y+5 ); //this draws the numbers (data)


    fill(255, 0, 255, 64);
    stroke(255, 0, 255);
    if ( points.length>0 ) {
      beginShape();
      for ( int j=0; j<points.length; j++ ) {
        vertex( points[j].x, points[j].y );
      }
      endShape(CLOSE);
    }

    noStroke();
    fill(255, 0, 255);
    text( circumference, centroid.x+5, centroid.y+15 );
    
    popMatrix();
  }
  
  
  
  popMatrix();
}


void mouseDragged() {
  threshold = int( map(mouseX, 0, width, 0, 255) );
}

public void stop() { //makes opencv library stop. ?
  opencv.stop();
  super.stop();
}


void keyPressed() { 
   if (keyCode == UP) { //activates controller of right paddle, up and down arrows 
    paddleRiSpeedY = paddleSpeedY * -1;
  }
  else if (keyCode == DOWN) {
    paddleRiSpeedY = paddleSpeedY;
  }

  if ( key==' ' ) opencv.remember();
}

void keyReleased() { //I don't think we need this, since this is now controlled by the blob/the arm
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    paddleLeSpeedY = 0;
  }
  else if (keyCode == UP || keyCode == DOWN) { //releases controller of right paddle, up and down arrows
    paddleRiSpeedY = 0;
  }

{
if (keyCode == ' ')
{
freeze = !freeze;
freezeVal = appFps;

}
}






}


