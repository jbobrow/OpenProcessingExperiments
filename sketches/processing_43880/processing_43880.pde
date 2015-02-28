
int x = 0;
int speedX = 3;

int score_offset = 100;
int score = 0;

int balls = 3;

int y = 50;
int speedY = 3;

int bar_speedX = 50;

void setup() {
  size (480, 640);
  noStroke ();
  //smooth();
}

void draw () {

  // bar
  fill(0);
  moveBar();

  // load font
  PFont font;
  font = loadFont("Silkscreen-12.vlw"); 
  fill(255, 255, 0);
  textFont(font, 44); 
  text(score, 20, 44); 

  text("* "+balls, 370, 44); 


  // draw the ball
  fill(255, 255, 0);
  ellipse(x, y, 20, 20);

  // check for horizontal bounce
  if (x >= width || x<0) {
    speedX = speedX * -1;
  }

  // define ball and bar postions  
  int ball_position = x+=speedX;
  int bar_postion = bar_speedX+180;

  // Check ball and bar position
  if (y >= 600 || y<0) {
    if (ball_position <= bar_postion+100 && ball_position >= bar_postion) {
      speedY = speedY * -1;
      score+=score_offset;
    } 
    else {
      balls-=1;
      if (balls == 0) {
        textFont(font, 44); 
        text("game over", width/4, height/2); 
        score = 0;
        balls = 3;
      }
      y = 10;
    }
  }




  x+=speedX;
  y+=speedY;
}

// draw and move the bar
void moveBar() {

  if (keyPressed && keyCode == LEFT) {
    if (bar_speedX > -180) {
      bar_speedX = bar_speedX - 5;
    }
  } 

  if (keyPressed && keyCode == RIGHT) {
    if (bar_speedX < 180) {
      bar_speedX = bar_speedX + 5;
    }
  } 

  background(0, 0, 255);
  rect(width/2-50+bar_speedX, 600, 100, 20);
}


