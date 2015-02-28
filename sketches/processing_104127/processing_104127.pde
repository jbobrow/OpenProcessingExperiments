
boolean bPlaying = false;

Step[] aStep;
int STEP_SIZE = 80;
int MAX_STEP = 15;
int STEP_TYPE_HIDDEN = -1;
int STEP_TYPE_NORMAL = 0;
int STEP_TYPE_JUMPER = 1;
int STEP_TYPE_BREAK = 2;
int STEP_TYPE_EXTRAJUMPER = 3;
int STEP_TYPE_MAX = 4;


Ball ball;
int BALL_SIZE = 30;
float BALL_BOUNCE_BACK_VEL = -10;
float xGravity = 0;
int BALL_UPDATE_OK = 0;
int BALL_UPDATE_OUT = 1;
int BALL_UPDATE_SCROLL = 2;

int score = 0;

class Ball {
  PVector pos;
  PVector vel;
  PVector gravity;
  float hSize;
  color BallColor;
  float frameHeight;

  Ball(float x, float y) {
    pos = new PVector(x, y, 0);
    vel = new PVector(0, 0);
    gravity = new PVector(0, 0.2);
    BallColor = color(255, 50, 50);
    hSize = BALL_SIZE/2;
    frameHeight = height;
  }

  // return true, of ball is out
  int update() {
    pos.add(vel);
    vel.add(gravity);
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.y > frameHeight) {
      return BALL_UPDATE_OUT;
    }
    if (pos.y < frameHeight/2) {
      return BALL_UPDATE_SCROLL;
    }    
    return BALL_UPDATE_OK;
  }

  void addXGravity(float xGrav) {
    pos.x += xGrav;
  }

  void draw() {
    float b4 = BALL_SIZE/3.5;
    // body
    fill(BallColor);
    noStroke();
    rect(pos.x-hSize, pos.y-hSize, BALL_SIZE, BALL_SIZE);

    // legs
    stroke(255, 100, 0);
    strokeWeight(3);
    line(pos.x-5, pos.y+BALL_SIZE/2, pos.x-b4, pos.y+BALL_SIZE/2+7);
    line(pos.x+5, pos.y+BALL_SIZE/2, pos.x+b4, pos.y+BALL_SIZE/2+7);

    // nose    
    stroke(255, 255, 0);
    strokeWeight(5); 
    line(pos.x, pos.y, pos.x, pos.y+10);

    // eyes
    noStroke();
    fill(255, 255, 255);
    float d = map(vel.y, -BALL_BOUNCE_BACK_VEL, BALL_BOUNCE_BACK_VEL, +12, -2);    
    ellipse(pos.x-b4, pos.y-d, BALL_SIZE/1.8, BALL_SIZE/1.6);
    ellipse(pos.x+b4, pos.y-d, BALL_SIZE/1.8, BALL_SIZE/1.6);
    fill(0, 0, 0);
    ellipse(pos.x-b4, pos.y-d, BALL_SIZE/4, BALL_SIZE/4);
    ellipse(pos.x+b4, pos.y-d, BALL_SIZE/4, BALL_SIZE/4);
  }

  void bounceBack(Step step) {
    // calculate the up-velocity depending on the step
    float newVel = vel.y;
    if (step.type == STEP_TYPE_NORMAL) 
      vel.y = BALL_BOUNCE_BACK_VEL;
    else if (step.type == STEP_TYPE_JUMPER) 
      vel.y = 1.2 * BALL_BOUNCE_BACK_VEL;
    else if (step.type == STEP_TYPE_EXTRAJUMPER)
      vel.y = 2 * BALL_BOUNCE_BACK_VEL;
  }

  boolean reflect(Step step) {
    // ball right or left of the step
    float rightEdge = pos.x+hSize;
    float leftEdge = pos.x-hSize;
    if (rightEdge < step.left()  ||  step.right() < leftEdge) {
      return false;
    }
    float yOld = pos.y + BALL_SIZE/2;
    float yNew = yOld + vel.y;
    if (yNew > step.y()  &&  yOld < step.y()) {
      return true;
    }
    return false;
  }
  
  // is the ball still visible / or out of the picture
  boolean visible() {
    return pos.y < height;
  }
}


class Step { 
  PVector pos;
  int weight; 
  int type;

  Step(float x, float y) {  
    pos = new PVector(x, y, 0);
    color(0, 200, 0);
    weight = 5;
    type = STEP_TYPE_NORMAL;
  } 
  boolean visible() {
    return pos.y < height;
  } 

  float left() {
    return pos.x - STEP_SIZE/2;
  }

  float right() {
    return pos.x + STEP_SIZE/2;
  }
  float y() {
    return pos.y;
  }

  color getColor()
  {
    // different color depending on the type
    color col = color(200, 200, 200);
    if (type == STEP_TYPE_NORMAL)
      col = color(0, 200, 0);
    else if (type == STEP_TYPE_JUMPER)
      col = color(200, 0, 0);
    else if (type == STEP_TYPE_BREAK)
      col = color(150, 150, 150);
    else if (type == STEP_TYPE_EXTRAJUMPER)
      col = color(200, 200, 0);
    return col;
  }

  void playSound()
  {
  }
  
  boolean doAction()
  {
    // do what is todo if ball hits that step
    playSound();
    if (type == STEP_TYPE_BREAK)
      return false;
    else
      return true;
  }

  void draw()
  {
    stroke(getColor());
    strokeWeight(weight); 
    line(left(), y(), right(), y());
  }
} 

// calculate a new step-position
// randomized but not directly on a other step
PVector getStepNewPos(boolean bScroll)
{
  float minY = height;
  float maxY = 0;
  for (int i=0; i<MAX_STEP; i++) {
    if (aStep[i] != null  &&  aStep[i].type != STEP_TYPE_BREAK) {
      if (aStep[i].pos.y < minY)
        minY = aStep[i].pos.y;
      if (aStep[i].pos.y > maxY)
        maxY = aStep[i].pos.y;
    }
  }
  PVector pos = new PVector(random(0+STEP_SIZE, width-STEP_SIZE), 0);
  if (bScroll) {
    if (minY < 0)
      pos.y = minY -10;
    else
      pos.y = -10;
  }
  else {
    pos.y = minY - random(10, height/5) - score/100 ;
  }
  return pos;
}


// create new steps and place the ball/bird
void initBoard() {
  ball = new Ball(300, 300);
  aStep = new Step[MAX_STEP];
  float y = 0;
  // first step down on the ground
  aStep[0] = new Step(random(0+STEP_SIZE, width-STEP_SIZE), height-10);  
  ball.pos.x = aStep[0].pos.x;
  ball.pos.y = aStep[0].pos.y - 20;
  for (int i=1; i<MAX_STEP; i++) {
    PVector pos = getStepNewPos(false);
    aStep[i] = new Step(pos.x, pos.y); 
  }
}




void setup()
{
  // default size
  size(500, 600);
  // load the sounds

  initBoard();
}



void draw()
{
  background(0);
  // show score
  textAlign(LEFT, CENTER);
  textSize(22);
  fill(200, 200, 100);
  text(score, 30, 30);
  // show instructions
  if (!bPlaying) {
    textAlign(CENTER, CENTER);
    text("hit any key to start", width/2, height/2);
    text("use LEFT and RIGHT cursor", width/2, height/2 - 50);
    return;
  }
  // end game ?
  if (!ball.visible()) {
    bPlaying = false;
  }
  // the ball falls down
  ball.update();
  ball.addXGravity(xGravity);

  //scrolling of the steps down
  float yMid = height/2;
  if (ball.pos.y < yMid) {
    float d = yMid - ball.pos.y;
    // jump up -> increase the score
    score += d;
    // correct the ball position - on the half y
    ball.pos.y = yMid;
    for (int i=0; i<MAX_STEP; i++) {
      // scroll down the steps
      if (aStep[i] != null) 
        aStep[i].pos.y += d;
    }
  }
  // create new step (new pos), if a step was scrolled out of the screen
  for (int i=0; i<MAX_STEP; i++)  {
    if (aStep[i] != null  &&  !aStep[i].visible()) {
      aStep[i].pos = getStepNewPos(true);
      aStep[i].type = (int)random(STEP_TYPE_NORMAL, STEP_TYPE_MAX);
    }
  } 

  // calculate, if the ball hits any step
  for (int i=0; i<MAX_STEP; i++) {
    if (aStep[i] != null)  {   
      aStep[i].draw();
      if (ball.reflect( aStep[i] )) {
        ball.bounceBack(aStep[i]);
        if (! aStep[i].doAction())
          // a break-step - it's now absend
          aStep[i] = null;
      }
    }
  }
  ball.draw();
}

void keyPressed()
{
  if (!bPlaying) {
    // restart the game
    score = 0;
    initBoard();
    bPlaying = true;
  }
  
  if (keyCode == RIGHT) {
    xGravity = 2;
  }
  if (keyCode == LEFT) {
    xGravity = -2;
  }
}

void keyReleased()
{
  xGravity = 0;
}
