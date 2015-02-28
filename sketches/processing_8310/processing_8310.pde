

int page = 1;

PImage home;

//text
PFont font;
float textx1 = 240;
float textx2 = 240;

//center rectangle
float rectx = 240;
float recty = 160;
float rectwidth = 220;
float rectheight = 10;
float halfrw = 110;
float rectspeed = random (2, 5);

// top ellipse
float tellx = 240;
float telly = 30;
int circlesize = 15;
int rectdirection = 1;
int telldirection = 1;
float circlespeed = random (2, 3);

//bottom ellipse
int bellx = 240;
int belly = 270;
float radius = 15;

//bottom rectangle (missile)
int brectx = 240;
int brecty = 250;
int brectwidth = 3;
int brectheight = 20;

//lives
int lives = 3;
int l = 0;

int rectcolor = 255;

//booleans
boolean missilemoving = false;


///////////////////////VOID SETUP\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void setup () {
  size (480, 320);
  font = loadFont ("AndaleMono-32.vlw");
  textFont (font);
  smooth();
  noStroke ();
  textAlign (CENTER);
  ellipseMode (RADIUS);
  rectMode (CENTER);
  home = loadImage ("homepage.jpg");
}

////////////////////////VOID DRAW\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void draw () {

  if (page == 1) {
    pageOne();

  }
  else if (page == 2) {
    pageTwo(); 
  }
}

//////////////////////////PAGE CHANGES\\\\\\\\\\\\\\\\\\\\\\\\\\
void mousePressed() {

  //  else if (page == 2){
  //    page = 1;
  //  }
}

//page one
void pageOne (){
  image (home, 0, 0);

  if(mousePressed){
    page = 2; 
  }
}


//page two
void pageTwo (){

  background (0);
  fill (73, 50, 50);
  textSize (18);
  text ("LIVES: " + (3-l), 410, 305);


  //OBJECTS
  fill (255, rectcolor, rectcolor);
  rect (rectx, recty, rectwidth, rectheight);

  fill (255);
  ellipse (tellx, telly, circlesize, circlesize);
  ellipse (bellx, belly, radius, radius);
  rect (brectx, brecty, brectwidth, brectheight);

  //////////CENTER RECT MOVEMENT\\\\\\\\\\\\
  rectx += rectspeed * rectdirection;
  if ((rectx > width - halfrw) || (rectx < halfrw)) {
    rectdirection = -rectdirection;
  }

  ///////////////TOP BALL MOVEMENT\\\\\\\\\\\\\\\\
  tellx += circlespeed * telldirection;
  if ((tellx > width - circlesize) || (tellx < circlesize)){
    telldirection = -telldirection;
  }

  ///////////////////////MISSILE MOVEMENT\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  if (missilemoving == true) {
    brecty = brecty - 10;
  }

  if (brecty < -10) {
    missilemoving = false;
  }

  //RECTANGLE INTERSECTION
  if (rectRectIntersect(rectx-halfrw, recty-5, rectx-halfrw+rectwidth, recty-5+rectheight, brectx-1.5, brecty-10, brectx-1.5+10, brecty-10+20) == true) {
    missilemoving = false;
    lives -= 1;
    l += 1;
    rectcolor -= 85;
    println (lives);
  }  

  if (lives <= 0){
    textSize (32);
    text ("YOU LOSE", textx1, 140);
    textSize (14);
    text ("click to play again", textx1, 190); 
  }

  /////CIRCLE INTERSECTION
  if (rectCircleIntersect(brectx, brecty, brectwidth, brectheight, tellx, telly, circlesize) == true) {
    missilemoving = false;
    circlesize -= 3;
    println (circlesize);
  }

  if (circlesize <= 0){
    textSize (32);
    text ("YOU WIN", textx2, 140);
    textSize (14);
    text ("click to play again", textx2, 190);
  }

  ////////MISSILE RETURN\\\\\\\\\\\\\\
  if (missilemoving == false) {
    brecty = 250; 
  }

  ////////////////////////////BOTTOM MOVEMENT\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  if (keyPressed == true){

    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (keyPressed == true){
          bellx = bellx + 3;
          brectx= brectx + 3;
        }
      }
    }

    if (key == CODED){
      if (keyCode == LEFT){
        if (keyPressed == true){
          bellx = bellx - 3;
          brectx = brectx - 3;
        }
      }
    } 
  }

  if (mousePressed){
    rectx = 240;
    tellx = 240;
    circlesize = 15;
    bellx = 240;
    brectx = 240;
    lives = 3;
    l = 0;
    rectcolor = 255;
  }
}

///////////////////////////CASEY'S BOOLEAN CODES\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//RECT/CIRCLE
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false; 
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false; 
  }
  if (circleDistanceX <= rw/2) { 
    return true; 
  } 
  if (circleDistanceY <= rh/2) { 
    return true; 
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

//RECT/RECT
boolean rectRectIntersect(float left, float top, float right, float bottom, 
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


/////////////////////////VOIDKEYPRESSED\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void keyPressed(){

  ////////MISSILE SHOOT\\\\\\\\\
  if (key == ' '){
    missilemoving = true;      
  }
}


