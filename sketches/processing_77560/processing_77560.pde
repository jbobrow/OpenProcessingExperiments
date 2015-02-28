
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



Player_ship player001;
Enemy_ship enemy000;


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
  aFired = millis();
  aNextScale     = 1000;
  aNextTranslate =  500;
  aNext  = int( random(aNextScale) + aNextTranslate );
  
  for ( int i=0; i<NUM_TARGETS; i++ ) {
    int w = width/2;
    int s = w/11;
    int c = s/2;
    
    targetOffsX[i] = (c + ((i%11)*s)) - (w/2);
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
  enemy000 = new Enemy_ship(200,200);


  
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
}


void draw() { 
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
    player001.drawPlayer();
    enemy000.drawEnemy();
  

}







class Enemy_ship {

  int ex = 200;
  int ey = 200;
  Enemy_ship(int ex, int ey){

}
  
  void drawEnemy () {
    collision();
    position();
    drawShip();
  }
  void collision () {
  for (int j=0; j<NUM_BURSTS; j++ ) {
        for ( int i=0; i<NUM_TARGETS; i++ ) {
          if ( ( enemy == alive )  &&   
               ((dist( ex, ey, bX[j], bY[j] )) < 3*tsX/4)) {   
            targetColor[i] = dead;    
            bY[j] = -10;                
            bX[j] = -10; 
            bVx[j] = 0;
            bVy[j] = 0;
            numDead++;
            score++;
          }
        }
        
    }
  }
  void position() {
          if (ex > keyX){
            ex--;
          } else if (ex < keyX){
            ex++;
          } 
          
          if (ey > keyY){
            ey--;
          } else if (ey < keyY){
            ey++;
          }
  }
  void drawShip () {
            fill(enemy);
            rect(ex, ey, 20,20);
  }
}
class Player_ship {
  int lwsize = 8;
  int bsX = lwsize;
  int bsY = lwsize;
  
  float shiprot = 0;
  
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
    keyY = constrain(keyY, 20, 735); 
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
      shiprot = atan2(mouseY-keyY, mouseX-keyX);
    pushMatrix();
      noStroke();
      pushMatrix();
        fill( alive );
        pushMatrix();
          translate(keyX,keyY);
          pushMatrix();
            rotate(shiprot);
            pushMatrix();
              triangle(15,0,-15,-10,-15,10);
//              rect(0,0,25,50);
            popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
    popMatrix();
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


