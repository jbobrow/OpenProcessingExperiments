
PFont stencilfont;
PFont edwardfont;
PFont stencilBigfont;
PImage scaryFace;
color dontPush;
color push;
color theBackground;
color theText;
int dontPushRadius;
int pushRadius;
int value=0;
int Xvelocity;
int Yvelocity;
int xBall;
int yBall;
int xTextLocation;
int yTextLocation;
boolean b1=false;
boolean b2=false;
String theTitle="The common sense game...";
String bigButtonText="don't push";
String smallButtonText="push here";
String playAgain="Click to play again";

void setup () {
 size(800, 800);
 stencilfont=loadFont("stencil_font.vlw");
 edwardfont=loadFont("edward_font.vlw");
 stencilBigfont=loadFont("stencil_big_font.vlw");
 scaryFace=loadImage("theexorcist.jpg");
 theBackground=color(255, 255, 255);
 theText=color(0, 0, 0);
 dontPushRadius=200;
 pushRadius=50;
 xBall=650;
 yBall=400;
 xTextLocation=628;
 yTextLocation=383;
 Xvelocity=int(random(1, 10));
 Yvelocity=int(random(1, 10));
 smooth();
}

void draw () {
 //program start
 if (b1==false) {
   background(theBackground);
   textFont(edwardfont, 100);
   textAlign(CENTER, TOP);
   fill(theText);
   stroke(theText);
   text(theTitle, 0, 0, 800, 300);
   textAlign(LEFT);
   textFont(edwardfont, 75);
   if (b2==false) {
     text("Click for hint:", 25, 650, 400, 100);
   }
   if (dist(100, 690, mouseX, mouseY)<50 && mousePressed) {
     textFont(edwardfont, 50);
     text("Use common sense to win", 350, 715);
   }


   //push here button
   fill(0, 255, 0);
   stroke(0, 255, 0);
   textFont(stencilfont, 18);
   if (dist(xBall, yBall, mouseX, mouseY)<pushRadius && b2==false) {
     ellipse(xBall, yBall, pushRadius*3, pushRadius*3);
     fill(0);
     text("yes,", 633, 375);
   }
   else {
     ellipse(xBall, yBall, pushRadius*2, pushRadius*2);
   }
   fill(0);
   textFont(stencilfont, 18);
   text(smallButtonText, xTextLocation, yTextLocation, 100, 100);
   if ((dist(650, 400, mouseX, mouseY)<pushRadius) && mousePressed) {
     b2=true;
   }
   //win the game!
   if (b2==true) {
     theBackground=color(0, 0, 0);
     fill(255);
     stroke(255);
     textFont(stencilBigfont, 48);
     textAlign(CENTER);
     text(playAgain, 0, 700, 800, 300);
     textAlign(LEFT);
     theTitle="You win!";
     theText=color(255, 255, 255);
     smallButtonText="Yay!";
     bigButtonText="Yay!";
     xBall += Xvelocity;
     yBall += Yvelocity;
     xTextLocation += Xvelocity;
     yTextLocation += Yvelocity;
     //ball movement definitions
     if (xBall < 50 || xBall>width-50) {
       Xvelocity *= -1;
     }
     else if (yBall<50 || yBall>height-50)
     {
       Yvelocity *= -1;
     }
     if (dist (xBall, yBall, 200, 400)<((dontPushRadius)+pushRadius)) {
       Xvelocity *= -1;
       Yvelocity *= -1;
     }
   }


   //don't push button
   fill(255, 0, 0);
   stroke(255, 0, 0);
   ellipse(200, 400, dontPushRadius*2, dontPushRadius*2);
   textFont(stencilfont, 48);
   fill(0);
   text(bigButtonText, 140, 350, 200, 200);
   if (dist(200, 400, mouseX, mouseY)<dontPushRadius && b2==false) {
     fill(255, 0, 0);
     stroke(255, 0, 0);
     ellipse(200, 400, dontPushRadius*3, dontPushRadius*3);
     fill(0);
     text("seriously,", 90, 290, 500, 100);
     text("don't push", 140, 350, 200, 200);
     if (mousePressed) {
       b1=true;
     }
   }
 }

 if  (b1==true) {
   image(scaryFace, -175, -100);
   fill(255, 0, 0);
   textFont(stencilBigfont, 100);
   textAlign(CENTER);
   text("YOU LOSE", 0, 150, 800, 300);
   textFont(edwardfont, 100);
   text("Game over", 0, 350, 800, 300);
   textFont(stencilfont, 48);
   text(playAgain, 0, 700, 800, 300);
 }
 textAlign(LEFT);

 if (b1==true || b2==true) {
   if (mouseY>675 && mousePressed) {
     b1=false;
     b2=false;
     theBackground=color(255);
     theTitle="The common sense game...";
     smallButtonText="push here";
     bigButtonText="don't push";
     xBall=650;
     yBall=400;
     xTextLocation=628;
     yTextLocation=383;
     theText=(0);
   }
 }
}

