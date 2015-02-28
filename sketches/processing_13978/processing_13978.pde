
//  Maya Tanaka
//  Desma 28 - Interactivity
//  Project 03 - Collage
//  2010/10/20

//   Required Reading:
//  Image 1, Image 4, Typography 1, Typography 2, Typography 3, Transform 1, Transform 2
//  Set a theme then develop a collage system in Processing based on that theme. 
//  Every time your 640 x 480 program is run, a new collage will be generated. 
//  The collages must combine at least two of the following: images, vector files, typography, generated graphics. *********************
//  Have your theme selected, media files, and three sample collages (in Photoshop, Illustrator, or on paper) ready for class on Oct 14th. 
//  A working prototype is due on Oct 19th and the final software is due at the beginning of class on Oct 21. 
//  (Note: If you try to load too many images, your program won't work in OpenProcessing. Be sure to makes tests before the project is due.) 
//  For an extra challenge, add an additional "composition mode" to your program that allows the user to compose the collage elements with the mouse and/or keyboard. 


//  declarations---------------------------------------------
PImage sourbelts, hersheys, lollipop;
PImage dolphin, shark01, shark02;
PImage swedishGreen, swedishRed, swedishYellow;
PShape candyCane, candyCorn, mmsRed, mmsGreen, mmsYellow;
PFont font;
String text01, text02;

int hersheysRandomX, hersheysRandomY, hersheysRandom;
int candyCaneRandomX, lollipopRandomX;
int fishRandomX, fishRandomY;
int candyCornRandomX, candyCornRandomY;
int textRandomX, textRandomY, textRandomSize;
float candyCaneRandomAngle, lollipopRandomAngle, fishRandomAngle, candyCornRandomAngle, textRandomAngle;
float randomScale;


//  setup----------------------------------------------------
void setup () {
  size (640,480);
  smooth ();

  sourbelts = loadImage ("sourbelts.jpg");
  hersheys = loadImage ("hersheys.jpg");
  lollipop = loadImage ("lollipop.png");
  dolphin = loadImage ("dolphin.png");
  shark01 = loadImage ("shark01.png");
  shark02 = loadImage ("shark02.png");
  swedishGreen = loadImage ("swedishGreen.png");
  swedishRed = loadImage ("swedishRed.png");
  swedishYellow = loadImage ("swedishYellow.png");
  candyCane = loadShape ("candyCanev1.0 (Green).svg");
  candyCorn = loadShape ("candyCornv1.0.svg");
  mmsRed = loadShape ("m&mRed.svg");
  mmsGreen = loadShape ("m&mGreen.svg");
  mmsYellow = loadShape ("m&mYellow.svg");
  font = loadFont ("ArialRoundedMTBold-48.vlw");
  textFont (font);
  text01 = "bloop bloop";
  text02 = "glub glub";
  noLoop ();
}

void draw () {
  //  background
  image (sourbelts, 0,0, width,height);

  //  hersheys rocks
  tint (120,150,250, 255);
  hersheysRandomX = int (random (0,width));
  hersheysRandomY = int (random (0,height/3));
  hersheysRandom = int (random (-30,30));
  image (hersheys, hersheysRandomX,hersheysRandomY);
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 45);
  hersheysRandom = int (random (-75,75));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 90);
  hersheysRandom = int (random (-50,50));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 135);
  hersheysRandom = int (random (-30,30));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 180);
  hersheysRandom = int (random (-100,100));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 225);
  hersheysRandom = int (random (-75,75));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 270);
  hersheysRandom = int (random (-30,30));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 315);
  hersheysRandom = int (random (-75,75));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 360);
  hersheysRandom = int (random (-30,30));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 405);
  hersheysRandom = int (random (-50,50));
  image (hersheys, hersheysRandomX + hersheysRandom,hersheysRandomY + 450);
  noTint ();

  //  kelp forest
  candyCaneRandomX = int (random (0,width));
  candyCaneRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (candyCaneRandomX,height - 205);
  rotate (candyCaneRandomAngle);
  shape (candyCane, 0,0);
  popMatrix ();

  candyCaneRandomX = int (random (0,width));
  candyCaneRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (candyCaneRandomX,height - 205);
  rotate (candyCaneRandomAngle);
  shape (candyCane, 0,0);
  popMatrix ();

  lollipopRandomX = int (random (0,width));
  lollipopRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (lollipopRandomX,height - 250);
  rotate (lollipopRandomAngle);
  image (lollipop, 0,0);
  popMatrix ();

  candyCaneRandomX = int (random (0,width));
  candyCaneRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (candyCaneRandomX,height - 205);
  rotate (candyCaneRandomAngle);
  shape (candyCane, 0,0);
  popMatrix ();

  lollipopRandomX = int (random (0,width));
  lollipopRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (lollipopRandomX,height - 250);
  rotate (lollipopRandomAngle);
  image (lollipop, 0,0);
  popMatrix ();

  candyCaneRandomX = int (random (0,width));
  candyCaneRandomAngle = random (radians (-20), radians (10));
  pushMatrix ();
  translate (candyCaneRandomX,height - 205);
  rotate (candyCaneRandomAngle);
  shape (candyCane, 0,0);
  popMatrix ();

  //  fish
  fishRandomX = int (random (10,width - 10));
  fishRandomY = int (random (50,400));
  randomScale = random (0.6,1.0);
  fishRandomAngle = random (radians (-10), radians (10));
  pushMatrix ();
  scale (randomScale);
  translate (fishRandomX,fishRandomY);
  rotate (fishRandomAngle);
  image (swedishGreen, 0,0);
  scale (0.75);
  shape (mmsGreen, -20,-10);
  scale (2.0);
  shape (mmsGreen, -20,-40);
  popMatrix ();

  fishRandomX = int (random (10,width - 10));
  fishRandomY = int (random (50,400));
  randomScale = random (0.6,1.0);
  fishRandomAngle = random (radians (-10), radians (10));
  pushMatrix ();
  scale (randomScale);
  translate (fishRandomX,fishRandomY);
  rotate (fishRandomAngle);
  image (swedishRed, 0,0);
  scale (0.75);
  shape (mmsRed, 180,-10);
  scale (2.0);
  shape (mmsRed, 95,-40);
  popMatrix ();

  fishRandomX = int (random (10,width - 10));
  fishRandomY = int (random (50,400));
  randomScale = random (0.6,1.0);
  fishRandomAngle = random (radians (-10), radians (10));
  pushMatrix ();
  scale (randomScale);
  translate (fishRandomX,fishRandomY);
  rotate (fishRandomAngle);
  image (swedishYellow, 0,0);
  scale (0.75);
  shape (mmsYellow, 180,-10);
  scale (2.0);
  shape (mmsYellow, 95,-40);
  popMatrix ();

  //  school of fish
  candyCornRandomX = int (random (30, width - 30));
  candyCornRandomY = int (random (50,400));
  candyCornRandomAngle = random (radians (70), radians (130));
  pushMatrix ();
  translate (candyCornRandomX,candyCornRandomY);
  rotate (candyCornRandomAngle);
  scale (0.5);
  shape (candyCorn, 0,0);
  shape (candyCorn, 20,100);
  shape (candyCorn, -20,80);
  shape (candyCorn, 50,60);
  shape (candyCorn, 0,140);
  shape (candyCorn, -40,50);
  shape (candyCorn, 20,190);
  shape (candyCorn, 60,180);
  shape (candyCorn, -100,160);
  shape (candyCorn, -5,225);
  popMatrix ();

  //  text
  textRandomX = int (random (10, width - 100));
  textRandomY = int (random (10, height - 20));
  textRandomSize = int (random (30,80));
  textRandomAngle = random (radians (-20), radians (20));
  fill (255);
  textSize (textRandomSize);
  pushMatrix ();
  translate (textRandomX,textRandomY);
  rotate (textRandomAngle);
  text (text01, 0,0);
  popMatrix ();

  textRandomX = int (random (10, width - 100));
  textRandomY = int (random (10, height - 20));
  textRandomSize = int (random (30,80));
  textRandomAngle = random (radians (-20), radians (20));
  textSize (textRandomSize);
  pushMatrix ();
  translate (textRandomX,textRandomY);
  rotate (textRandomAngle);
  text (text02, 0,0);
  popMatrix ();
}

void mousePressed () {
  redraw ();
}


