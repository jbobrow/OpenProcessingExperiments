
//////////////////////////////////////////////////////////////////////////////////////////////////////
///                                                                                                ///
///                                       - Main Script -                                          ///
///                                                                                                ///
//////////////////////////////////////////////////////////////////////////////////////////////////////

import ddf.minim.*;
Minim minim;
AudioPlayer explode;
AudioPlayer theme;
int baseVolume = -20;
float themeVolume = baseVolume;

ArrayList<oGrandma> particles;
ArrayList<oGrandma> flashes;
ArrayList<oGrandma> bullets;
ArrayList<oGrandma> enemies;
oPlayer player;
oCreator creator;
oEnding ending;

 int shakeX, shakeY, shake, shakeTimer;
 float recoilY, recoilX;
 
 float cameraX, cameraY;
 
 int globalHoek = 0;
 
 int wave = 1;
 int killed;
 
 float playerX, playerY;
 
 boolean end;
 boolean gameStart;
 int gameStartY;
 
 boolean autoScreens = false;
 int screenTimer;
 int screenVar;
 
PImage back;
PImage[] imgCursor;
int cursorTimer;
PFont font;

//------------------------------------------ Initializing ------------------------------------------//
void setup() {
 
 size( 800, 800 );
 //size( displayWidth, displayHeight );
 //sketchFullScreen();
 
 minim = new Minim(this);
 explode = minim.loadFile( "audio/sndExplode.wav" );
 theme = minim.loadFile( "audio/sndTheme.wav" );
 
 explode.setGain( baseVolume );
 theme.setGain( baseVolume );
 theme.loop();
 
 enemies = new ArrayList<oGrandma>();
 particles = new ArrayList<oGrandma>();
 flashes = new ArrayList<oGrandma>();
 bullets = new ArrayList<oGrandma>();
 player = new oPlayer( width/2, height-64);
 
 creator = new oCreator();
 
 back = loadImage( "graphics/background_v3.png" );
 font = loadFont( "sketchFont160.vlw" );
 textFont( font );
 textAlign( CENTER, CENTER );
 imgCursor = new PImage[3]; 
 for( int i=0; i<imgCursor.length; i++ )
 imgCursor[i] = loadImage("graphics/cursor/sCursor" + (i+1) + ".png");
 
 frameRate(30);
}

//------------------------------------------ Enter frame --------------------------------------------//
void draw() {
  background(255);
  
  pushMatrix();
  translate( width/2+mouseX/4, height/2+mouseY/4 );
  rotate( radians(globalHoek) );
  scale(1.5,1.5);
  translate( -back.width/2-mouseX/4, -back.height/2-mouseY/4 );
  image( back, cameraX, cameraY );
  popMatrix();
  
  if (player.passHp() > 0) {
    player.update();
    creator.update();
  }
  
  // end
  if (player.passHp() <= 0) {
    if (end == false) {
      ending = new oEnding();
      shakeIt( 15 );
    }
    end = true;
    ending.update();
  }
  
  // keepin' it clean
  globalHoek = globalHoek % 360;
  
  // Update ArrayLists
  listUpdate( particles );
  listUpdate( flashes );
  listUpdate( bullets );
  listUpdate( enemies );
  
  // Cursor
  cursorTimer++;
  noCursor();
  pushMatrix();
  PImage img_ = imgCursor[ int(cursorTimer/2) % imgCursor.length ];
  image( img_, mouseX+cameraX-img_.width/2, mouseY+cameraY-img_.height/2 );
  popMatrix();
 
 // screenshake
 if (shakeTimer > 0) {
   switch( shakeTimer ) {
    case 1: shakeX = shake; break;
    case 2: shakeX = -shake; break;
    case 3: shakeX = 0; shakeY = shake; break;
    case 4: shakeY = -shake; break;
    case 5: shakeY = 0;
            shake = int(shake/2);
            shakeTimer = 0;  
            break;
   }
  if ( shake > 0 )
  shakeTimer++; 
 }
 
 recoilY *= 0.9;
 recoilX *= 0.9;
 
 // camera position
 cameraX = shakeX;
 cameraY = shakeY+recoilY;
 
 // key pressed event boolean
 if (kaAble == false)
  ka = false;
  
 // set theme music gradually to base
 themeVolume = max( baseVolume, (themeVolume)*0.9+baseVolume );
 theme.setGain( themeVolume );
 
 // auto screenshots
 if (autoScreens == true) {
  screenTimer++;
  if (screenTimer % 10 == 0) {
   saveFrame( "screenshots/screen_"+screenVar+".png" );
   screenVar++;
  } 
 }
 
 // start game
 if (kap) {
   gameStart = true;
 }
 if (gameStartY < height/3*2) {
   pushMatrix();
   fill( 0 );
   text( "Click to \n start", width/2, height/2-gameStartY ); 
   popMatrix();
 }
 if (gameStart == true) {
   gameStartY += 16; 
 }

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
//                                             - FUNCTIONS -                                           //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////

//--------------------------------------- global action functions -------------------------------------//
// screenshake
public void shakeIt( int shake_ ) { 
  shake = min( shake+shake_, 30 );
  shakeTimer = 1;
}

// explosion
void explode( float x_, float y_ ) {
  shakeIt( 4 );
  explode.rewind();
  explode.play();
 for( int i=0; i<5; i++ ) 
  particles.add( new oPart( x_, y_, random(6,12), random(0,360) ) ); 
 flashes.add( new oFlash( x_, y_ ) );
}

//--------------------------------------------- Key input -----------------------------------------------//
boolean ku = false;
boolean kd = false;
boolean kl = false;
boolean kr = false;
boolean ka = false;
boolean kap;
boolean kaAble = true;

void keyPressed() {
 if (key == CODED) {
   if (keyCode == LEFT) kl = true;
   if (keyCode == RIGHT) kr = true;
   if (keyCode == UP) ku = true;
   if (keyCode == DOWN) kd = true;
 } 
 else {
  if (key == 'a') kl = true; 
  if (key == 'd') kr = true;
  if (key == 'w') ku = true;
  if (key == 's') kd = true;
 }
}

void mousePressed() {
 if (mouseButton == LEFT) {
   kap = true;
 if (kaAble == true) {
     ka = true;
     kaAble = false;
   }
 } 
}

void keyReleased() {
 if (key == CODED) {
   if (keyCode == LEFT) kl = false;
   if (keyCode == RIGHT) kr = false;
   if (keyCode == UP) ku = false;
   if (keyCode == DOWN) kd = false;
 }
 else {
  if (key == 'a') kl = false; 
  if (key == 'd') kr = false;
  if (key == 'w') ku = false;
  if (key == 's') kd = false;
 }
}

void mouseReleased() {
    kap = false;
 if (mouseButton == LEFT) {
     ka = false;
     kaAble = true;
 } 
}

//--------------------------------------------- Misc. functions --------------------------------------------------//
float approach( float a, float b, float c ) {
  // use: approach( start value, goal value, amount to approach with );
 if (a > b)
 return max( a-c, b );
 else 
 return min( a+c, b );
}

float approachGrad( float a, float b, float c ) {
// use: approach( start value, goal value, multiplier to approach with );
 if (a > b)
 return max( b, a*(1/c) ); 
 else
 return min( b, a*(1*c) ); 
}

float sign( float a ) {
 if ( a > 0 )
 return 1;
 else
 if ( a < 0 )
 return -1;
 else
 return 0;
}

boolean sketchFullScreen() { // sets game to fullscreen, but don't ask me why. Seems to make no sense to me...
  return true;
}

//-------------------------------------------- Vector functions -----------------------------------------------//
float distanceToPoint( float x1, float y1, float x2, float y2 ) { // calculates distance between 2 points
 return sqrt(pow(x1-x2,2)+pow(y1-y2,2)); 
}

float pointDirection( float x1, float y1, float x2, float y2 ) { // calculates angle between 2 points
 float deltaX = x2-x1;
 float deltaY = y2-y1;
 return degrees(atan2( deltaY, deltaX ))-90; 
}

// xDir returns the horizontal component of the vector determined by the indicated direction (dir_) and length (len_)
float xDir( float dir_, float len_ ) {
 return cos(radians(dir_))*len_;
}
// Same as xDir, except it returns the vertical component instead of the horizontal one
float yDir( float dir_, float len_ ) {
 return sin(radians(dir_))*len_;
}

//-------------------------------------------- List functions ----------------------------------------------//
void listUpdate( ArrayList<oGrandma> list_ ) { 
  for( int i=list_.size()-1; i>=0; i-- ) {
  oGrandma k = list_.get(i); // dynamic typecasting
  k.update();
  if (k.destroyed()) 
  list_.remove(i);
 }
}

//------------------------------------------ Collision functions ------------------------------------------//
boolean collisionRect( float x_, float y_, float w_, float h_, ArrayList<oGrandma> list_ ) {
  boolean returnVal = false;
  if (list_.size() > 0)
 for( int i=list_.size()-1; i>=0; i-- ) { 
   oGrandma obj_ = list_.get(i);
   if (  obj_.passX() >= (x_-w_/2) && 
         obj_.passX() <= (x_+w_/2) &&
         obj_.passY() >= (y_-h_/2) &&
         obj_.passY() <= (y_+h_/2)  ) {
   returnVal = true; 
   list_.remove(i);
   }
 }
 return returnVal;
}

boolean collisionRectTeam( float x_, float y_, float w_, float h_, ArrayList<oGrandma> list_, int team_ ) {
  boolean returnVal = false;
  if (list_.size() > 0)
 for( int i=list_.size()-1; i>=0; i-- ) { 
   oGrandma obj_ = list_.get(i);
   if (  obj_.passX() >= (x_-w_/2) && 
         obj_.passX() <= (x_+w_/2) &&
         obj_.passY() >= (y_-h_/2) &&
         obj_.passY() <= (y_+h_/2) &&
         obj_.passTeam() != team_ ) {
   returnVal = true; 
   list_.remove(i);
   }
 }
 return returnVal;
}

// ------------------------------------------- stop ----------------------------------------------------- //
void stop() {
  explode.close();
  theme.close();
  minim.stop();
  super.stop();
}
class oBullet extends oMama {
  
int t=0;  

PImage[] img;
  
 oBullet( float x_, float y_, float speed_, float dir_, int team_ ) {
  init( x_, y_ ); 
  speed = speed_;
  direction = dir_;
  team = team_;
  img = new PImage[5];
  for( int i=0; i<img.length; i++ )
  img[i] = loadImage( "graphics/bullets/sBullet" + (i+1) + ".png" );
 }
 
 void update() {
   // scale
   myScale = approachGrad( myScale, 1+sin(t/3)/2, 1.2 );
   
  x2 += xDir( direction, speed );
  y2 += yDir( direction, speed );
  position( true ); 
  
  if ( x<-16 ||
       x>width+16 ||
       y<-16 ||
       y>height+16 ) {
  destroy = true;
  }
  
  t++;
  if (t % 8 == 0)
  particles.add( new oPart( x, y, 0, 0 ) );
  
  pushMatrix();
  translate( x+cameraX, y+cameraY );
  scale( myScale, myScale );
  rotate( radians(globalHoek-myHoek+direction) );
  translate( -cameraX, -cameraY );
  scale(xscale,yscale);
  if (team == 1)
  fill( 255, 0, 0 );
  PImage img_ = img[ int(t/2) % img.length ];
  image( img_, cameraX-img_.width/2, cameraY-img_.height/2 );
  popMatrix();
  noFill();
 }
 
}
class oCreator {
 int t = 0;

 // spawning enemies
 void update() {
  if (gameStart) {
    
      t++; // timer
      
      if (end == false) {
        if ( t < 400 && t % max((100-10*wave),10) == 0 )
        enemies.add( new oEnemyA( width/2, height/2 ) );
        if ( t == 100 && wave % 2 == 0 )
        enemies.add( new oEnemyB( width/2, height/2 ) );
      }
     
     
      if ( enemies.size() <= 0 && t > 400 ) {
        wave++;
        player.hp = min( player.hp+1, player.maxhp );
        t = 0;
        particles.add( new oTextFade( wave-1 ) );
      }
  }
 }
 
}
class oEnding {
 int t, p;
 String[] texts;
 
 oEnding() {
   texts = new String[6];
   texts[0] = "Wave:";
   texts[1] = str(wave);
   texts[2] = "Enemies killed:";
   texts[3] = str(killed);
   texts[4] = "Thanks for playing!";
 }
 
 void update() {
   t++;
   if (t >= 100)
     p++;
   pushMatrix();
   textSize( 80 );
   fill( 0 );
   for( int i=0; i<texts.length; i++ ) {
     if (i==0)
     text( texts[i].substring( 0, min(int(p/3),texts[i].length()) ), width/2, height/4+128*i );
     if (p > texts[max(0,i-1)].length() && i>0 )
     text( texts[i].substring( 0, min(max(0,(p-60*i)/3 ),texts[i].length())), width/2, height/4+128*i );
     if (p == 120*i-60) {
      shakeIt( 2 ); 
     }
   }
   popMatrix();
   
   if (p > 100 && kap) {
     exit();
   }
 }
  
}
abstract class oEnemy extends oMama {
  
  PImage[] img1, img2;
  PImage img_;
  int t = 0;
  float mainTimer = 0;
  int level = 0;
  boolean visual = true;
  int hit = 0;
  int team = 2;
  int hpTimer = 0;
  int hp;
  int shootSpeed;
  int startHoek = globalHoek;
  boolean spriteTwo = false;
  float myScale = 0;
  float size;
  
  void update(){}

  void enemyUpdate() {
    
    // main timer
    t++;

    // ------------------------------------------- hit ----------------------------------------------- //
    // check collision; get hit
    if (hit == 0)
    if (collisionRectTeam( x, y, img1[0].width*(size+1), img1[0].height*(size+1), bullets, team ) ) {
      myScale = 4;
      hp -= 1;
      hit = 30;
      explode(x, y);
    }
    
    // when hit, flicker
    if (hit > 0)
    hit--;
    if (hit % 5 == 0)
    visual = false;
    if (hit % 10 == 0 || hit == 0)
    visual = true;
    
    // ----------------------------------------- hp & death ------------------------------------------ //
    if (hp <= 0) {
       hpTimer++;
      if (hpTimer % 3 == 0)
       explode( x-32+random(64), y-32+random(64) );
      if (hpTimer >= 9) {
       destroy = true; 
       killed++;
      }
    }

    // ------------------------------------------ drawing -------------------------------------------- //
    
    // scale
    myScale = approachGrad( myScale, 1+sin(t/8)/5, 1.2 );
    
    // draw
    pushMatrix();
    translate( x+cameraX, y+cameraY );
    rotate( radians( globalHoek ) );
    translate( -cameraX, -cameraY );
    rectMode( CENTER );
    if (hit > 0 && hit < 4)
     fill( 255 );
    
    // set images
    if (visual) {
     if (spriteTwo == false){
       img_ = img1[ int(t/2) % img1.length ];
     }
     if (spriteTwo == true) {
       img_ = img2[ int(t/2) % img2.length ];
     }
     if (img_ != null) {
        scale( myScale+size );
        image( img_, cameraX-img_.width/2, cameraY-img_.height/2 );
     }
    }
    popMatrix();
  }
}

class oEnemyA extends oEnemy {
  
  int turnDirection = int(random(3))-2;
  float distance = random(6);
  int shootMode = int(random(2))-1;
  
  // ----------------------------------------- constructor ------------------------------------------ //
  oEnemyA( float x_, float y_ ) {
    init( x_, y_ );
    
    hp = 2;
    shootSpeed = 8;
    
    // load images
    img1 = new PImage[5];
    img2 = new PImage[img1.length];
    
    for( int i=0; i<img1.length; i++ ) {
     img1[i] = loadImage("graphics/enemies/sEnemyA1_" + (i+1) + ".png");
     img2[i] = loadImage("graphics/enemies/sEnemyA2_" + (i+1) + ".png");
    }
  } 

  void update() {

    // ------------------------------------------ moving --------------------------------------------- //
    mainTimer++;
    if ( end == false ) {
      myHoek += 4*turnDirection;
    }
    x = width/2+xDir( globalHoek-startHoek-myHoek, 40*distance );
    y = height/2+yDir( globalHoek-startHoek-myHoek, 40*distance );

    // ----------------------------------- shooting ----------------------------------------- //
    if ( t % 200 == 0) {
      level = min( level+1, 10 );
    }

    if ( t % (30-level*2) == 0 && hp>0 && t > 60 && end == false ) {
      spriteTwo = true;
      myScale = max( myScale, 2 );
      
      if (level < 4)
        bullets.add( new oBullet( x, y, shootSpeed, pointDirection( x, y, playerX+8, playerY+8 )+4-random(0, 8)+int(random(3))*90*shootMode, team ) ); 
      else 
        if (level < 8) {
        for ( int i=0; i<3; i++ ) {
          bullets.add( new oBullet( x, y, shootSpeed, pointDirection( x, y, playerX+8, playerY+8 )-30+30*i+4-random(0, 8)+int(random(3))*90*shootMode, team ) );
        }
      }
      else {
        for ( int i=0; i<5; i++ ) {
          bullets.add( new oBullet( x, y, shootSpeed, pointDirection( x, y, playerX+8, playerY+8 )-50+25*i+4-random(0, 8)+int(random(3))*90*shootMode, team ) );
        }
      }

      if (level > 5 && random(0, 4) == 0 )
        for ( int i=0; i<2; i++ )
          bullets.add( new oBullet( x, y, shootSpeed, pointDirection( x, y, playerX+8, playerY+8 )-90+180*i+4-random(0, 8)+int(random(3))*90*shootMode, team ) ); 

      for ( int i=0; i<6; i++ )
        particles.add( new oPart( x, y, random(4,8), direction-40+random(0,80) ) );

      if (random(0, 4) == 0)
        t -= 3;
    }
    
  // ---------------------------------------- other.. --------------------------------------- //
  
  // switch sprites
  if ( t % (30-level*2) == 10 )
   spriteTwo = false;
  
  // inherit event
  enemyUpdate();

  }
}

class oEnemyB extends oEnemy {
  
  int turnDirection = int(random(3))-2;
  
  // ----------------------------------------- constructor ------------------------------------------ //
  oEnemyB( float x_, float y_ ) {
    init( x_, y_ );
    
    hp = 10;
    shootSpeed = 4;
    
    // load images
    img1 = new PImage[5];
    img2 = new PImage[img1.length];
    
    for( int i=0; i<img1.length; i++ ) {
     img1[i] = loadImage("graphics/enemies/sEnemyA1_" + (i+1) + ".png");
     img2[i] = loadImage("graphics/enemies/sEnemyA2_" + (i+1) + ".png");
    }
    
    size = 4;
  } 

  void update() {

    // ------------------------------------------ moving --------------------------------------------- //
    mainTimer++;
    x = width/2;
    y = height/2;

    // ----------------------------------- shooting ----------------------------------------- //
    if ( t % 200 == 0) {
      level = min( level+1, 10 );
    }

    if ( t % (60-level*2) == 0 && hp>0 && t > 60 && end == false ) {
      spriteTwo = true;
      myScale = max( myScale, 2 );
      for( int i=0; i<12; i++ ) {
        float dirTemp = 360/12*i;
        float xTemp = x+xDir( dirTemp, img1[0].width*(size)/2 );
        float yTemp = y+yDir( dirTemp, img1[0].width*(size)/2 );
        bullets.add( new oBullet( xTemp, yTemp, shootSpeed, dirTemp-90, team ) );
        for ( int j=0; j<6; j++ )
          particles.add( new oPart( xTemp, yTemp, random(4,8), dirTemp-40+random(0,80) ) );
      } 

    }
    
  // ---------------------------------------- other.. --------------------------------------- //
  
  // switch sprites
  if ( t % (30-level*2) == 10 )
   spriteTwo = false;
  
  // inherit event
  enemyUpdate();

  }
}

class oFlash extends oMama {
  
float t;

oFlash( float x_, float y_ ) {
  init( x_, y_ );
  w = random(96,160)*2;
  t = 2;
}

void update() {
  color(0);
  w *= 0.9;
if (t >= 0) {
  position( false );
  noStroke();
  fill( 255, 150 );
  ellipse( x+cameraX, y+cameraY, w, w );
  noFill();
  stroke(0);
  tint( 255, 255 );
  
  tint( 255, 255-t*100 );
  t--;
  }
else
 destroy = true;
}

}
// base interface used for dynamic typecasting in main script (arraylists)
// see listUpdate() function in main script
interface oGrandma {
  void update();
  boolean destroyed();
  float passX();
  float passY();
  int passTeam();
}
// base class for moveable objects
abstract class oMama implements oGrandma {

  float x = 0;
  float y = 0;
  float x2 = 0;
  float y2 = 0;
  float xstart;
  float ystart;
  float w;
  float direction;
  float posX;
  float posY;
  float speed;
  float fric;
  float myHoek;
  float startHoek;
  float distToMid;
  float distToNew;
  float xscale;
  float yscale;
  boolean destroy = false;
  int team = 0;
  float myScale = 1;
  
void init( float x_, float y_ ) { // common initializing
  x = 0;
  y = 0;
  xstart = x_;
  ystart = y_;
  xscale = 1;
  yscale = 1;
  
  myHoek = globalHoek-90;
  startHoek = globalHoek-pointDirection( width/2, height/2, x_, y_ )-90;
  distToMid = distanceToPoint( width/2, height/2, xstart, ystart ); // Calculate distance to center of screen
}

void position( boolean dynamic_ ) { // (re)position from new global angle
  if (dynamic_) {
   distToNew = distanceToPoint( xstart, ystart, xstart+x2, ystart+y2 ); // calculate distance from origin to new position
   x = width/2 + xDir( (globalHoek-startHoek), distToMid ) + xDir( (globalHoek-myHoek+direction), distToNew );
   y = height/2 + yDir( (globalHoek-startHoek), distToMid ) + yDir( (globalHoek-myHoek+direction), distToNew ); 
  }
  else {
   x = width/2 + xDir( (globalHoek-startHoek), distToMid );
   y = height/2 + yDir( (globalHoek-startHoek), distToMid );
  }
}

 abstract void update();
 
 // get-functions //
 boolean destroyed() {
 return destroy; 
}

float passX() {
 return x; 
}
float passY() {
 return y; 
}
int passTeam() {
 return team; 
}
 
}
class oPart extends oMama {
  
  PImage[] img;
  int t;
  float wStart;
  
oPart( float x_, float y_, float speed_, float dir_ ) {
  init( x_, y_ );
  w = random(12,24);
  wStart = w;
  direction = dir_;
  speed = speed_;
  fric = 0.9;
  
  img = new PImage[5]; 
  for( int i=0; i<img.length; i++ )
  img[i] = loadImage("graphics/part/part" + (i+1) + ".png");
}

void update() {
if (w >= 0.25) {
  color(0);
  posX = cos(radians(direction));
  posY = sin(radians(direction));
  x2 += posX*speed;
  y2 += posY*speed;
  position( true );
  speed = max( speed*fric, 0 );
  pushMatrix();
  t++;
  
  PImage img_ = img[ int(t/2) % img.length ];
  translate( x-img_.width/2, y-img_.height/2 );
  scale( w/wStart );
  translate( -x+img_.width/2, -y+img_.height/2 );
  image( img_, x+cameraX-img_.width/2, y+cameraY-img_.height/2 );
  popMatrix();
  w -= 1.5;
  }
else {
 destroy = true; 
 }
}

}
class oPlayer {
  
  float x, y;
  float h = 0;
  float v = 0;
  float w = 16;
  float acc = 0.5;
  float fric = 0.4;
  float maxh = 6;
  float maxv = 2;
  float hoek = 0;
  float xscale = 1;
  float yscale = 1;
  int t = 0;
  float myScale = 1;
  int test = 0;
  int alpha = 0;
  int shootTimer = 0;
  
  int maxhp = 5;
  int hp = maxhp;
  
  PImage[] img;
  
  int team = 1;
  
  int hit = 0;
  boolean visual= false;
  
  // ---------------- contructor ------------------- //
  oPlayer( float x_, float y_ ) {
     x = x_;
     y = y_;
    
     img = new PImage[5]; 
     for( int i=0; i<img.length; i++ )
     img[i] = loadImage("graphics/player/sPlayer" + (i+1) + ".png");
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  ///                                                                                                ///
  ///                                           - Update -                                           ///
  ///                                                                                                ///
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  
  void update() {
    // set scale gradually to base value
    myScale = approachGrad( myScale, 1+sin(t/8)/5, 1.2 );
    
    // -------------------------------------- movement ------------------------------- //
    if (kl)
    h = max( h-acc, -maxh ); 
    if (kr) 
    h = min( h+acc, maxh ); 
    
    if (kl == false && kr == false)
    h = approach( h, 0, fric );
    
    globalHoek += h;
    
    x = max( 0, min( x, width ) );
    y = max( 0, min( y, height ) );
    
    playerX = x;
    playerY = y;
    // ------------------------------------- hit & death ------------------------------ //
    // collision check; get hit
    if (hit == 0)
      if (collisionRectTeam( x, y, img[0].width, img[0].height, bullets, team )) {
        myScale = 5;
       hit = 24;
       explode( x, y ); 
       themeVolume += 10;
       hp--;
      }
    // when hit, flicker
    if ( hit > 0 )
      hit--;
    if ( hit % 3 == 0 )
      visual = false;
    if ( hit % 6 == 0 || hit == 0 )
      visual = true;
      
    if (hp <= 0) {
      visual = false; 
    }
    
    // -------------------------------------- shooting ------------------------------- //
    t++;
    if (kap && shootTimer == 0) {
     myScale = max( 3, myScale );
     recoilY = 40;
     themeVolume += 5;
    shakeIt( 2 );
    bullets.add( new oBullet( x+8, y-8, 16, pointDirection( x, y, mouseX, mouseY ), team ) );
    shootTimer = 15;
     for( int i=0; i<6; i++ )
     particles.add( new oPart( x, y, random(12,16), 180+30-random(0,60) ) );
    }
    if (shootTimer > 0)
    shootTimer--;
    
    // ------------------------------------ draw -------------------------------------- //
    pushMatrix();
    rectMode(CENTER);
    translate( x, y );
    scale(myScale,myScale);
    if (hit > 0)
     fill( 255 );
    if (visual) {
     PImage img_ = img[ int(t/2) % img.length ];
     image( img_, cameraX-img_.width/2, cameraY-img_.height/2 );
    }
    //rect(cameraX, cameraY,w*myScale,w*myScale);
    popMatrix();
  
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  ///                                                                                                ///
  ///                                        - Functions -                                           ///
  ///                                                                                                ///
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  
  int passTeam() {
   return team; 
  }
  
  int passHp() {
   return hp; 
  }


}
class oTextFade extends oMama {
float myScale = 0.1;
int t = 0;
String[] texts;
int level;
  
 oTextFade( int level_ ) {
  level = level_;
  texts = new String[10];
  for( int i=0; i<10; i++ )
  texts[i] = "IMPOSSIBLE!!!";
  texts[1] = "Nice";
  texts[2] = "Getting better";
  texts[3] = "Groovy!";
  texts[4] = "SICK!!";
  texts[5] = "INSAAAANE!!!";
  texts[6] = "!@#$%^&*(";
  texts[7] = "FUCKING GENIUS";
 } 
 
 void update() {
  myScale *= 1.25;
  if (myScale >= 5000)
  destroy = true;
  pushMatrix();
  translate( width/2, height/2 );
  textSize( myScale );
  translate( -width/2, -height/2 );
  fill( 0 );
  text( texts[min(level,9)], width/2, height/2 );
  popMatrix();
  
 }
 
}


