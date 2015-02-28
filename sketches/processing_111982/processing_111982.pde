
// CPMT166 ASSIGNMENT 1
// Bouncing Ball Game
// Yen-An Andy Chen - Fall 2013

//Variables
boolean isRunning = false;
PImage simplePic;

float ball_x = 250;  // x and y position of the ball
float ball_y = 50;  
float speedX = 4; // speed of ball
float speedY = 4;
float vel_x = 1; // accel velocity of ball
float vel_y = 1;
float ball_R = 25;  // ball radius


int white = 255;

int bat_width = 100;
int bat_height = 10;

// colors for flash change when hit
int left_c = 15;
int right_c = 15;
int top_c = 15;
int bat_c1 = 200;
int bat_c2 = 200;
int bat_c3 = 50;

float diam = 50;


void setup() {
  size(500,500);
  frameRate(60);
  simplePic = loadImage("http://www.sfu.ca/~yac2/CMPT 166/assignment1/assign1image.jpg");
}

void draw() {
  // re-draw the background
  background(simplePic);
  strokeWeight(0);
 
  fill(left_c,100,100);
  rect(0,0,10,500);  // left wall
  fill(right_c,100,100);
  rect(490,0,10,500);  //right wall
  fill(top_c,100,100);
  rect(0,0,500,10);  // top wall

  // draw the ball
  stroke(150,20,200);
  strokeWeight(3);
  fill(255,0,100);
  ellipse(ball_x, ball_y, ball_R, ball_R);

  //draw the bat
  stroke(0,200,0);
  strokeWeight(3);
  fill(bat_c1,bat_c2,bat_c3);
  rect(mouseX-bat_width/2, height-50, bat_width, bat_height);

    
  if (isRunning) {
    

    
    ball_x = ball_x + speedX * vel_x;
    ball_y = ball_y + speedY * vel_y;
    
      //top of bat hit detection
      if  (ball_y > height-60 && ball_y < height-50 && ball_x > (mouseX-bat_width/2)-ball_R && ball_x < (mouseX+bat_width/2)+ball_R )
      {
          speedY = speedY * -1;
          ball_y = ball_y + speedY;

          bat_c1 = 0;
          bat_c2 = 0;
          bat_c3 = 255;
      }
      
      //left wall detection
      else if (ball_x < 25) 
      {
          speedX = speedX * -1;
          ball_x = ball_x + speedX;
          left_c = 255;
      }
       
      //right wall detection
      else if (ball_x > width-ball_R) 
      {
          speedX = speedX * -1;
          ball_x = ball_x + speedX;
          right_c = 255;
      }
       
      // top wall detection
      else if (ball_y < ball_R ) 
      {
        //1 mark for making the ball accelerate when it hits the top of the window.
        if (vel_y < 3.5 && vel_x < 3.5){
        vel_y += 0.2;  
        vel_x += 0.2;
        }
        speedY = speedY * -1;
        ball_y = ball_y + speedY;
        top_c = 255;
      }
      
      // bottom detection
      else if (ball_y > height) 
      {
        isRunning = false;
        ball_x = random(50,450);
        ball_y = 50;
        speedX = 5;
        speedY = 5;
        vel_y = 1;
        vel_x = 1;
      }
      
      else {
        //reset colors back to original after the hit change
        left_c = 15;
        right_c = 15;
        top_c = 15;
        bat_c1 = 200;
        bat_c2 = 200;
        bat_c3 = 50;
        
      }
       
  } //end of isRunning
  
  
} // end of DRAW

void mousePressed() {  // click mouse to pause
  isRunning = !isRunning;
}

