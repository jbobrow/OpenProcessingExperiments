
Button button1, button2, button3;
int mode = 1;
PFont font;
float i = 0;
final int WIDTH = 20;
final int HEIGHT = 50;
int[][] level = new int[HEIGHT][WIDTH];
boolean right = false, left = false, up = false;
Player p1;

void setup() {
  size(270, 825);
  smooth();
  noStroke ();
  background(255);
  p1 = new Player(10, 750);
  
  button1= new Button (5, 600, 15, color (204), color (0), color (255));
  button2= new Button (10, 750, 15, color (204), color (0), color (255));
  button3= new Button (15, 825, 15, color (204), color (0), color (255));

  level[int(floor(49.5))][int(floor(0.0))] ^= 1;
  level[int(floor(49.5))][int(floor(8.0))] ^= 1;
  level[int(floor(49.5))][int(floor(5.0))] ^= 1;
  level[int(floor(49.5))][int(floor(9.0))] ^= 1;
  level[int(floor(43.0))][int(floor(5.0))] ^= 1;
  level[int(floor(37.0))][int(floor(1.0))] ^= 1;
  level[int(floor(40.0))][int(floor(3.0))] ^= 1;
  level[int(floor(33.0))][int(floor(2.0))] ^= 1;
  level[int(floor(35.0))][int(floor(5.0))] ^= 1;
  level[int(floor(30.0))][int(floor(4.0))] ^= 1;
  level[int(floor(49.0))][int(floor(1.0))] ^= 1;
  level[int(floor(49.0))][int(floor(3.0))] ^= 1;
  level[int(floor(47.0))][int(floor(5.0))] ^= 1;
  level[int(floor(45.0))][int(floor(10.0))] ^= 1;
  level[int(floor(24.0))][int(floor(10.0))] ^= 1;
  level[int(floor(27.0))][int(floor(7.0))] ^= 1;
  level[int(floor(37.0))][int(floor(7.0))] ^= 1;
  level[int(floor(21.0))][int(floor(7.0))] ^= 1;
  level[int(floor(18.0))][int(floor(5.0))] ^= 1;
  level[int(floor(15.0))][int(floor(7.0))] ^= 1;
  level[int(floor(12.0))][int(floor(5.0))] ^= 1;
  level[int(floor(9.0))][int(floor(7.0))] ^= 1;
  level[int(floor(6.0))][int(floor(5.0))] ^= 1;
  level[int(floor(3.0))][int(floor(7.0))] ^= 1;
   level[int(floor(3.0))][int(floor(9.0))] ^= 1;
}

void manageButtons() {
              button1.update();
              button2.update();
              button3.update();
              button1.display();
              button2.display();
              button3.display();
}
void mousePressed() {
              if (button1.press() == true) { mode = 1; }
              if (button2.press() == true) { mode = 2; }
              if (button3.press() == true) { mode = 3; }
}
void mouseReleased() {
              button1.release();
              button2.release();
              button3.release();
}

void draw() {
  background(255);
  p1.update();
  p1.display();
  drawLevel();
  fill(220);
      if (mode == 1) {
                ellipse(0, 40, 60, 60);
              } else if (mode == 2) {
                ellipse(50, 40, 60, 60);
              } else if (mode == 3) {
                ellipse(100, 40, 60, 60);
}
}

void drawLevel() {
  fill(0);
  noStroke();
  for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) {
      switch(level[iy][ix]) {
      case 1: 
        rect(ix*16, iy*16, 16, 8);
      case 2:
        rect(ix*16, iy*16, 32, 8);
      }
    }
  }
}

boolean place_free(int xx, int yy) {
  yy = int(floor(yy/16.0));
  xx = int(floor(xx/16.0));
  if ( xx > -1 && xx < level[0].length && yy > -3 && yy < level.length ) {
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
    fill (255, 0,0);
    smooth();
    rect(x, y, 16, 16);
    popMatrix();

    
}
}




class Button {
int x, y;
int size;
color baseGray;
color overGray;
color pressGray;
boolean over = false;
boolean pressed = false;

Button (int xp, int yp, int s, color b, color o, color p){
    x = xp;
    y = yp;
    size = s;
    baseGray = b;
    overGray = o;
    pressGray = p;
}
  void update() {
    if ((mouseX >= x) && (mouseX <= x+size) &&
        (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } else {
      over = false;
} }

boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } else {
      return false;
    }
}
void release() {
pressed = false; 
}

  void display() {
    if (pressed == true) {
      fill(pressGray);
    } else if (over == true) {
      fill(overGray);
    } else {
      fill(baseGray);
    }
    stroke(255);
    rect(5, 600, size, size);
    rect(55, 462, size, size);
  }
}


