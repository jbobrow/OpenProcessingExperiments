
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/72761*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17115*@* */

float i = 0;

final int WIDTH = 17;
final int HEIGHT = 51;
int[][] level = new int[HEIGHT][WIDTH];
boolean right = false, left = false, up = false;
Player p1;

void setup() {
  size(270, 825);
  noStroke ();
  background(250);
  p1 = new Player(10, 750);
  //p1 = new Player (135, 60); 
  
  
  level[int(floor(49.0))][int(floor(1.0))] ^= 1;
  level[int(floor(49.0))][int(floor(8.0))] ^= 1;
  level[int(floor(49.0))][int(floor(5.0))] ^= 1;
level[int(floor(46.0))][int(floor(5.0))] ^= 1;
}

void draw() {
  background(250);
  p1.update();
  p1.display();
  drawLevel();
  
  fill(220);


  
  

  
  
}

void drawLevel() {
  fill(0);
  noStroke();
  for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) {
      switch(level[iy][ix]) {
      case 1: 
        rect(ix*16, iy*16, 16, 8);
      }
    }
  }
}


boolean place_free(int xx, int yy) {
  yy = int(floor(yy/16.0));
  xx = int(floor(xx/16.0));
  if ( xx > -1 && xx < level[0].length && yy > -1 && yy < level.length ) {
    if ( level[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT: 
    right = true; 
    break;
  case LEFT: 
    left = true; 
    break;
  case UP: 
    up = true; 
    break;
  }
}  

void keyReleased() {
  switch(keyCode) {
  case RIGHT: 
    right = false; 
    break;
  case LEFT: 
    left = false; 
    break;
  case UP: 
    up = false; 
    break;
  }
}

class Player {
  int x, y;
  float xSpeed, ySpeed;
  float accel, deccel;
  float maxXspd, maxYspd;
  float xSave, ySave;
  int xRep, yRep;
  float gravity;
  Player(int _x, int _y ) {
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 3;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.25;
  }
  void update() {
    if ( right ) {
      xSpeed += accel;
      if ( xSpeed > maxXspd ) {
        xSpeed = maxXspd;
      }
    }
    else if ( left ) {
      xSpeed -= accel;
      if ( xSpeed < -maxXspd ) {
        xSpeed = -maxXspd;
      }
    }
    else { 
      if ( xSpeed > 0 ) {
        xSpeed -= deccel;
        if ( xSpeed < 0 ) {
          xSpeed = 0;
        }
      }
      else if ( xSpeed < 0 ) {
        xSpeed += deccel;
        if ( xSpeed > 0 ) {
          xSpeed = 0;
        }
      }
    }

    if ( up ) {
      if ( !place_free(x, y+16) || !place_free(x+15, y+16) ) {
        ySpeed = -5.3;
      }
    }

    ySpeed += gravity;
    xRep = 0;
    yRep = 0;
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    ySave += abs(ySpeed)-floor(abs(ySpeed));
    int signX = (xSpeed < 0) ? -1 : 1;
    int signY = (ySpeed < 0) ? -1 : 1;
    int offsetX = (xSpeed < 0) ? 4 : 15;
    int offsetY = (ySpeed < 0) ? 4 : 15;

    if ( xSave >= 132 ) {
      xSave -= 1;
      xRep++;
    }
    if ( ySave >= 1 ) {
      ySave -= 1;
      yRep++;
    }

    for ( ; yRep > 0; yRep-- ) {
      if ( place_free(x, y+offsetY+signY) && place_free(x+15, y+offsetY+signY) ) {
        y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+offsetX+signX, y) && place_free(x+offsetX+signX, y+15) ) {
        x += signX;
      }
      else {
        xSpeed = 0;
      }
    }
  }
  void display() {
    pushMatrix();
    ellipseMode (CORNER);
    fill(250, 150, 0);
    smooth();
    ellipse(x, y, 16, 16);
    popMatrix();

    
}
}


