
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;

int keyX = 400;
int keyY = 400;
int result;

int tX, tsX, tsY, tvelX, tminV, tmaxV;  
                               
float tY, tvelY;

color alive = color(   0, 255,   0 );
color type1 = color(   0, 255, 255 );
color type2 = color( 255,   0, 255 );
color type3 = color( 255, 255,   0 );
color dead  = color(   0,   0,   0 );
color hit   = color( 255,   0,   0 );
color on    = color( 255,   0,   0 );
color off   = color(   0,   0,   0 );
color cannon;
color enemy = alive;

int     NUM_TARGETS = 55;
int[]   targetOffsX = new int[NUM_TARGETS];
int[]   targetOffsY = new int[NUM_TARGETS];
color[] targetColor = new color[NUM_TARGETS];
color[] targetType  = new color[NUM_TARGETS];

int numDead;

int   NUM_BURSTS = 32;
int[] bX = new int[NUM_BURSTS];
int[] bY = new int[NUM_BURSTS];
int[] bVx = new int[NUM_BURSTS];
int[] bVy = new int[NUM_BURSTS];
int   nextBurst = 0;
int   fired, elapsed;

int aFired, aElapsed, aNext, aNextScale, aNextTranslate;

PFont font;

int startLevel = 0;
int playLevel  = 1;
int endLevel   = 2;
int mode;

int score;

int rx = 200;
int ry = 200;
int gx = 600;
int gy = 200;
int bx = 400;
int by = 600;

Player_ship player001;


void setup() {
  size( 800, 800 );
  frameRate( 30 );
  smooth();
  result = 0;

  tX   = width/2;
  tY   =  0.0;
  tsX  = 24;
  tsY  = 28;
  tminV = 4;
  tmaxV = 24;
  tvelX = tminV;
  tvelY = 8;
  numDead = 0;
  score = 0;
  fired = millis();
//  reload = 250;
  aFired = millis();
  aNextScale     = 1000;
  aNextTranslate =  500;
  aNext  = int( random(aNextScale) + aNextTranslate );
  
  for ( int i=0; i<NUM_TARGETS; i++ ) {
    int w = width/2;
    int s = w/11;
    int c = s/2;
    
    targetOffsX[i] = (c + ((i)*s)) - (w/2);
    targetOffsY[i] = height/2 - ( (i/11) * 48 );
    targetColor[i] = alive;
    if ( i/11 < 2 ) {
      targetType[i] = type1;
    } else if ( i/11 < 4 ) {
      targetType[i] = type2;
    } else {
      targetType[i] = type3;
    }
  }
  
  for ( int i=0; i<NUM_BURSTS; i++ ) {
    bX[i] =  0;
    bY[i] = -8;
  }
  
  player001 = new Player_ship(400,400);


  
  mode = startLevel;
}

void keyPressed(){
  switch(key) {
    case('w'):case('W'):result |=NORTH;break;
    case('d'):case('D'):result |=EAST;break;
    case('s'):case('S'):result |=SOUTH;break;
    case('a'):case('A'):result |=WEST;break;
  }
}

void keyReleased() {
  switch(key) {
    case('w'):case('W'):result ^=NORTH;break;
    case('d'):case('D'):result ^=EAST;break;
    case('s'):case('S'):result ^=SOUTH;break;
    case('a'):case('A'):result ^=WEST;break;
  }
//  if ( key == 's'  || key == 'S' ) {
//    soundsOn = !soundsOn;
//  }
}


//public void stop() {
//  shoot.close();
//  kill.close();
//  super.stop();
//}


void draw() { 
//  if ( mode == playLevel ) {
//    drawLevel();
//  } else if ( mode == startLevel ) {
//    drawStart();
//  } else if ( mode == endLevel ) {
//    drawEnd();
//  }
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
    player001.drawPlayer();
  
    for (int j=0; j<NUM_BURSTS; j++ ) {
    
    if ( bVx[j] < 0 ) {                  // burst fired from player
      
      for ( int i=0; i<NUM_TARGETS; i++ ) {    // check against aliens
        if ( ( enemy == alive )  &&   // target alive?
             (dist( rx, ry, bX[j], bY[j] ) < 3*tsX/4 || dist( gx, gy, bX[j], bY[j] ) < 3*tsX/4 | dist( bx, by, bX[j], bY[j] ) < 3*tsX/4 )) {   
          targetColor[i] = dead;      // change state
          bY[j] = -10;                // and get rid of the burst
          bX[j] = -10; 
          numDead++;
          score++;
        }
      }
      
    } else if ( bVy[j] < 0 ) {                  // burst fired from player
      
      for ( int i=0; i<NUM_TARGETS; i++ ) {    // check against aliens
        if ( ( enemy == alive )  &&   // target alive?
             (dist( rx, ry, bX[j], bY[j] ) < 3*tsX/4 || dist( gx, gy, bX[j], bY[j] ) < 3*tsX/4 | dist( bx, by, bX[j], bY[j] ) < 3*tsX/4 )) {   
          targetColor[i] = dead;      // change state
          bY[j] = -10;                // and get rid of the burst
          bX[j] = -10; 
          numDead++;
          score++;
        }
      }
      
    } else if ( bVx[j] > 0 ) {                  // burst fired from player
      
      for ( int i=0; i<NUM_TARGETS; i++ ) {    // check against aliens
        if ( ( enemy == alive )  &&   // target alive?
             (dist( rx, ry, bX[j], bY[j] ) < 3*tsX/4 || dist( gx, gy, bX[j], bY[j] ) < 3*tsX/4 | dist( bx, by, bX[j], bY[j] ) < 3*tsX/4 )) {   
          targetColor[i] = dead;      // change state
          bY[j] = -10;                // and get rid of the burst
          bX[j] = -10; 
          numDead++;
          score++;
        }
      }
      
    } else if ( bVy[j] > 0 ) {                  // burst fired from player
      
      for ( int i=0; i<NUM_TARGETS; i++ ) {    // check against aliens
        if ( ( enemy == alive )  &&   // target alive?
             ((dist( rx, ry, bX[j], bY[j] )) < 3*tsX/4 || (dist( gx, gy, bX[j], bY[j] )) < 3*tsX/4 | (dist( bx, by, bX[j], bY[j] ) < 3*tsX/4 ))) {   
          targetColor[i] = dead;      // change state
          bY[j] = -10;                // and get rid of the burst
          bX[j] = -10; 
          numDead++;
          score++;
        }
      }
      
    }
  }
  
        if (rx > keyX){
          rx--;
        } else if (rx < keyX){
          rx++;
        } 
        
        if (ry > keyY){
          ry--;
        } else if (ry < keyY){
          ry++;
        }
        
                if (gx > keyX){
          gx--;
        } else if (gx < keyX){
          gx++;
        } 
        
        if (gy > keyY){
          gy--;
        } else if (gy < keyY){
          gy++;
        }
        
                if (bx > keyX){
          bx--;
        } else if (bx < keyX){
          bx++;
        } 
        
        if (by > keyY){
          by--;
        } else if (by < keyY){
          by++;
        }
        fill(enemy);
        rect(rx, ry, 20,20);
        rect(gx, gy, 20,20);
        rect(bx, by, 20,20);

//        if ( dist( rx, ry, keyX, keyY ) < 32 ) {
//          alive = dead;
////          bY = -10;
//      } else if ( dist( gx, gy, keyX, keyY ) < 32 ) {
//          alive = dead;
////          bY = -10;
//      } else if ( dist( bx, by, keyX, keyY ) < 32 ) {
//          alive = dead;
////          bY = -10;
//      }
//      
//      if ( dist( vx, vy, rx, ry ) < 32 ) {
//          enemy = dead;
////          bY = -10;
//      }
//      if ( dist( vx, vy, gx, gy ) < 32 ) {
//          enemy = dead;
////          bY = -10;
//      }
//      if ( dist( vx, vy, bx, by ) < 32 ) {
//          enemy = dead;
////          bY = -10;
//      }
  


}





class Player_ship {
  int lwsize = 8;
  int bsX = lwsize;
  int bsY = lwsize;
  int w1 = lwsize;
  int h1 = lwsize*4;
  int w2 = lwsize*6;
  int h2 = lwsize*2;
  int offs = lwsize;
  
  int speed = 9;
  
  int reload = 250;
  
  Player_ship(int keyX, int keyY) {
  }
  
  void drawPlayer () {
    checkKey();
    checkShot();
    moveShot();
    drawShip();
    drawShot();
    drawCross();
    
    
    
  }

  void checkKey () {
    switch(result) {
      case NORTH: keyY=keyY-speed; break;
      case EAST: keyX=keyX+speed; break;
      case SOUTH: keyY=keyY+speed; break;
      case WEST: keyX=keyX-speed; break;
      case NORTH|EAST: keyY=keyY-speed; keyX=keyX+speed; break;
      case NORTH|WEST: keyY=keyY-speed; keyX=keyX-speed; break;
      case SOUTH|EAST: keyY=keyY+speed; keyX=keyX+speed; break;
      case SOUTH|WEST: keyY=keyY+speed; keyX=keyX-speed; break;
    }
    keyX = constrain(keyX, 20, 780);
    keyY = constrain(keyY, 20, 780); 
  }


  void checkShot () {
    elapsed = millis() - fired;
    if ( elapsed > reload  &&  mousePressed  &&  mouseButton == LEFT ) {
      float vx = (mouseX - keyX);
      float vy = (mouseY - keyY);
      float lv = sqrt((vx * vx) + (vy * vy));
      vx = vx / lv;
      vy = vy / lv;
      vx = vx * 10;
      vy = vy * 10;
      bX[nextBurst] = keyX;
      bY[nextBurst] = keyY;
      bVx[nextBurst] = int(vx);
      bVy[nextBurst] = int(vy);
      nextBurst = ( nextBurst + 1 ) % NUM_BURSTS;
      fired = millis();
    }
  }
  
  void moveShot () {
    for (int i=0; i<NUM_BURSTS; i++ ) {
      bX[i] += bVx[i];
      bY[i] += bVy[i];
      constrain( bY[i], -2000, 2000 );
      constrain( bX[i], -2000, 2000 );
    }
  }
  
  void drawShip () {
    noStroke();
    fill( alive );  
    rect( keyX, keyY, w1, h1 );
    rect( keyX, keyY+offs, w2, h2 );
  }
  
  void drawShot () {
    noStroke();
    fill( 255 );  
    for ( int i=0; i<NUM_BURSTS; i++ ) {
      ellipse( bX[i], bY[i], bsX, bsY );
    }
  }
  
  void drawCross () {
    stroke(255);
    strokeWeight(1);
    line(mouseX,mouseY-5,mouseX,mouseY-25);
    line(mouseX+5,mouseY,mouseX+25,mouseY);
    line(mouseX-5,mouseY,mouseX-25,mouseY);
    line(mouseX,mouseY+5,mouseX,mouseY+25);
    noFill();
    ellipse(mouseX,mouseY,15,15);
    strokeWeight(2);
    ellipse(mouseX,mouseY,40,40);
  }
  
}
