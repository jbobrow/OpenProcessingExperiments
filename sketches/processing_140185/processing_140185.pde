
void drawBall(float x, float y) {

  //  image(snow, x, y);

  fill(255);
  beginShape();
  vertex(x, y);
  vertex(x-1, y+3);
  vertex(x-5, y+3);
  vertex(x-3, y+6);
  vertex(x-5, y+10);
  vertex(x-1, y+9);
  vertex(x, y+13);
  vertex(x+2, y+9);
  vertex(x+6, y+10);
  vertex(x+4, y+6);
  vertex(x+6, y+3);
  vertex(x+2, y+3);
  endShape();
}

void drawPaddle(float x, float y) {

  rect(x, y, 50, 10);
}

void drawScores1 (float player1score_x, float player1score_y) {

  fill(#436BAA);
  ellipse( score1x, score1y, 8, 8);
}

void drawScores2 (float player2score_x, float player2score_y) {

  fill(#436BAA);
  ellipse(score2x, score2y, 8, 8);

  //void checkOutOfBounds() {
}

void newball ( int newball_x, int newball_y) {

  if ( (ball_y >= 600 ) || ( ball_y <= 0 ) ) {
    drawBall(300, 300) ;
  }
  

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
  if ( y >= paddle1_y && y <= paddle1_y + 50 && x <= 50 ) {
    new_x_direction = 1;
  }
  if ( y >= paddle2_y && y <= paddle2_y + 50 && x >= 550 ) {
    new_x_direction = -1;
  }

  return new PVector(new_x_direction, new_y_direction);
}


void setup () {
  size(600, 600);

  noStroke();
  fill(255);

  snow = loadImage("snowflake.png");

  frameRate(90);
}


//////////

PImage snow;

float ball_x = 300;
float ball_y = 300;

PVector ball_direction = new PVector(1, 1);

float _paddle1_y = 250;
float _paddle2_y = 250;

int player1score = 0;
int player2score = 0;

int newball_y = 300;
int newball_x = 300;

float score1x = 20; 
float score1y = 300;

float score2x = 580;
float score2y = 300; 

float player1score_x = 20;
float player2score_x = 580;


void draw() {

  background(#7B96C1);

  drawBall(ball_y, ball_x);
  

  drawPaddle(_paddle1_y, 40);
  drawPaddle(_paddle2_y, 550);

  // move paddles
  if ( keyPressed ) {
    if ( key == 'a' ) {
      _paddle1_y = _paddle1_y - 2;
    }
    if ( key == 's' ) {
      _paddle1_y = _paddle1_y + 2;
    }
    if ( key == 'k' ) {
      _paddle2_y = _paddle2_y - 2;
    }
    if ( key == 'l' ) {
      _paddle2_y = _paddle2_y + 2;
    }
  }

  ball_direction = getNewBallDirection(ball_x, ball_y, ball_direction.x, ball_direction.y, _paddle1_y, _paddle2_y);


  ball_x = ball_x + ball_direction.x;
  ball_y = ball_y + ball_direction.y;


  newball (newball_x, newball_y);

  drawScores1 ( score1x, score1y );

  if ( ball_y >= 600 ) {
    player1score = player1score + 1;
 
  }
  
  
  if ( ball_y >= 600 ) {
 
    player1score_x = player1score_x + 20;
  }

  drawScores2 ( score2x, score2y );

  if ( ball_y <= 0 ) {
    player2score = player2score + 1;

  }
  
    if ( ball_y <= 0 ) {
    
    player2score_x = player2score_x - 20;
  }
  

}



