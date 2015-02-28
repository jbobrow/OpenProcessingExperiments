
/* 
 * Improved control of on-screen objects using the keys.
 * 
 * This is achieved by keeping track of whether a key has been pressed
 * or released, resorting to the native Processing functions 
 * keyPressed() and keyReleased() as well as global variebles to store the
 * state of each key. Some systems, however, do not register more than 2 or
 * 3 keys pressed simultaneously.
 */

boolean bKey_up    = false;
boolean bKey_down  = false;
boolean bKey_left  = false;
boolean bKey_right = false;
boolean bKey_space = false;

float avatar_x = 0;
float avatar_y = 0;

void setup() {
  size(300, 300);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);
  fill(255);
  
  if (bKey_up)    avatar_y--;
  if (bKey_down)  avatar_y++;
  if (bKey_left)  avatar_x--;
  if (bKey_right) avatar_x++;
  if (bKey_space) fill(#FF0000);
  
  rect(avatar_x, avatar_y, 20, 20);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      bKey_up = true;
    }
    else if (keyCode == DOWN) {
      bKey_down = true;
    }
    else if (keyCode == LEFT) {
      bKey_left = true;
    }
    else if (keyCode == RIGHT) {
      bKey_right = true;
    }
  }
  else {
    if (key == ' ') {
      bKey_space = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      bKey_up = false;
    }
    else if (keyCode == DOWN) {
      bKey_down = false;
    }
    else if (keyCode == LEFT) {
      bKey_left = false;
    }
    else if (keyCode == RIGHT) {
      bKey_right = false;
    }
  }
  else {
    if (key == ' ') {
      bKey_space = false;
    }
  }
}
