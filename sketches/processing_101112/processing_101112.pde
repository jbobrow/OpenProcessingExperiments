
float i = 0;
float time = 0;
float boxX = 0;
float boxY= 0;
float boxSize = 0;
final int WIDTH = 17;
final int HEIGHT = 51;
int[][] level = new int[HEIGHT][WIDTH];
boolean right = false, left = false, up = false;
Player p1;
 
float timer = 40.0;
float gameTimer = 40.0;
 
void setup() {
  size(270, 825);
  background(#F5EEC8);
  p1 = new Player(135, 800);
  //p1 = new Player (135, 60);
 
    
  level[int(floor(49.0))][int(floor(1.0))] ^= 1;
  level[int(floor(49.0))][int(floor(8.0))] ^= 1;
  level[int(floor(49.0))][int(floor(5.0))] ^= 1;
level[int(floor(46.0))][int(floor(5.0))] ^= 1;
level[int(floor(43.0))][int(floor(7.0))] ^= 1;
level[int(floor(43.0))][int(floor(8.0))] ^= 1;
level[int(floor(40.0))][int(floor(3.0))] ^= 1;
level[int(floor(38.0))][int(floor(2.0))] ^= 1;
level[int(floor(38.0))][int(floor(10.0))] ^= 1;
level[int(floor(35.0))][int(floor(16.0))] ^= 1;
level[int(floor(32.0))][int(floor(12.0))] ^= 1;
level[int(floor(32.0))][int(floor(10.0))] ^= 1;
level[int(floor(32.0))][int(floor(11.0))] ^= 1;
level[int(floor(29.0))][int(floor(11.0))] ^= 1;
level[int(floor(28.0))][int(floor(9.0))] ^= 1;
level[int(floor(25.0))][int(floor(4.0))] ^= 1;
level[int(floor(25.0))][int(floor(3.0))] ^= 1;
level[int(floor(25.0))][int(floor(2.0))] ^= 1;
level[int(floor(25.0))][int(floor(1.0))] ^= 1;
level[int(floor(22.0))][int(floor(0.0))] ^= 1;
level[int(floor(20.0))][int(floor(3.0))] ^= 1;
level[int(floor(24.0))][int(floor(13.0))] ^= 1;
level[int(floor(21.0))][int(floor(16.0))] ^= 1;
level[int(floor(19.0))][int(floor(13.5))] ^= 1;
level[int(floor(16.0))][int(floor(11.0))] ^= 1;
level[int(floor(13.0))][int(floor(7.0))] ^= 1;
level[int(floor(13.0))][int(floor(6.0))] ^= 1;
level[int(floor(16.0))][int(floor(2.0))] ^= 1;
level[int(floor(16.0))][int(floor(3.0))] ^= 1;
level[int(floor(5.0))][int(floor(8.0))] ^= 1;
level[int(floor(5.0))][int(floor(9.0))] ^= 1;
level[int(floor(5.0))][int(floor(7.0))] ^= 1;
level[int(floor(10.0))][int(floor(6.0))] ^= 1;
level[int(floor(10.0))][int(floor(5.0))] ^= 1;
level[int(floor(9.0))][int(floor(10.0))] ^= 1;
level[int(floor(7.0))][int(floor(3.0))] ^= 1;
 
fill(#F5EEC8);
 
}


 
 
void draw() {
  background(#F5EEC8);
   
time += 0.0167;
  timer -= 0.0167;
    
   
   
   
  p1.update();
  p1.display();
  drawLevel();
 if (time > 0.5) {
    background(0);
    fill(random(255), random(255), random(255));
    boxX = width/2 -50;
    boxY = height/2-50;
    rect(boxX, boxY, boxSize, boxSize);
    time = 0;
  }
    fill(255);
    textSize(20);
    fill (#0FFADC);
    text("Start:"+ timer,5,25);
  
  
 
 
if (timer <=0) {
  fill(255);
   
  text("LOSER",70,375);
}
  
   
ellipse(10, 800,18,18);
  
}
 
void drawLevel() {
  fill(255);
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
    fill(random(255), random(255),random (255));
    smooth();
    ellipse(x, y, 16, 16);
    popMatrix();
     
    if( y<75 )
    {
      textSize(42);
      text("WINNER",70,375);
       
    }
     
    
     
  }
}




