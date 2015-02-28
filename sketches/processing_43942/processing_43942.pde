
float x = 250;
float y = 200;
float xspeed = 3;
float yspeed = 3;
int rBat = 200;
int lBat = 200;
boolean[] keys = new boolean[4];
final int W = 0;
final int S = 1;
final int U = 2;
final int D = 3;

void setup() {
  size(500, 400);
  smooth();
  rectMode(CENTER);
  for (int i = 0; i< 4; i++) {
    keys[i] = false;
  }
}

void draw() {
  background(#F72807);
  stroke(255);
  move();
  ball();
  collide();
  bat(15, lBat, 100);
  bat(485, rBat, 100);

  if (keys[W] == true) {
    lBat = max(35, lBat - 4);
  }

  if (keys[S] == true) {
    lBat = min (365, lBat + 4);
  }

  if (keys[U] == true) {
    rBat = max(35, rBat - 4);
  }

  if (keys[D] == true) {
    rBat = min(365, rBat +4);
  }
}
void keyPressed() {
  if (key == 'w') {
    keys[W] = true;
  } 
  else if (key == 's') {
    keys[S] = true;
  } 
  else if (keyCode == UP) {
    keys[U] = true;
  } 
  else if (keyCode == DOWN) {
    keys[D] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    keys[W] = false;
  } 
  else if (key == 's') {
    keys[S] = false;
  } 
  else if (keyCode == UP) {
    keys[U] = false;
  } 
  else if (keyCode == DOWN) {
    keys[D] = false;
  }
} 

void move() {

  x = x + xspeed;
  y = y + yspeed;
}

void ball() {

  stroke(0);
  fill(0);
  ellipse(x, y, 30, 30);
}

void collide() {

  if(x == 468 && y >= rBat-50 && y <= rBat+50) {  
    if (y < rBat) {
      xspeed = xspeed * -1;
    }
    if (x == 32 && y >= lBat-40 && y <= lBat+40) {
      xspeed = xspeed * 1;
    }
  }
    if ((y>385) || (y < 15 )) {
      yspeed = yspeed *-1;
    }
  }

  void bat(int x, int y, int Size) {
    rectMode(CENTER);
    stroke(0);
    fill(0);
    rect(x, y, Size/6, Size);
  }


