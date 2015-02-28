
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

    if ( y < 700 ) {
      fill(0, 25, 63, 250);
      rect(0, 700, 270, 165);
    }
    if ( y < 560 ) {
      fill(0, 50, 127, 250);
      rect(0, 560, 270, 165);
    }
    if ( y < 410 ) {
      fill(0, 101, 255, 250);
      rect(0, 410, 270, 165);
    }
    if ( y < 275 ) {
      fill(63, 140, 255, 250);
      rect(0, 275, 270, 165);
    }
    if ( y < 160 ) {
      fill(127, 178, 255, 200);
      rect(0, 160, 270, 165);
    }
    if ( y < 120 ) {
      fill(191, 216, 255, 200);
      rect(0, 120, 270, 65);
    }
    if ( y < 60 ) {
      fill(220, 240, 255, 200);
      rect(0, 120, 270, 12);
    }
  }
}


