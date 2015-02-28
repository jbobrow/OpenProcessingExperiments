
void drawBall(float x, float y) {
  // draw the ball
  ellipse (x,y,20,20);
  ellipse (x-10,y-10,13,13);
  ellipse (x+10,y-10,13,13);

}

void drawPaddle(float x, float y) {
  // draw one paddle
  rect(x, y, 10, 60);
}

void drawScores(int player1, int player2) {
  // use a font and some text to draw the scores.
  // if you do this, create a new global PFont variable and initialize it in setup()
  
  // OR, use some other creative method to represent the scores!
  // for example, you could use a while loop and draw small dots for each point
}

void checkOutOfBounds() {
  // This function "breaks the abstraction".
  
  // Use the following variables:
  //    ball_x
  //    ball_y
  //    player1score
  //    player2score

  // If the ball has moved off the right side of the screen,
  // increase the first player's score, and reset the ball to the middle of the screen
  // 
  // If the ball has moved off the left side of the screen,
  // increase the second player's score, and reset the ball to the middle of the screen
}

PVector getNewBallDirection(float x, float y, float x_direction, float y_direction, float paddle1_y, float paddle2_y) {

  float new_x_direction = x_direction;  
  float new_y_direction = y_direction;


  // check ceiling and floor collision  
  if ( y <= 0 ) {
    new_y_direction = 1;
  }
  if ( y >= 600 ) {
    new_y_direction = -1;
  }

  // check paddle collision
  if ( y >= paddle1_y && y <= paddle1_y + 100 && x <= 40 ) {
    new_x_direction = 1;
    fill (random(0, 255), random(0, 255), random(0, 255));
  }
  if ( y >= paddle2_y && y <= paddle2_y + 100 && x >= 525 ) {
    new_x_direction = -1;
    fill(random(0, 255), random(0, 255), random(0, 255));
  }

  return new PVector(new_x_direction, new_y_direction);
}


void setup () {
  size(600, 600);

  noStroke();
  fill(255);
}


//////////
// you should not need to change anything below this line ...
//////////

float ball_x = 300;
float ball_y = 300;

PVector ball_direction = new PVector(1,1);

float _paddle1_y = 250;
float _paddle2_y = 250;

int player1score = 0;
int player2score = 0;

void draw() {

  background(0);

  drawBall(ball_x, ball_y);

  drawPaddle(20, _paddle1_y);
  drawPaddle(540, _paddle2_y);

  // move paddles
  if ( keyPressed ) {
    if ( key == 'q' ) {
      _paddle1_y = _paddle1_y - 2;
    }
    if ( key == 'z' ) {
      _paddle1_y = _paddle1_y + 2;
    }
    if ( key == 'i' ) {
      _paddle2_y = _paddle2_y - 2;
    }
    if ( key == 'm' ) {
      _paddle2_y = _paddle2_y + 2;
    }
  }

  ball_direction = getNewBallDirection(ball_x,ball_y, ball_direction.x, ball_direction.y, _paddle1_y, _paddle2_y);

  // update ball position
  ball_x = ball_x + ball_direction.x;
  ball_y = ball_y + ball_direction.y;
  
  checkOutOfBounds();

}



