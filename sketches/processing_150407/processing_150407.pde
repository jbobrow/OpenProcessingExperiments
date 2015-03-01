
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17115*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
final int WIDTH = 30;
final int HEIGHT = 23;
int[][] level = new int[HEIGHT][WIDTH];
boolean text1 = true;
Player p1;
boolean on= true;

//booleans for key presses to get a simple yes or no press and 
//to not have to worry about the a,aaaaaaaaaaaaa thing
boolean right = false, left = false, up = false;

void setup() {
  size(480,368);
  p1 = new Player(WIDTH*8,HEIGHT*8); //put the player in the middle of the window
  
}
void draw() {
  background(255);
  p1.update();
block(240,169);
  println(WIDTH);
   drawLevel();
  
  p1.show();
  
   if (text1==true){
    fill(0);
    textSize(18);
    textAlign(CENTER);
    text("Use Arrow Keys to Move", WIDTH*8,HEIGHT*8);
  }
}

void drawLevel(){
  fill(0);
  noStroke();
  for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) { 
      switch(level[iy][ix]) {
        case 1: rect(ix*16,iy*16,16,16); break;
        case 0: level[iy][ix]=0; break;
      }
    }
  }
}



boolean place_free(int xx,int yy) {
//checks if a given point (xx,yy) is free (no block at that point) or not
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
  text1=false; 
  switch(keyCode) {
    case RIGHT: right = true; on=true; break;
    case LEFT: left = true; on=true;break;
    case UP: up = true; break;
  }
}
void keyReleased() {
  switch(keyCode) {
    case RIGHT: right = false; break;
    case LEFT: left = false; break;
    case UP: up = false; break;
  }
}
/*void mousePressed() {
//Left click creates/destroys a block
  if ( mouseButton == LEFT ) {
    level[int(floor(mouseY/16.0))][int(floor(mouseX/16.0))] ^= 1;
  }
}*/

void block(int lX,int lY){
  if (on==false){
  level[int((lY/8))][int(xxx)] = 0;
  xxx =((lX/16)+p1.pX/16); 
  on=true;
  on=false;
  on=true;
}
if (on==true){
  xxx =((lX/16)+p1.pX/16); 
  level[int((lY/8))][int(xxx)] = 1;
  on=false;
  on=true;
  on=false;
}
}

void loadLevel(){
  //block(0,368-16);
}
class Player {
  int x,y;
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  int pX=0;
  Player(int _x, int _y ) {
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 2;
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
    else { //neither right or left pressed, decelerate
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
      if ( !place_free(x,y+16) || !place_free(x+15,y+16) ) {
        ySpeed = -5.3;
      }
    }
    
    ySpeed += gravity;
    
    /*
    // The technique used for movement involves taking the integer (without the decimal)
    // part of the player's xSpeed and ySpeed for the number of pixels to try to move,
    // respectively.  The decimal part is accumulated in xSave and ySave so that once
    // they reach a value of 1, the player should try to move 1 more pixel.  This jump
    // is not normally visible if it is moving fast enough.  This method is used because
    // is guarantees that movement is pixel perfect because the player's position will
    // always be at a whole number.  Whole number positions prevents problems when adding
    // new elements like jump through blocks or slopes.
    */
    xRep = 0; //should be zero because the for loops count it down but just as a safety
    yRep = 0;
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    ySave += abs(ySpeed)-floor(abs(ySpeed));
    int signX = (xSpeed<0) ? -1 : 1;
    int signY = (ySpeed<0) ? -1 : 1;
    //when the player is moving a direction collision is tested for only in that direction
    //the offset variables are used for this in the for loops below
    int offsetX = (xSpeed<0) ? 0 : 15;
    int offsetY = (ySpeed<0) ? 0 : 15;
    
    if ( xSave >= 1 ) {
      xSave -= 1;
      xRep++;
    }
    if ( ySave >= 1 ) {
      ySave -= 1;
      yRep++;
    }
    
    for ( ; yRep > 0; yRep-- ) {
      if ( place_free(x,y+offsetY+signY) && place_free(x+15,y+offsetY+signY) ) {
        y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    for ( ; xRep > 0; xRep-- ) {
      if ( place_free(x+offsetX+signX,y) && place_free(x+offsetX+signX,y+15) ) {
        x += signX;
        pX-=signX;
      }
      else {
        xSpeed = 0;
      }
    }
      
  }
  void show() {
    pushMatrix();
    fill(255,0,0);
    noStroke();
    rect(x,y,16,16);
    popMatrix();
  }
}


