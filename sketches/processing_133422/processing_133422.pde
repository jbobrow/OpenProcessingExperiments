
// Active key detection
// Allows smoother controls
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;

boolean keyw = false;
boolean keyd = false;
boolean keya = false;
boolean keys = false;

// Global game controllers
final float gVel     = .2;
final float gVelFric = .99;
final float gElas    = 1;

// Balls
Ball player1;
Ball player2;
Ball puck;

// Score
int score1, score2;

void setup() {
  size(800, 600);
  frameRate(60);
  colorMode(HSB);

  // Constructs balls
  player1 = new Ball(new PVector(width*3/4, height/2), 
  new PVector(width*3/4, height/2), 
  64, 24);
  player2 = new Ball(new PVector(width/4, height/2), 
  new PVector(width/4, height/2), 
  192, 24);
  puck = new Ball(new PVector(width/2, height/2), 
  new PVector(width/2, height/2), 
  128, 16);                   

  score1 = 0;
  score2 = 0;
}

void draw() {
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
  
  
  //skynet(player1, puck, player2, 1);
  //skynet(player2, puck, player1, -1);
  arrowKeys(player1);
  wasd(player2);
  
  // Passing test 1 and 2 to temp balls
  Ball tempb1 = new Ball(new PVector(player1.pos.x, player1.pos.y), 
  new PVector(player1.last.x, player1.last.y), 
  0, player1.radius);
  Ball tempb2 = new Ball(new PVector(player2.pos.x, player2.pos.y), 
  new PVector(player2.last.x, player2.last.y), 
  0, player2.radius);
  Ball temppuck = new Ball(new PVector(puck.pos.x, puck.pos.y), 
  new PVector(puck.last.x, puck.last.y), 
  0, puck.radius);

  // Colliding balls 1 and 2
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

void reset(int winner) {
  player1.reset(new PVector(width*3/4, height/2));
  player2.reset(new PVector(width/4, height/2));
  puck.reset(new PVector(width/2+winner*(width/8), random(height/4, height*3/4)));
}

void skynet(Ball tb, Ball tp, Ball opp,int side){
  PVector ratio = new PVector(0, 0);
  // -1 for left, 1 for right
  if(tp.pos.y != tb.pos.y) ratio.y += getSign(tp.pos.y-tb.pos.y);
  if(tp.pos.x != tb.pos.x) ratio.x += getSign(side*12+tp.pos.x-tb.pos.x);
  
  if(tp.pos.y != opp.pos.y) ratio.y += .02*getSign(tp.pos.y-opp.pos.y);
  
  if(ratio.x != 0) tb.pos.x += (gVel) * getSign(ratio.x) * sqrt(abs(ratio.x)) / (abs(ratio.x)+abs(ratio.y));
  if(ratio.y != 0) tb.pos.y += (gVel) * getSign(ratio.y) * sqrt(abs(ratio.y)) / (abs(ratio.x)+abs(ratio.y));
}

float getSign(float num) {return num/abs(num);}
// Smashball Balls
class Ball {
  // Initializing class variables
  PVector pos, last;
  private int hue, radius;

  // Constructor for the ball:
  // t is the starting position
  // tl is the delta position
  // th is hue
  // tr is radius
  Ball(PVector t, PVector tl, int th, int tr) {
    pos   = t;
    last  = tl;
    hue = th;
    radius = tr;
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

      // 2d elastic collision equation with movement
      last.x = pos.x-gElas*(v2*cos(ang2-phi)*cos(phi)+v1*sin(ang1-phi)*cos(phi+PI/2));
      last.y = pos.y-gElas*(v2*cos(ang2-phi)*sin(phi)+v1*sin(ang1-phi)*sin(phi+PI/2));

      tick();
    }
  }

  void bounceY(float bound) {
    last.y = bound + gElas * (pos.y - last.y);
    pos.y  = bound;
  }

  void bounceX(float bound) {
    last.x = bound + gElas * (pos.x - last.x);
    pos.x  = bound;
  }

  void reset(PVector t) {
    pos    = t;
    last.x = pos.x;
    last.y = pos.y;
  }
}

// Detects active keys
void gameKeyPressed() {
  // Null cancelling movement:
  // When 
  if (key == CODED) {
    if (keyCode == UP) {
      keyup = true;    
      keydown = false;
    }
    if (keyCode == LEFT) {
      keyleft = true;  
      keyright = false;
    }
    if (keyCode == RIGHT) {
      keyright = true; 
      keyleft = false;
    }
    if (keyCode == DOWN) {
      keydown = true;  
      keyup = false;
    }
  }

  if (key == 'w' || key == 'W') {
    keyw = true; 
    keys = false;
  }
  if (key == 'a' || key == 'A') {
    keya = true; 
    keyd = false;
  }
  if (key == 'd' || key == 'D') {
    keyd = true; 
    keya = false;
  }
  if (key == 's' || key == 'S') {
    keys = true; 
    keyw = false;
  }
  if (key == 'r' || key == 'R') reset(0);
}

// Detects when keys go inactive
void gameKeyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
    if (keyCode == DOWN) keydown = false;
  }

  if (key == 'w' || key == 'W') keyw = false;
  if (key == 'a' || key == 'A') keya = false;
  if (key == 'd' || key == 'D') keyd = false;
  if (key == 's' || key == 'S') keys = false;
}

// A shit ton of nested conditionals

void arrowKeys(Ball tb) {
  // Controls balls with keys
  // Test ball 1
  if (keydown == true) 
    // Limits poseration when two directions are active
    if (keyleft == true || keyright == true) 
      tb.pos.y += gVel/sqrt(2);
    else 
      tb.pos.y += gVel;
  else if (keyup == true) { 
    if (keyleft == true || keyright == true) 
      tb.pos.y -= gVel/sqrt(2);
    else 
      tb.pos.y -= gVel;
  }

  if (keyright == true) 
    if (keyup == true || keydown == true) 
      tb.pos.x += gVel/sqrt(2);
    else 
      tb.pos.x += gVel;
  else if (keyleft == true) {
    if (keyup == true || keydown == true) 
      tb.pos.x -= gVel/sqrt(2);
    else 
      tb.pos.x -= gVel;
  }
}

void wasd(Ball tb) {
  // Test ball 2
  if (keys == true)
    if (keya == true || keyd == true) 
      tb.pos.y += gVel/sqrt(2);
    else  
      tb.pos.y += gVel;
  else if (keyw == true) {  
    if (keya == true || keyd == true) 
      tb.pos.y -= gVel/sqrt(2);
    else 
      tb.pos.y -= gVel;
  }

  if (keyd == true) 
    if (keyw == true || keys == true) 
      tb.pos.x += gVel/sqrt(2);
    else 
      tb.pos.x += gVel;
  else if (keya == true) {
    if (keyw == true || keys == true) 
      tb.pos.x -= gVel/sqrt(2);
    else 
      tb.pos.x -= gVel;
  }
}



