
// RAGE BALL, based on Nintendo Game & Watch's "Ball" by Gunpei Yokoi,
// by Daniel Jovanov
// FINISHED 22 March 2013, started 18 March 2013

//////////////////////////////////////////////////////////////////////////////////////////////
// VARIABLES
//////////////////////////////////////////////////////////////////////////////////////////////
float time=0;
int score=0;
// for animating the "arms", need to use image-changing code
// from PROJECT 4. Again, credit goes to Daniel Shiffman and
// Devon Scott-Tunkin

int maxArmImages=3; // Total # of  arm images
// the "middle" arm position should be in the center
// of the array, and since there are three cells total,
// it should be index 1.
int imageIndex=1;



// for the ball objects, you could also use image-changing code,
// and it also need collision detection (if y > 270 (top-left corner),
// then you lose. If y >= 270, then check if it collides with hand)

// there are three balls that go on separate lines, so there must
// be six arrays for them based on x and y-coordinates

// UPDATE: added 15 to every coordinate
// 22 March 2013, 10:20 P.M.

// 7 inner line balls
int[] inJuggleX={301,207,241,301,355,393,397};
int[] inJuggleY={312,247,191,165,191,247,312};
// 9 middle line balls
int[] midJuggleX={137,141,157,219,301,395,453,477,471};
int[] midJuggleY={314,247,201,129,97,129,201,247,314};
// 11 outer line balls
int[] outJuggleX={75,79,87,109,199,301,423,311,525,529,531};
int[] outJuggleY={312,247,191,129,61,33,61,129,191,247,312};

/*
// 7 inner line balls
int[] inJuggleX={186,192,226,286,340,378,382};
int[] inJuggleY={297,232,176,150,176,232,297};
// 9 middle line balls
int[] midJuggleX={122,126,142,204,286,380,438,452,456};
int[] midJuggleY={299,232,176,114,82,114,176,232,299};
// 11 outer line balls
int[] outJuggleX={60,64,72,94,174,286,408,496,510,514,516};
int[] outJuggleY={297,232,176,114,46,18,46,114,176,232,297};
*/
// start the balls from the left side on the second row
int innerIndex = 1; // maximum index is 7
int middleIndex = 1; // maximum index is 9
int outerIndex = 1; // maximum index is 11

// do the same as above for invisible boxes
// that detect collision with the balls
int[] colLeftX = {60,122,186};
int[] colRightX = {382,456,516};
int[] colY = {297,299,297};

// start the collision boxes in the middle
int colIndex = 1;

// declare image variables
PImage[] arms=new PImage[maxArmImages];

PImage transparent; PImage transparent0;

// the head is one class, and the arms are another class
Sprite head;     // modified Sprite class from Devon Scott-Tunkin
Control move;    // the controllable object--arms 
Sprite body;     // overkill, but necessary for JavaScript

BallOne cageIn;        // the inner ball
BallTwo cageMiddle;    // the middle ball
BallThree cageOut;     // the outer ball

// collision detection on the "hands"
Handleft colLeft;
Handright colRight;

//////////////////////////////////////////////////////////////////////////////////////////////
// MAIN
//////////////////////////////////////////////////////////////////////////////////////////////


void setup() {
  background(255);
  size(600,600);
  imageMode(CENTER); // fix
  
  // load background
  transparent0=loadImage("transparent0.png");
  image(transparent0,300,300,600,600);
  transparent=loadImage("transparent.png");
  
  // draw the body (fron center)
  //bodyOfRageMan=loadImage("rageBody.png"); 
  body=new Sprite(300,487,300,234,"rageBody.png","rageBody.png","rageBody.png"); // there is no "other" body
 
  // load head sprite--"struggling" when "alive", and outrageous when "dead"
  head=new Sprite(300,300,90,180,"rageManStruggles.png","rageMan.png","rageManWins.png"); 

  // load the images in the arms array
  move=new Control(300,347,480,80);
  //arms[0]=loadImage("armsLeft.png");     // left
  //arms[1]=loadImage("armsNeutral.png");  // middle
  //arms[2]=loadImage("armsRight.png");    // right
  
  // finally, setup the three balls
  imageMode(CORNER); // used only for the balls for the sake of ease of knowing coordinates
  cageIn=new BallOne(inJuggleX[innerIndex],inJuggleY[innerIndex],30,30,1,1);
  cageMiddle=new BallTwo(midJuggleX[middleIndex],midJuggleY[middleIndex],30,30,1,1);
  cageOut=new BallThree(outJuggleX[outerIndex],outJuggleY[outerIndex],30,30,1,1);
  
  // collision detection determined by a rectangles 
  // with a dimension of 30 X 30 and placed where hands are
  colLeft=new Handleft(colLeftX[colIndex],colY[colIndex],30,30);
  colRight=new Handright(colRightX[colIndex],colY[colIndex],30,30);
} // setup()
  
void draw() {
  // draw background
  image(transparent,300,300,600,600);
  
  // check collision--if false and the ball is too low,
  // stop the balls' movement and make the rage face show!
  boolean collided=cageIn.collideLeft(colLeft);
  // check indeces BEFORE actual collision detection
  if(!collided) {
    if(innerIndex==0) { cageIn.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  collided=cageIn.collideRight(colRight);
  if(!collided) {
    if(innerIndex==6) { cageIn.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  
  collided=cageMiddle.collideLeft(colLeft);
  if(!collided) {
    if(middleIndex==0) { cageMiddle.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  collided=cageMiddle.collideRight(colRight);
  if(!collided) {
    if(middleIndex==8) { cageMiddle.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  
  collided=cageOut.collideLeft(colLeft);
  if(!collided) {
    if(middleIndex==0) { cageOut.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  collided=cageOut.collideRight(colRight);
  if(!collided) {
    if(middleIndex==10) { cageOut.lose=true; head.dead=true; } }
  else if(collided) score+=1;
  
  // draw body parts
  body.draw();
  move.draw();
  head.draw();
  //colLeft.draw();
  //colRight.draw();
  
  // UPDATE: Necessary to redraw the transparent and solid hands 
  // (even the collider boxes) so that the balls won't draw over them.
  // They remain visible at all times--22 March 2013
  image(transparent,300,300,600,600);
  move.draw();
  
  // draw Nicholas Cage
  cageIn.draw();
  cageMiddle.draw();
  cageOut.draw();
}


//////////////////////////////////////////////////////////////////////////////////////////////
// CLASSES AND FUNCTIONS
//////////////////////////////////////////////////////////////////////////////////////////////


class Sprite {
  float x; float y; float w; float h;
  
  PImage startFace; // the "face" we begin with
  PImage rageFace; // upon "death", the face changes to rage.
  PImage winFace; // upon having the high score, the face changes to win
  
  boolean dead;
  
  // constructor
  Sprite(float xx, float yy, float ww, float hh, String image, String other, String win) {
    // setup x and y-coordinates
    x=xx; y=yy;
    // load images
    startFace=loadImage(image); rageFace=loadImage(other); winFace=loadImage(win);
    // setup width and height
    w=ww; h=hh;
    // set "death" mode to false
    dead=false; } // new Sprite(xx,yy,ww,hh);

  // draw
  void draw() {
    imageMode(CENTER);
    // if not dead, load "rageManStruggles.png",
    // or else load "rageMan.png".
    if(!dead) {
      if(score<20)
        image(startFace,x,y,w,h);
      else if(score>19)
        image(winFace,x,y,w,h); }
    else if(dead)                            
      image(rageFace,x,y,w,h); } } // Sprite.draw(); Sprite()



class Control {
  float x; float y; float w; float h;
  
  //PImage left;   // when the arms move left
  //PImage start;  // starting, neutral position
  //PImage right;  // when the arms move right
  
  // constructor
  Control(float xx, float yy, float ww, float hh) {
    // setup x and y-coordinates
    x=xx; y=yy;
    // load images
    arms[0]=loadImage("armsLeft.png");     // left    
    arms[1]=loadImage("armsNeutral.png");  // middle
    arms[2]=loadImage("armsRight.png");    // right
    // setup width and height
    w=ww; h=hh; } // new Control(xx,yy,ww,hh)
    
  // draw
  void draw() {
    imageMode(CENTER);
    image(arms[imageIndex],x,y,w,h); } } // Control.draw(); Control()
    
    

class BallOne {
  float x; float y; float w; float h;
  PImage cage; // as in Nicholas Cage
  float speed; float direction; // go right
  boolean lose; boolean win; 
  
  BallOne(float xx, float yy, float ww, float hh,
                float sspeed, float dd) {
    // assign x & y-coordinates, speed and direction variables
    x=xx; y=yy; speed=sspeed; direction=dd;
    // load image
    cage=loadImage("Cage(ball).png");
    // assign width & height variables
    w=ww; h=hh;
    // set "death" and "win" mode to false
    lose=false; win=false;
  
    // at the beginning of the game, draw the balls at the
    // original positions. The draw() function "moves" them.
    imageMode(CORNER); // easier for me to figure out coordinates with CORNER
    image(cage,x,y,w,h); } // new BallOne(xx,yy,ww,hh,sspeed)
       
 void draw() {
   if(score>19) win=true;
   
   time+=0.0167*speed; // 60 FPS--Devon Scott-Tunkin--and faster from there
   if (time > 1.75 && !lose && !win) {
     if (direction==1) innerIndex+=1; else if (direction==-1) innerIndex-=1; 
       // erase the current ball image
       background(255);
       // redraw body parts and transparent
       image(transparent0,300,300,600,600);
       body.draw();
       move.draw();
       head.draw();
       
       image(transparent,300,300,600,600);
       move.draw();
     
       time=0; }
   
     image(cage,inJuggleX[innerIndex],inJuggleY[innerIndex],w,h); 
     if(lose) time=0; } // BallOne.draw(); BallOne();

  // Checks for collision
  boolean collideLeft(Handleft obj) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj.y; float bottom2=obj.y+obj.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } // collideLeft();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
      
  boolean collideRight(Handright obj2) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj2.y; float bottom2=obj2.y+obj2.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } } // collideRight(); BallOne();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
     


class BallTwo {
  float x; float y; float w; float h;
  PImage cage; // as in Nicholas Cage
  float speed; float direction; // go right
  boolean lose; boolean win; 
  
  BallTwo(float xx, float yy, float ww, float hh,
                float sspeed, float dd) {
    // assign x & y-coordinates, speed and direction variables
    x=xx; y=yy; speed=sspeed; direction=dd;
    // load image
    cage=loadImage("Cage(ball).png");
    // assign width & height variables
    w=ww; h=hh; 
    // set "death" and "win" mode to false
    lose=false; win=false;
    
    // at the beginning of the game, draw the balls at the
    // original positions. The draw() function "moves" them.
    imageMode(CORNER); // easier for me to figure out coordinates with CORNER
    image(cage,x,y,w,h); } // new BallOne(xx,yy,ww,hh,sspeed)
       
 void draw() {
   if(score>19) win=true;
   
   time+=0.0167*speed; // 60 FPS--Devon Scott-Tunkin--and faster from there
   if (time > 1.75 && !lose && !win) {
     if (direction==1) innerIndex+=1; else if (direction==-1) innerIndex-=1; 
       // erase the current ball image
       background(255);
       // redraw body parts and transparent
       image(transparent0,300,300,600,600);
       body.draw();
       move.draw();
       head.draw();
       
       image(transparent,300,300,600,600);
       move.draw(); 
     
       time=0; }
   
     image(cage,midJuggleX[innerIndex],midJuggleY[innerIndex],w,h); 
     if(lose) time=0; } // BallTwo.draw(); BallTwo();

  // Checks for collision
  boolean collideLeft(Handleft obj) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj.y; float bottom2=obj.y+obj.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } // collideLeft();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
      
  boolean collideRight(Handright obj2) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj2.y; float bottom2=obj2.y+obj2.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } } // collideRight(); BallTwo();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
     

class BallThree {
  float x; float y; float w; float h;
  PImage cage; // as in Nicholas Cage
  float speed; float direction=1; // go right
  boolean lose; boolean win; 
  
  BallThree(float xx, float yy, float ww, float hh,
                float sspeed, float dd) {
    // assign x & y-coordinates, speed and direction variables
    x=xx; y=yy; speed=sspeed; direction=dd;
    // load image
    cage=loadImage("Cage(ball).png");
    // assign width & height variables
    w=ww; h=hh; 
    // set "death" and "win" mode to false
    lose=false; win=false;
  
    // at the beginning of the game, draw the balls at the
    // original positions. The draw() function "moves" them.
    imageMode(CORNER); // easier for me to figure out coordinates with CORNER
    image(cage,x,y,w,h); } // new BallOne(xx,yy,ww,hh,sspeed)
       
 void draw() {
   if(score>19) win=true;
   
   time+=0.0167*speed; // 60 FPS--Devon Scott-Tunkin--and faster from there
   if (time > 1.75 && !lose && !win) {
     if (direction==1) innerIndex+=1; else if (direction==-1) innerIndex-=1; 
       // erase the current ball image
       background(255);
       // redraw body parts and transparent
       image(transparent0,300,300,600,600);
       body.draw();
       move.draw();
       head.draw();
       
       
       image(transparent,300,300,600,600);
       move.draw(); 
     
       time=0; }
   
     image(cage,outJuggleX[innerIndex],outJuggleY[innerIndex],w,h);  
     if(lose) time=0; } // BallThree.draw(); BallThree();

  // Checks for collision
  boolean collideLeft(Handleft obj) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj.y; float bottom2=obj.y+obj.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } // collideLeft();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
      
  boolean collideRight(Handright obj2) {
    if(!lose) {
      float top1=y; float bottom1=y+h;             // BallOne's position
      float top2=obj2.y; float bottom2=obj2.y+obj2.h; // Handleft's position
      
      if (top2>bottom1 || bottom2<top1) return false; } 
    return true; } } // collideRight(); BallThree();
      /*
      // Taken from Sprite example
      // by Devon Scott-Tunkin
      float d=dist(x,y,obj.x,obj.y);
      float maxHeight=max(h,obj.h);
      // if distance between the ball of collider box
      // is less than the height of either of those boxes,
      // then collision happens
      if(d<maxHeight) { direction*=-1; return true; } }
      */
     
  
  
class Handleft {
  float x; float y; float w; float h;

  Handleft(float xx, float yy, float ww, float hh) {
    // assign variables
    x=xx; y=yy; w=ww; h=hh; } // new Handleft(xx,yy,ww,hh)
  
  void draw() {
    fill(0);
    rect(colLeftX[colIndex],colY[colIndex],w,h); } } // draw(); Handleft() 


class Handright {
  float x; float y; float w; float h;
  
  Handright(float xx, float yy, float ww, float hh) {
    // assign variables
    x=xx; y=yy; w=ww; h=hh; } // new Handright(xx,yy,ww,hh)
    
  void draw() {
    fill(0);
    rect(colRightX[colIndex],colY[colIndex],w,h); } } // draw(); Handright()
  


// Happens when you press the key
void keyPressed() {
  // use "keyCode" for arrow keys to "control" arms
  if(keyCode==LEFT) {       // "move" arms and collision boxes left
    if(imageIndex>0)        // check to make sure you're not out of the array
      imageIndex-=1; 
    if(colIndex>0)
      colIndex-=1; } // LEFT key
  else if(keyCode==RIGHT) { // "move arms and collision boxes right
    if(imageIndex<2)        // check to make sure you're not out of the array
      imageIndex+=1; 
    if(colIndex<2)
      colIndex+=1; } }    // RIGHT key; keyPressed();
      


// END OF FILE


