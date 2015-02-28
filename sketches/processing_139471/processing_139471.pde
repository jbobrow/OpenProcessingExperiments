
// Air hockey:
// 1 and 2 to toggle AI for players 1 and 2
// WASD to control player 1
// Arrow Keys to control player 2


// Active key detection
// Allows smoother controls
int keyud = 0;
int keylr = 0;

int keyws = 0;
int keyad = 0;

// Global game controllers
final float gVel     = .2;
final float gVelFric = .98;
final float gElas    = 1;

// Balls
Ball player1;
Ball player2;
Ball puck;

// Score
int score1, score2;

// AI on/off
boolean droid1 = false;
boolean droid2 = false;

// AI
AI1 T1000;

void setup() {
  size(800, 600);
  frameRate(60);
  colorMode(HSB);

  // Constructs balls
  player1 = new Ball(new PVector(width/4, height/2), 
  new PVector(width/4, height/2), 
  192, 24);
  player2 = new Ball(new PVector(width*3/4, height/2), 
  new PVector(width*3/4, height/2), 
  64, 24);
  puck = new Ball(new PVector(width/2, height/2), 
  new PVector(width/2, height/2), 
  128, 16);
  reset(0);  
  
  // Constructs AI
  T1000 = new AI1(player1, puck, player2, -1);
  
  score1 = 0;
  score2 = 0;
}

void draw() {
  // Draws field
  background(128);
  noStroke();
  fill(192, 128, 255);
  rect(0, 0, width/2, height);
  fill(64, 128, 255);
  rect(width/2, 0, width, height);
  fill(192, 128, 192);
  rect(0, 0, width/16, height);
  fill(64, 128, 192);
  rect(width*15/16, 0, width, height);
  
  // Scoring detection
  if (puck.pos.x < width/16) {
    score2++;
    reset(-1);
  }
  if (puck.pos.x > width*15/16) {
    score1++;
    reset(1);
  }
  
  // Ticks and renders test balls
  player1.tick();
  player2.tick();
  puck.tick();
  
  player1.render();
  player2.render();
  puck.render();
  
  // AI
  if(droid1) T1000.skynet();
  // if(droid2) insert AI code here
  
  // Manual control
  arrowKeys(player2);
  wasd(player1);
  
  // Passing test 1 and 2 to temp balls
  Ball tempb1   = new Ball(new PVector(player1.pos.x, player1.pos.y), 
                           new PVector(player1.last.x, player1.last.y), 
                           0, player1.radius);
  Ball tempb2   = new Ball(new PVector(player2.pos.x, player2.pos.y), 
                           new PVector(player2.last.x, player2.last.y), 
                           0, player2.radius);
  Ball temppuck = new Ball(new PVector(puck.pos.x, puck.pos.y), 
                           new PVector(puck.last.x, puck.last.y), 
                           0, puck.radius);

  // Colliding balls
  player1.collide(tempb2);
  player2.collide(tempb1);
  player1.collide(temppuck);
  player2.collide(temppuck);
  puck.collide(tempb2);
  puck.collide(tempb1);

  // Shows active framerate
  fill(75, 255, 32);
  textSize(12);
  text("FPS:" + floor(frameRate), width-64, height-8);
  
  // Displays score
  fill(0);
  textSize(32);
  text(score1, width/4, height/16);
  text(score2, width*3/4, height/16);
}

// Input
void keyPressed() {
  gameKeyPressed();
}

void keyReleased() {
  gameKeyReleased();
}

// Resets field
void reset(int winner) {
  player1.reset(new PVector(width/4, height/2));
  player2.reset(new PVector(width*3/4, height/2));
  puck.reset(new PVector(width/2+winner*(width/8), random(height/4, height*3/4)));
}

// Gets the sign of a number
float getSign(float num) {if(num == 0) return 0; else return num/abs(num);}
// Artificial intelligence class
class AI1 {
  // The ball controlled by the AI
  // The puck
  // The opponent's ball
  Ball contBall, puckBall, oppBall;
  
  // The side of the AI
  // -1 for left
  // 1 for right
  int side;
  
  // Constructor
  AI1 (Ball c1, Ball c2, Ball c3, int c4){
    contBall = c1;
    puckBall = c2;
    oppBall = c3;
    side = c4;
  }
  
  // Just chases the ball
  void skynet(){
    
    contBall.move(cos(atan2(puckBall.pos.y-contBall.pos.y, 
                            puckBall.pos.x-contBall.pos.x)),
                  sin(atan2(puckBall.pos.y-contBall.pos.y, 
                            puckBall.pos.x-contBall.pos.x)));
  }
}
// Smashball Balls
class Ball {
  // Initializing class variables
  private PVector pos, last;
  private int hue, radius;

  // Constructor for the ball:
  // t is the starting position
  // tl is the delta position
  // th is hue
  // tr is radius
  Ball(PVector t, PVector tl, int th, int tr) {
    pos    = t;
    last   = tl;
    hue    = th;
    radius = tr;
  }
  
  // Moves the ball with a constant speed
  // xdir and ydir determine the direction
  void move(float xdir, float ydir){
    if(xdir != 0) 
      pos.x += getSign(xdir) * gVel * (sqrt(sq(xdir) / (sq(ydir) + sq(xdir))));
    if(ydir != 0)
      pos.y += getSign(ydir) * gVel * (sqrt(sq(ydir) / (sq(xdir) + sq(ydir))));
  }

  // Simulates ball actions (such as movement)
  void tick() {
    // Temp for setting last location
    PVector tempp = new PVector();
    tempp.set(pos.x, pos.y);

    // Verlet integration formulas for discrete physics simulations
    // v = ds/dt
    pos.set(pos.x + gVelFric*((pos.x - last.x)), 
            pos.y + gVelFric*(pos.y - last.y));
    last.set(tempp.x, tempp.y);

    // Checks screen bounds
    if (pos.x < 0)      bounceX(0);
    if (pos.x > width)  bounceX(width);
    if (pos.y < 0)      bounceY(0);
    if (pos.y > height) bounceY(height);
  }

  // Displays the ball
  void render() {
    noStroke();
    fill(hue, 255, 128);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  // Ball collisions with other balls
  void collide(Ball hit) {
    if (dist(hit.pos.x, hit.pos.y, pos.x, pos.y) < hit.radius+radius) {
      // Phi is the contact angle
      float phi = atan2(hit.pos.y - pos.y, hit.pos.x - pos.x);

      // v is the velocity of the corresponding ball
      // ang is the direction of movement for the ball
      float v1 = dist(pos.x, pos.y, last.x, last.y);
      float ang1 = atan2(pos.y - last.y, pos.x - last.x);
      float v2 = dist(hit.pos.x, hit.pos.y, hit.last.x, hit.last.y);
      float ang2 = atan2(hit.pos.y - hit.last.y, hit.pos.x - hit.last.x);

      pos.x = hit.pos.x - cos(phi) * (hit.radius+radius);
      pos.y = hit.pos.y - sin(phi) * (hit.radius+radius);
      
      // 2d elastic collision equation with movement
      last.x = pos.x-gElas*(v2*cos(ang2-phi)*cos(phi)+v1*sin(ang1-phi)*cos(phi+PI/2));
      last.y = pos.y-gElas*(v2*cos(ang2-phi)*sin(phi)+v1*sin(ang1-phi)*sin(phi+PI/2));
      
      
      tick();
    }
  }

  // Bounces off of a bound
  void bounceY(float bound) {
    last.y = bound + gElas * (pos.y - last.y);
    pos.y  = bound;
  }

  void bounceX(float bound) {
    last.x = bound + gElas * (pos.x - last.x);
    pos.x  = bound;
  }
  
  // Resets the ball
  void reset(PVector t) {
    pos    = t;
    last.x = pos.x;
    last.y = pos.y;
  }
}

// Detects active keys
void gameKeyPressed() {
  // Null cancelling movement
  if (key == CODED) {
    if (keyCode == UP)    keyud = -1;
    if (keyCode == LEFT)  keylr = -1;
    if (keyCode == RIGHT) keylr = 1;
    if (keyCode == DOWN)  keyud = 1;
  }

  if (key == 'w' || key == 'W') keyws = -1;
  if (key == 'a' || key == 'A') keyad = -1;
  if (key == 'd' || key == 'D') keyad = 1;
  if (key == 's' || key == 'S') keyws = 1;
  if (key == 'r' || key == 'R') reset(0);
  if (key == '1') droid1 = !droid1;
  if (key == '2') droid2 = !droid2;
}

// Detects when keys go inactive
void gameKeyReleased() {
  if (key == CODED) {
    if (keyCode == UP    && keyud == -1) keyud = 0;
    if (keyCode == LEFT  && keylr == -1) keylr = 0;
    if (keyCode == RIGHT && keylr == 1)  keylr = 0;
    if (keyCode == DOWN  && keyud == 1)  keyud = 0;
  }

  if ((key == 'w' || key == 'W') && keyws == -1) keyws = 0;
  if ((key == 'a' || key == 'A') && keyad == -1) keyad = 0;
  if ((key == 'd' || key == 'D') && keyad == 1)  keyad = 0;
  if ((key == 's' || key == 'S') && keyws == 1)  keyws = 0;
}

void arrowKeys(Ball tb) {
  // Controls balls with keys
  // Test ball 1
  tb.move(keylr, keyud);
}

void wasd(Ball tb) {
  // Test ball 2
  tb.move(keyad, keyws);
}


void mousePressed(){
player1.move(atan2(mouseY-player1.pos.y, mouseX-player1.pos.x));
}
