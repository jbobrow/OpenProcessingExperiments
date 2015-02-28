
// creature's local origin
int localX = 256;
int localY = 175;

//-------------------------------------------

// switch to turn grid on/off
boolean gridOn = false;   // start "off"

//
// keyTyped() is called once every time a key is pressed
//     ignoring CTRL, SHIFT, ALT
void keyTyped() {
  if ( key == 'g'  || key == 'G' ) {
    gridOn = !gridOn;
  }
}

//
// draw_grid() is used to overlay a grid
//
void draw_grid() {

  // grid parameters
  int span      = 500;    // how far each way from the local origin
  int increment = 25;     // how close the lines are
                          // note: should be a factor of 100
  // draw grid
  strokeWeight( 1 );
  for ( int i=-span; i<=span; i+=increment ) {
    if ( ( i % 100 ) == 0 ) {
      stroke( 255, 0, 0, 192 );
    } else {
      stroke( 255, 0, 0, 64 );
    }
    line( localX-i, localY-span, localX-i, localY+span );

    if ( ( i % 100 ) == 0 ) {
      stroke( 0, 0, 255, 192 );
    } else {
      stroke( 0, 0, 255, 64 );
    }
    line( localX-span, localY-i, localX+span, localY-i );
  }
  
  // draw axes
  strokeWeight( 2.5 );
  stroke( 255, 0, 0 );
  line( 0, localY, width, localY );  
  stroke( 0, 0, 255 );
  line( localX, 0, localX, height );
}


//
// setup() is called once at the beginning to initialize
//
void setup() {
  size( 512, 512 );        // size of the window
  smooth();                // antialiasing 
}
//color options -----I intend to make these integer variables active in future versions as a means to select different colors for the helmet and armor.----
//red
  int r1=75; int g1=0; int b1=0;
  int r2=175; int g2=0; int b2=0;
  int r3=255; int g3=0; int b3=0;
//blue
  int r4=0; int g4=0; int b4=75;
  int r5=0; int g5=0; int b5=175;
  int r6=0; int g6=0; int b6=255;
//green
  int r7=0; int g7=75; int b7=0;
  int r8=0; int g8=175; int b8=0;
  int r9=0; int g9=255; int b9=0;
//yellow
  int r10=75; int g10=75; int b10=0;
  int r11=175; int g11=175; int b11=0;
  int r12=255; int g12=255; int b12=0;
//color pick
int rCP = r2; int gCP = g2; int bCP = b2;

//gray values---will be static color values

int gray1 = 200;
int gray2 = 150;
int eyeGray = 235;
int pupilBlack = 0;
int bg = 255;

//skin tones---will be static color values
int rNeck = 219; int gNeck = 180; int bNeck = 142;
int rHead = 240; int gHead = 213; int bHead = 184;
int rFace = 240; int gFace = 213; int bFace = 184;
int rShadow = 206; int gShadow = 182; int bShadow = 158;
int rMouth = 196; int gMouth = 121; int bMouth = 121;

//
//
// draw() is called once per frame to draw
//
void draw() {
  background( bg );       // white background

  // move the local origin??
  if ( gridOn  &&  mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
    println( "localX is " + localX + "    localY is " + localY );
  }

rectMode( CENTER );
ellipseMode( CENTER );

//--------------------------------
noStroke();



//BODY
fill(rCP, gCP, bCP);
  //rightElbow
  ellipse(localX-58,localY+172,33,45);
  //leftElbow
  ellipse(localX+58,localY+172,33,45);
  //arms
  rect(localX,localY+125,150,100);
fill(gray1);
  //waist
  ellipse(localX,localY+200,115,66);
  //chest
  rect(localX,localY+135,115,140);
  

  
//scales---------------------------------------------
  //variables----------------------------
  /*
int scW = 20;
int scH = 30;
int scSp = 20;
int scY = localY+206;
int scYEnd = localY+105;
  //-------------------------------------------

while (scY>scYEnd) {
  int scX = localX-50;
  int scXEnd = localX+51;
while (scX<scXEnd) {
  fill(gray2);
  ellipse(scX,scY,scW,scH);
fill(gray1);
  ellipse(scX,scY-2,scW,scH);
  scX=scX+scSp;
}
scY=scY-scSp;
}
*/
//--------------------------------------------------------


fill(rCP, gCP, bCP);
  //shoulders
  ellipse(localX,localY+75,150,66);

//HEAD
fill(rNeck,gNeck,bNeck);
  //neckRound
  ellipse(localX,localY+72,35,35);
  //neck
  rect(localX,localY+50,35,50);
fill(rHead,gHead,bHead);
  //head
  ellipse(localX,localY,100,125);
fill(gray1);

//FACE
  //Eye
fill(eyeGray);
    //leftEyeScalera
    ellipse(localX-24,localY,27,13);
    //rightEyeScalera
    ellipse(localX+23,localY,27,13);
fill(r5,g5,b5); //eye blue
    //leftEyeCornea
    ellipse(localX-24,localY,10,10);
    //rightEyeCornea
    ellipse(localX+23,localY,10,10);
fill(pupilBlack);
    //leftEyePupil
    ellipse(localX-24,localY,5,5);
    //rightEyePupil
    ellipse(localX+23,localY,5,5);
fill(rMouth,gMouth,bMouth);
  //Mouth
    ellipse(localX,localY+45,30,3);
fill(rShadow,gShadow,bShadow);
  //Nose
    ellipse(localX,localY+24,25,21);
fill(rFace,gFace,bFace);
  //Nose
    ellipse(localX,localY+23,25,17);
fill(rShadow,gShadow,bShadow);
 //ChinShadow
    ellipse(localX,localY+55,15,10);
fill(rFace,gFace,bFace);
  //Chin
    ellipse(localX,localY+58,15,10);

//HELMET
fill(rCP, gCP, bCP);
  //leftSide
  rect(localX+47,localY+20,15,66);
  //rightSide
  rect(localX-47,localY+20,15,66);
fill(gray1);
  //leftCheekGuard
  rect(localX+42,localY+45,30,40);
  //rightCheekGuard
  rect(localX-43,localY+45,30,40);
fill(rCP, gCP, bCP);
  //helmetDome
  ellipse(localX,localY-53,110,80);
fill(gray1);
  //noseGuard
  rect(localX,localY-35,15,120);
fill(gray1);
  //helmetFrame
  rect(localX,localY-30,110,40);
fill(gray2);
   //rivot1Shadow
  ellipse(localX-46,localY-29,9,9);
  //rivot2Shadow
  ellipse(localX-24,localY-29,9,9);
  //rivot3Shadow
  ellipse(localX-1,localY-29,9,9);
  //rivot4Shadow
  ellipse(localX+22,localY-29,9,9);
  //rivot5Shadow
  ellipse(localX+44,localY-29,9,9);
fill(gray1);
  //rivot1
  ellipse(localX-45,localY-28,7,7);
  //rivot2
  ellipse(localX-23,localY-28,7,7);
  //rivot3
  ellipse(localX,localY-28,7,7);
  //rivot4
  ellipse(localX+23,localY-28,7,7);
  //rivot5
  ellipse(localX+45,localY-28,7,7);
fill(gray2);
   //rivot6Shadow
  ellipse(localX-46,localY+56,9,9);
  //rivot7Shadow
  ellipse(localX+44,localY+56,9,9);
fill(gray1);
  //rivot6
  ellipse(localX-45,localY+55,7,7);
  //rivot7
  ellipse(localX+45,localY+55,7,7);
  
//Color Panel
fill(gray2);
rect (50, 256, 100, height);
//reds-------------------------
fill(r1,g1,b1);
rect (25,150,20,20);//darkred
fill(r2,g2,b2);
rect (50,150,20,20);//medium red
fill(r3,g3,b3);
rect (75,150,20,20);//light red
//blues------------------------
fill(r4,g4,b4);
rect (25,175,20,20);//dark blue
fill(r5,g5,b5);
rect (50,175,20,20);//medium blue
fill(r6,g6,b6);
rect (75,175,20,20);//light blue
//greens-----------------------
fill(r7,g7,b7);
rect (25,200,20,20);//dark green
fill(r8,g8,b8);
rect (50,200,20,20);//medium green
fill(r9,g9,b9);
rect (75,200,20,20);//light green
//yellows----------------------
fill(r10,g10,b10);
rect (25,225,20,20);//dark yellow
fill(r11,g11,b11);
rect (50,225,20,20);//medium yellow
fill(r12,g12,b12);
rect (75,225,20,20);//light yellow
//------------------------------
  
if (mousePressed && (mouseX>=15 && mouseX<=26) && (mouseY>=140 && mouseY<=160)) {
  rCP=r1;
  gCP=g1;
  bCP=b1;
}
if (mousePressed && (mouseX>=40 && mouseX<=60) && (mouseY>=140 && mouseY<=160)) {
  rCP=r2;
  gCP=g2;
  bCP=b2;
}
if (mousePressed && (mouseX>=65 && mouseX<=85) && (mouseY>=140 && mouseY<=160)) {
  rCP=r3;
  gCP=g3;
  bCP=b3;
}
if (mousePressed && (mouseX>=15 && mouseX<=26) && (mouseY>=165 && mouseY<=185)) {
  rCP=r4;
  gCP=g4;
  bCP=b4;
}
if (mousePressed && (mouseX>=40 && mouseX<=60) && (mouseY>=165 && mouseY<=185)) {
  rCP=r5;
  gCP=g5;
  bCP=b5;
}
if (mousePressed && (mouseX>=65 && mouseX<=85) && (mouseY>=165 && mouseY<=185)) {
  rCP=r6;
  gCP=g6;
  bCP=b6;
}
if (mousePressed && (mouseX>=15 && mouseX<=26) && (mouseY>=190 && mouseY<=210)) {
  rCP=r7;
  gCP=g7;
  bCP=b7;
}
if (mousePressed && (mouseX>=40 && mouseX<=60) && (mouseY>=190 && mouseY<=210)) {
  rCP=r8;
  gCP=g8;
  bCP=b8;
}
if (mousePressed && (mouseX>=65 && mouseX<=85) && (mouseY>=190 && mouseY<=210)) {
  rCP=r9;
  gCP=g9;
  bCP=b9;
}
if (mousePressed && (mouseX>=15 && mouseX<=26) && (mouseY>=215 && mouseY<=235)) {
  rCP=r10;
  gCP=g10;
  bCP=b10;
}
if (mousePressed && (mouseX>=40 && mouseX<=60) && (mouseY>=215 && mouseY<=235)) {
  rCP=r11;
  gCP=g11;
  bCP=b11;
}
if (mousePressed && (mouseX>=65 && mouseX<=85) && (mouseY>=215 && mouseY<=235)) {
  rCP=r12;
  gCP=g12;
  bCP=b12;
}
  
  // draw the grid
  if ( gridOn ) {
    draw_grid();
  }
}
