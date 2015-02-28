
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;

int keyX = 400;
int keyY = 400;
int result;

PImage boop;
PImage bop;
                               

color alive = color(   0, 255,   0 );
color type1 = color(   0, 255, 255 );
color type2 = color( 255,   0, 255 );
color type3 = color( 255, 255,   0 );
color dead  = color(   0,   0,   0 );
color hit   = color( 255,   0,   0 );
color on    = color( 255,   0,   0 );
color off   = color(   0,   0,   0 );
color ship;
color shipa = color( 43, 124, 231);


int     NUM_TARGETS = 55;
int[]   targetOffsX = new int[NUM_TARGETS];
int[]   targetOffsY = new int[NUM_TARGETS];
color[] targetColor = new color[NUM_TARGETS];
color[] targetType  = new color[NUM_TARGETS];


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

Enemy_ship[] enemies = new Enemy_ship[50];

float[] r1 = {random(49)};
float[] r2 = {random(49)};


void setup() {
  size( 800, 800 );
  frameRate( 30 );
  smooth();
  result = 0;
  boop = loadImage("Unicorn.jpg");
  bop = loadImage("bop.jpg");

  score = 0;
  fired = millis();
  
  player001 = new Player_ship(400,400);

  for (int i = 0; i<enemies.length; i++){
    enemies[i] = new Enemy_ship(int(random(0,800)),int(random(0,800)));
  }

  
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
  imageMode(CENTER);
  
    for (int j=0; j<NUM_BURSTS; j++ ) { //THIS IS YOUR COLLISION. ASSHOLE.
        for ( int i=0; i<3; i++ ) {
          if ( enemies[i].collision( bX[j], bY[j] ) ) {
            bY[j] = -10;                
            bX[j] = -10; 
            bVx[j] = 0;
            bVy[j] = 0;
            score++;
          }
        }
        
    }

        for ( int i=0; i<3; i++ ) {
          if ( enemies[i].enemy == alive && player001.collision( enemies[i].ex, enemies[i].ey ) ) {
           ship = dead;
          }
        }


  
    player001.drawPlayer();
    enemies[0].drawEnemy();
    enemies[1].drawEnemy();
    enemies[2].drawEnemy();
  

}
class Enemy_ship {

  int ex;
  int ey;
  int ev;
  color enemy;
  
  Enemy_ship(int x, int y){
    ex=x;
    ey=y;
    ev=1;
    enemy = alive;
}
  
  void drawEnemy () {
    position();
    drawShip();
  }
  boolean collision (int bX, int bY) {
    if ( ( enemy == alive )  &&   
               ((dist( ex, ey, bX, bY )) < 18)) {
            enemy = dead;    
println( "Enemy_ship.collision(): " + ex + ", " + ey + "   " + bX + ", " + bY );
//            score++;
            return (true);
          }
          return (false);


  }
  void position() {
    if (enemy == alive) {
          if (ex > keyX){
            ex = ex - ev;
          } else if (ex < keyX){
            ex = ex + ev;
          } 
          
          if (ey > keyY){
            ey = ey - ev;
          } else if (ey < keyY){
            ey = ey + ev;
          }
    }
  }
  void drawShip () {
    if (enemy == alive) {
      noStroke();
      fill(enemy);
      image(bop,ex,ey);
//      rect(ex, ey, 20,20);
    }
  }
}


class Form {
  
  
  
  
  
}
class Player_ship {
  int lwsize = 8;
  int bsX = lwsize;
  int bsY = lwsize;
  

  
  float shiprot = 0;
  
  int speed = 9;
  
  int reload = 250;
  
  Player_ship(int keyX, int keyY) {
    ship = shipa;
  }
  
  void drawPlayer () {
    checkKey();
    checkShot();
    moveShot();
    drawShip();
    drawShot();
    drawCross();
  }
  
    boolean collision (int x, int y) {
    if ( ( ship == shipa )  &&   
               ((dist( keyX, keyY, x, y )) < 18)) {
//            ship = dead;    
println( "Player_ship.collision(): " + keyX + ", " + keyY + "   " + x + ", " + y );
//            lives--;
            return (true);
          }
          return (false);
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
    if (ship == shipa) {
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
    if (ship == shipa) {
      shiprot = atan2(mouseY-keyY, mouseX-keyX);
    pushMatrix();
      noStroke();
      pushMatrix();
        fill( ship );
        pushMatrix();
          translate(keyX,keyY);
          pushMatrix();
            rotate(shiprot);
            pushMatrix();
            image(boop,0,0);
//              triangle(15,0,-15,-10,-15,10);
//              rect(0,0,25,50);
            popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
    popMatrix();
    }
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


