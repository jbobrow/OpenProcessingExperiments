
// PONG
// by Sam Richardson


static final int PADDLE_HEIGHT = 100;
static final int PADDLE_WIDTH = 20;
static final int BALL = 20;
static final int WALL = 20;

static final int WEST = 2;
static final int EAST = 3;
static final int NORTH = 1;
static final int SOUTH = -1;

int ballFace, ballVert; // ball direction and angle
float ballX, ballY; // ball x and y positions
float rateX, rateY; // speed and angle of ball
float impact; // point on paddle that ball hits

static final int START_RATE = 4; // yeah

int click; // game paused?

int score; // current score
float slope; // angle of ball
int deaths; // times balls has gone off edge, shown as a negative

void setup() {
  size(700,500);
  frameRate(30);
  noStroke();
  ballX = width/2;
  ballY = height/2;
  ballFace = WEST;
  ballVert = SOUTH;
  rateX = START_RATE;
  rateY = 2;
  click = 0;
}


// pausing mechanism
void mouseClicked() {
  if (click == 0) {
    noLoop();
    text("PAUSED, CLICK TO RESUME",mouseX,mouseY);
    click = 1;
  }
  else if (click == 1) {
    text("IT'S A SECRET TO EVERYBODY.",mouseX,mouseY);
    loop();
    click = 0;
  }
}


void draw() {
  background(0);
  rect((width-20),0,WALL,height); // wall
  rect(0,(mouseY - PADDLE_HEIGHT/2),PADDLE_WIDTH,PADDLE_HEIGHT); // paddle
  
  // ball hits wall
  if ((ballX + BALL) >= (width - WALL)) {
    ballFace = WEST;
  }
  
  // ball hits side
  if (ballY <= 0) {
    ballVert = SOUTH;
  }
  if (ballY >= (height - BALL)) {
    ballVert = NORTH;
  }
  
  
  // ball goes off edge
  if (ballX <= (0 - BALL)) {
    ballX = width/2;
    ballY = height/2;
    ballFace = EAST;
    
    // speed and score penalty
    if (rateX > 30) {
      rateX = rateX - 10;
    }
    else if (rateX > 15) {
      rateX = rateX - 5;
    }
    else if (rateX > 5) {
      rateX = rateX - 2;
    }
    else if (rateX > 1) {
      rateX--;
    }
    
    deaths--;
  }
  
  
    // ball hits paddle
  if (ballX <= PADDLE_WIDTH) {
    if (ballY < mouseY) {
      impact = mouseY - (ballY + BALL);
    }
    else {
      impact = mouseY - ballY;
    }
    if (Math.abs(impact) <= PADDLE_HEIGHT/2) {
      rateX++;
      
      // new direction and angle
      ballFace = EAST;
      if (impact < 0) {
        ballVert = SOUTH;
      }
      else {
        ballVert = NORTH;
      }
      rateY = ((Math.abs(impact)/(PADDLE_HEIGHT/2)) * 10);
    }
  }
  
  
  
  // ball movement
  switch(ballFace) {
    case EAST:
      ballX = ballX + rateX;
      break;
    case WEST:
    default:
      ballX = ballX - rateX;
  }
  switch(ballVert) {
    case SOUTH:
      ballY = ballY + rateY;
      break;
    case NORTH:
    default:
      ballY = ballY - rateY;
  }
  
  
  
  // draw ball
  rect(ballX,ballY,BALL,BALL);
  
  // score/speed/angle/whatever
  score = (int)rateX - START_RATE;
  slope = (rateY/rateX)*100;
  
  text(score,0,height); // score
  text(deaths,50,height); // deaths
  text("< score deaths PONG angle >",200,height); // labels
  text((int)slope,550,height); // angle/slope of ball
  
}


