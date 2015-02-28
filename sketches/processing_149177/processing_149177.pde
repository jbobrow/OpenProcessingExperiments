
//Game Engine acquired from Jacob Haip, http://www.openprocessing.org/sketch/17115
//Background image was taken from "http://www.mattfrith.com/post/59427116444/one-of-the-early-tests-of-a-platformer-background"
//The timer code was from a user Charles Cave, "http://www.openprocessing.org/sketch/11635"
PImage bg;
PImage spider;
PImage chest;
PImage bat;
PImage bg2;
PImage [] main = new PImage[2];
boolean begin = false;
boolean mclick = false;
int fRate = 60;
int main_side = 1;
boolean cd = false;
int accumTime;
int startTime;
int displayTime;
boolean [] trig_spider = new boolean [3];
boolean [] trig_bot = new boolean [3];
boolean [] trig_boss = new boolean [1];
int sprX = 340;
int sprY = -53;
boolean usedBat = false;
boolean usedChest;
boolean spidera;
int adder=0;

final int WIDTH = 30;
final int HEIGHT = 23;
int[][] level = new int[HEIGHT][WIDTH];
 
Player p1;
 
//booleans for key presses to get a simple yes or no press and
//to not have to worry about the a,aaaaaaaaaaaaa thing
boolean right = false, left = false, up = false;
 
void setup() {
  frameRate(fRate);
  size(480,368);
  bg = loadImage("bg.jpg");
  bg2 = loadImage("bg2.png");
  spider = loadImage("spider.png");
  main[0] = loadImage("mainLeft.png");
  main[1] = loadImage("mainRight.png");
  chest = loadImage("chest.png");
  bat = loadImage("bat.png");
  p1 = new Player(WIDTH*1,HEIGHT*12); //put the player in the middle of the window
}

void draw() {
  sprY+=adder;
  if (trig_spider[0] == true){
    adder= 2;
    
    }
  
  if (trig_spider[1] == true){
    sprY = -40;
  }
  if (spidera == true){
   sprY +=50;
   
   //if (sprY == 150){
  //   spry = 150;
   //}
   }
  
  
  
  
  
   if (keyPressed && key == ' '){ 
   if (cd == false)
 {startTime = millis();
 begin = true;}
 cd= true; 
 if (trig_bot[2] == true){
   usedBat = true;
   p1.maxXspd = 2;
   p1.gravity = 0.14;
 }
 if (trig_boss[0] == true){
   usedChest = true;
   
 }

 }
  //Timer
  time = floor((displayTime /1000) % 60);
  if (cd == true){
    displayTime = accumTime + millis() - startTime;
  }
  //println(p1.y);
  //40 Seconds time limit until death
  p1.life= 59 -time; 
  //If 40 seconds -> death
 if (p1.life <=0){
  p1.isAlive = false;
 }

  if (mclick == false){
    background(0);
    textSize(28);
    text("Press Left Mouse Button ", 80,184); 
 } 
 else if (mclick == true){
   background(0);
   textSize(28);
    image(bg2,0,0);
      if (begin == true){ 
        if (p1.isAlive == true){
   
  p1.update();
  image(bg,0,0);
  image(spider, sprX,sprY);
  image(chest, 245, 55);
  if (usedBat == false){
  image(bat,390,300);
  }
  drawLevel();
  p1.show();
 }
 if (p1.isAlive == false){
   background(0);
   textSize(28);
    text("Game Over", 155,184);
 }
 if (usedChest== true){
   textSize(34);
   text(255,255,255);
   text("You Win",155,184);
 }
      }
}
 
 //Trigers


 if (p1.x  +8 >= 240 && p1.x +8 <= 260 && p1.y <= 288 && p1.y  >= 170){
   if (trig_spider[0] == false){
   trig_spider[0] = true;
   }
 }
 if (p1.x +8 >= 340 && p1.x +8 <= 370 && p1.y  <= 288 && p1.y  >= 170){
   if (trig_spider[1] == false){
   trig_spider[1] = true;
   }
 }
  if (p1.x  >= 370 &&  p1.x  <= 390 &&  p1.y  >= 15 && p1.y <= 165){
   if (trig_spider[2] == false){
    trig_spider[2] = true;
    spidera= true;
   }
 }
 

  if (p1.x  >= 220 &&  p1.x  <= 230 &&  p1.y  >= 292 && p1.y <= 468){
   if (trig_bot[0] == false){
    trig_bot[0] = true;
   }
 }
 
  if (p1.x  >= 320 &&  p1.x  <= 330 &&  p1.y  >= 292 && p1.y <= 468){
   if (trig_bot[1] == false){
    trig_bot[1] = true; 
   }
 }
 
  if (p1.x  >= 385 &&  p1.x  <= 395 &&  p1.y  >= 290 && p1.y <= 468 ){
   if (trig_bot[2] == false){
    trig_bot[2] = true;
   }
   else (trig_bot[2] = false);
 }
 
 if (p1.x >= 240 && p1.x<= 290 && p1.y >= 50 && p1.y <= 95){
   if (trig_boss[0] == false){
    trig_boss[0] = true;
 }
 else(trig_boss[0] = false);
}
}

 
void drawLevel() {
  fill(0);
  noStroke();
  for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) {
      switch(level[iy][ix]) {
        case 1: rect(ix*16,iy*16,16,16);
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
  switch(keyCode) {
    case RIGHT: right = true; break;
    case LEFT: left = true; break;
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
void mousePressed() {
//Left click loads level and enables Enter screen
  if (mouseButton == LEFT){
    loadLevel();
    
  } 
}



class Player {
  int life;
  boolean isAlive;
  int x,y;
  int x2, y2;
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  Player(int _x, int _y ) {
    x2 = x + 32;
    y2 = y + 49;
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 1;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.19;
  }
  void update() {
    if ( right ) {
      xSpeed += accel;
      main_side = 1;
      if ( xSpeed > maxXspd ) {
        xSpeed = maxXspd;
      }
    }
    else if ( left ) {
      xSpeed -= accel;
      main_side = 0;
      if ( xSpeed < -maxXspd ) {
        xSpeed = -maxXspd;
      }
    }
    else { //neither right or left pressed, decelerate
      if ( xSpeed > 0 ) {
        main_side = 1;
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
    if (p1.y >= 352){
      p1.isAlive = false;
      
    }
    //TRIGERS
    
    
  
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
    image(main[main_side],x-8,y - 31);
    popMatrix();
  }

}

void loadLevel(){
     mclick= true;
     p1.isAlive = true;
     time = 0 ;
     //Block_right
level[int(floor(224/16.0))][int(floor(448/16.0))] = 1;
     
     //Wall_mid
    for (i=0 ;i<=96; i+= 16){
   level[int(floor(i/16.0))][int(floor(298/16.0))] = 1;
    }
     
    //Wall_right
    for (i=0 ;i<=288; i+= 16){
   level[int(floor(i/16.0))][int(floor(464/16.0))] = 1;
    }
    
    //buttom platform
    for (i=0;i<=416; i+= 16){
   level[int(floor(352/16.0))][int(floor(i/16.0))] = 1;
    }
    
    //second platform
    for (i=192;i<=480; i+= 16){
   level[int(floor(288/16.0))][int(floor(i/16.0))] = 1;
    }
    
    //third platform
    for (i=0;i<=384; i+= 16){
   level[int(floor(178/16.0))][int(floor(i/16.0))] = 1;
    }
    
     //top platform
    for (i=224;i<=296; i+= 16){
   level[int(floor(96/16.0))][int(floor(i/16.0))] = 1;
    }
    
     //Wall_left
    for (i=0 ;i<=368; i+= 16){
   level[int(floor(i/16.0))][int(floor(0/16.0))] = 1;
    }
   
    }
    



