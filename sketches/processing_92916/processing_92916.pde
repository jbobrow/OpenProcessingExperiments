
// RAGE BALL, based on Nintendo Game & Watch's "Ball" by Gunpei Yokoi,
// by Daniel Jovanov

// for animating the "arms", need to use image-changing code
// from PROJECT 4. Again, credit goes to Daniel Shiffman and
// Devon Scott-Tunkin

int maxArmImages=3; // Total # of images
// the "middle" arm position should be in the center
// of the array, and since there are three cells total,
// it should be index 1.
int imageIndex=1;

// declare image variables
PImage armsToTheLeft; PImage armsNeutral; PImage armsToTheRight;
PImage ball; PImage bodyOfRageMan; PImage rageFace; PImage startFace;
PImage[] arms=new PImage[maxArmImages];

// the head is one class, and the arms are another class
Sprite head;     // modified Sprite class from Devon Scott-Tunkin
Control move;    // the controllable object--arms 
Sprite body;     // overkill, but necessary for JavaScript

void setup() {
  background(255);
  size(600,600);
  
  // draw the body (fron center)
  //bodyOfRageMan=loadImage("rageBody.png"); 
  body=new Sprite(300,487,300,234,"rageBody.png","rageBody.png"); // there is no "other" body
 
  // load head sprite--"struggling" when "alive", and outrageous when "dead"
  head=new Sprite(300,275,90,180,"rageManStruggles.png","rageMan.png"); 

  // finally, load the images in the arms array
  move=new Control(300,347,320,40);
  //arms[0]=loadImage("armsLeft.png");     // left
  //arms[1]=loadImage("armsNeutral.png");  // middle
  //arms[2]=loadImage("armsRight.png");    // right
} // setup()
  
void draw() {
  body.draw();
  move.draw();
  head.draw();
}



class Sprite {
  float x; float y; float w; float h;
  
  PImage startFace; // the "face" we begin with
  PImage rageFace; // upon "death", the face changes to rage.
  
  
  
  boolean dead;
  
  // constructor
  Sprite(float xx, float yy, float ww, float hh, String image, String other) {
    // setup x and y-coordinates
    x=xx; y=yy;
    // load images
    startFace=loadImage(image); rageFace=loadImage(other);
    // setup width and height
    w=ww; h=hh;
    // set "death" mode to false
    dead=false; } // new Sprite(xx,yy,ww,hh);

  // draw
  void draw() {
    imageMode(CENTER);
    // if not dead, load "rageManStruggles.png",
    // or else load "rageMan.png".
    if(!dead)
      image(startFace,x,y,w,h);
    else if(dead)                            
      image(rageFace,x,y,w,h); } } // Sprite.draw(); Sprite()



class Control {
  float x; float y; float w; float h;
  
  PImage left;   // when the arms move left
  PImage start;  // starting, neutral position
  PImage right;  // when the arms move right
  
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
    image(arms[imageIndex],x,y,w,h);
    /*
    // use "keyCode" for arrow keys to "control" arms
    if(keyCode==LEFT) {       // "move" arms left
      if(imageIndex>0)        // check to make sure you're not out of the array
        imageIndex-=1; }      // LEFT key
    else if(keyCode==RIGHT) { // "move arms right
      if(imageIndex<2)        // check to make sure you're not out of the array
        imageIndex+=1; }      // RIGHT key
    */
  }
}

// Happens when you press the key
void keyPressed() {
  // use "keyCode" for arrow keys to "control" arms
  if(keyCode==LEFT) {       // "move" arms left
    if(imageIndex>0)        // check to make sure you're not out of the array
      imageIndex-=1; }      // LEFT key
  else if(keyCode==RIGHT) { // "move arms right
    if(imageIndex<2)        // check to make sure you're not out of the array
      imageIndex+=1; }      // RIGHT key
} 



