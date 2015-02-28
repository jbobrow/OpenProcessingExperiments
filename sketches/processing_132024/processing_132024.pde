
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
final float gAcc     = 0.1;
final float gAccFric = 0.5;
final float gVelFric = 0.98;
final float gElas    = 1;

// Temp test balls
Ball test1;
Ball test2;

void setup() {
  size(512, 512);
  frameRate(60);
  colorMode(HSB);

  // Constructs test balls
  test1 = new Ball(384, 256, 384, 256, 64);
  test2 = new Ball(128, 256, 128, 256, 192);
}

void draw() {
  background(128);

  // Ticks and renders test balls
  test1.tick();
  test2.tick();

  test1.render();
  test2.render();
  
  arrowKeys(test1);
  wasd(test2);
  
  // Passing test 1 and 2 to temp balls
  Ball tempb1 = new Ball(test1.xpos, test1.ypos, test1.lastx, test1.lasty, 0);
  Ball tempb2 = new Ball(test2.xpos, test2.ypos, test2.lastx, test2.lasty, 0);

  // Colliding balls 1 and 2
  test1.collide(tempb2);
  test2.collide(tempb1);

  // Shows active framerate
  fill(75, 255, 255);
  textSize(12);
  text("FPS:" + floor(frameRate), width-64, height-8);
}

// Input
void keyPressed() {
  gameKeyPressed();
}

void keyReleased() {
  gameKeyReleased();
}

// Smashball Balls
class Ball {
  float xpos, ypos, lastx, lasty, accelx, accely;
  int hue;

  // Constructor for the ball:
  // tx and ty are the starting x positions
  // tlx and tly are for passing information into temp balls
  // th is hue
  Ball(float tx, float ty, float tlx, float tly, int th) {
    xpos = tx;
    ypos = ty;
    hue = th;
    lastx = tlx;
    lasty = tly;
    accelx = 0;
    accely = 0;
  }

  // Simulates ball actions (such as movement and stuff)
  void tick() {
    accelx *= gAccFric;
    accely *= gAccFric;
    float tx = xpos;
    float ty = ypos;

    // Verlet integration formulas for discrete physics simulations
    xpos = xpos + gVelFric*((xpos - lastx) + 0.5 * accelx);
    ypos = ypos + gVelFric*((ypos - lasty) + 0.5 * accely);

    lastx = tx;
    lasty = ty;

    if (xpos > width || xpos < 0)  lastx = xpos + gElas * (xpos - lastx);
    if (ypos > height || ypos < 0) lasty = ypos + gElas * (ypos - lasty);
  }

  // Displays the ball
  void render() {
    fill(hue, 255, 128);
    ellipse(xpos, ypos, 16, 16);
  }

  void collide(Ball hit) {
    if (dist(hit.xpos, hit.ypos, xpos, ypos) < 16) {
      // Phi is the contact angle
      float phi = atan2(hit.ypos - ypos, hit.xpos - xpos);

      // v is the velocity of the corresponding ball
      // ang is the direction of movement for the ball
      float v1 = dist(xpos, ypos, lastx, lasty);
      float ang1 = atan2(ypos - lasty, xpos - lastx);
      float v2 = dist(hit.xpos, hit.ypos, hit.lastx, hit.lasty);
      float ang2 = atan2(hit.ypos - hit.lasty, hit.xpos - hit.lastx);

      // 2d elastic collision equation with movement
      lastx = xpos-gElas*(v2*cos(ang2-phi)*cos(phi)+v1*sin(ang1-phi)*cos(phi+PI/2));
      lasty = ypos-gElas*(v2*cos(ang2-phi)*sin(phi)+v1*sin(ang1-phi)*sin(phi+PI/2));

      tick();
    }
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

  if (key == 'w') {
    keyw = true; 
    keys = false;
  }
  if (key == 'a') {
    keya = true; 
    keyd = false;
  }
  if (key == 'd') {
    keyd = true; 
    keya = false;
  }
  if (key == 's') {
    keys = true; 
    keyw = false;
  }
}

// Detects when keys go inactive
void gameKeyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
    if (keyCode == DOWN) keydown = false;
  }

  if (key == 'w') keyw = false;
  if (key == 'a') keya = false;
  if (key == 'd') keyd = false;
  if (key == 's') keys = false;
}

// A shit ton of nested conditionals

void arrowKeys(Ball tb){
// Controls balls with keys
  // Test ball 1
  if (keydown == true) 
    // Limits acceleration when two directions are active
    if (keyleft == true || keyright == true) 
      tb.accely += gAcc/sqrt(2);
    else 
      tb.accely += gAcc;
  else {
    if (keyup == true) 
      if (keyleft == true || keyright == true) 
        tb.accely -= gAcc/sqrt(2);
      else 
        tb.accely -= gAcc;
  }

  if (keyright == true) 
    if (keyup == true || keydown == true) 
      tb.accelx += gAcc/sqrt(2);
    else 
      tb.accelx += gAcc;
  else {
    if (keyleft == true) 
      if (keyup == true || keydown == true) 
        tb.accelx -= gAcc/sqrt(2);
      else 
        tb.accelx -= gAcc;
  }
}

void wasd(Ball tb){
  // Test ball 2
  if (keys == true)
    if (keya == true || keyd == true) 
      tb.accely += gAcc/sqrt(2);
    else  
      tb.accely += gAcc;
  else {
    if (keyw == true)  
      if (keya == true || keyd == true) 
        tb.accely -= gAcc/sqrt(2);
      else 
        tb.accely -= gAcc;
  }

  if (keyd == true) 
    if (keyw == true || keys == true) 
      tb.accelx += gAcc/sqrt(2);
    else  tb.accelx += gAcc;
  else {
    if (keya == true)  
      if (keyw == true || keys == true) 
        tb.accelx -= gAcc/sqrt(2);
      else tb.accelx -= gAcc;
  }
}
class Wall{
  
  Wall(){
    
  }
  
}


