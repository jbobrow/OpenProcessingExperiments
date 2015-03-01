
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17115*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import processing.pdf.*;
PImage ground;
PImage bg;
PImage player;
final int WIDTH = 30;
final int HEIGHT = 23;
int[][] level = new int[HEIGHT][WIDTH];
boolean text1 = true;
Player p1;
boolean on=true;
int xrez;
int [] ran = new int[4];
int [] numb = new int[20];
int score;
int distance;
int coun;
int screenDist;
boolean loop;
boolean canJump;

//booleans for key presses to get a simple yes or no press and 
//to not have to worry about the a,aaaaaaaaaaaaa thing
boolean right = false, left = false, up = false;
void setup() {
  canJump = true;
  loop=false;
  score =0;
  frameRate(60);
  ground = loadImage("earth1.png");
  bg = loadImage("bg.png");
  player = loadImage("player.png");
  
  size(480,368);
  p1 = new Player(WIDTH*8,HEIGHT*15); //put the player in the middle of the window
  frameRate(60);
  p1.maxXspd = .1;
  for (i=0;i<30;i++){
  level[18][i]=1;
  }
  
  p1.xSpeed=0.1;
  for (i=0;i<20;i++){
   for (rand=0;rand<4;rand++){
    ran[rand]= int(random(0,4));
    numb[i]=ran[rand];
}
  }
  
}
  


void draw() {
 if (p1.stop ==true){
   right = false;
   noLoop();
 }

 
  screenDist=p1.x;
  fill(0);
  textSize(70);
  text(score,WIDTH*8,HEIGHT*8);
  for (i=0;i<20;i++){
  switch(p1.x){
  case 243+(16*i): {score=i;break;}
  }
}
  println(score);
  drawLevel();
  p1.update();
  p1.show();
  loadLevel();
  
   if (text1==true){
    fill(255,0,0);
    textSize(18);
    textAlign(CENTER);
    text("Use 'UP' arrow to start", WIDTH*8,HEIGHT*8);
  }
}

void drawLevel(){
  fill(0);
  noStroke();
  for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) { 
      image(bg, ix*16,iy*16);
      switch(level[iy][ix]) {
        case 1: /*rect(ix*16,iy*16,16,16); */ image(ground,ix*16,iy*16);image(player, p1.x,p1.y); break;
        //case 0: level[iy][ix]=0; break;
      }
      
    }
  }
}




boolean place_free(int xx,int yy) {
//checks if a given point (xx,yy) is free (no block at that point) or not
  yy = int(floor(yy/16.0));
  xx = int(floor(xx/16));
  if ( xx > -1 && xx < level[0].length && yy > -1 && yy < level.length ) {
    if ( level[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}

void keyPressed() {

  switch(keyCode) {
   // case RIGHT: right = true;break;
   // case LEFT: left = true;break;
    case UP: up=true;text1=false; right=true; break;  
    case ENTER: lose();break;
  }
}
void keyReleased() {
  switch(keyCode) {
   // case RIGHT: right = false; break;
   // case LEFT: left = false;break;
    case UP: up = false; break;
  }
}
/*void mousePressed() {
//Left click creates/destroys a block0
  if ( mouseButton == LEFT ) {
    inX=mouseX;
    inY=mouseY;
}}*/

void block(int lX,int lY){
  if (text1 == false){
    fill(0,0,255);
    text("Score: " + score, WIDTH*8,HEIGHT*8);
 int dir;
 int xxx =((lX/16)+(p1.pX)); //Block's location opposite of the player
 if (p1.xSpeed > 0){dir=1;}
 if (p1.xSpeed < 0){dir=-1;}
 if (p1.xSpeed == 0){on=true;}
 if (p1.xSpeed !=0){on=false;}
 switch(on){
    case false:
   {
     level[int((lY/8))][int(xxx+dir)] = 0;
     level[int((lY/8))][int(xxx)] = 1;
     break;
   }
   case true:
 {
  //level[int((lY/8))][int(xxx)] = 1;
   }
  
  break;
 }
  
 }
}
 
void loadLevel(){
  
 for (i=2;i<20;i++){
    if(numb[i]==0) {block(272*i,183);block(272*i,169);block(272*i,155);}//3
    if(numb[i]==1) {block(272*i,169);block(272*i,183);block(272*i,160);}//4
    if(numb[i]==2) {block(272*i,160);block(272*i,169);block(272*i,155);}//1
    if(numb[i]==3) {block(272*i,155);block(272*i,183);block(272*i,160);}//2
}
}
void noLoop(){
  if (loop == true){
  fill(255,0,0);
  textSize(30);
    textAlign(CENTER);
    text("ENTER  ", WIDTH*8,HEIGHT*4);
    textSize(70);
    loop =false;
  }
}
void lose(){
  
   if (p1.stop == true){ 
    for ( int ix = 0; ix < WIDTH; ix++ ) {
    for ( int iy = 0; iy < HEIGHT; iy++ ) { 
      level[iy][ix]=0;
    }}
    setup(); 
    loop();
   }
}



class Player {
  int x,y;
  float xSpeed,ySpeed;
  float accel,deccel;
  float maxXspd,maxYspd;
  float xSave,ySave;
  int xRep,yRep;
  float gravity;
  int pSize = 16;
  int pX=0;
  boolean stop=false;
  Player(int _x, int _y ) {
    x = _x;
    y = _y;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.1;
    deccel = 0.1;
    maxXspd = 1;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.25;
  }
  void update() {
    if (stop==false){
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
    }}
    
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
        speed = 0;
        stop = true; 
        fill(255,0,0);
    textSize(18);
    textAlign(CENTER);
    text("ENTER", x-40,240);
    textSize(70);
        // noLoop();  
      }
    }
  }
        
        
  void show() {
    pushMatrix();
    fill(0);
    noStroke();
    //rect(x,y,16,pSize);
    popMatrix();
  }

}


