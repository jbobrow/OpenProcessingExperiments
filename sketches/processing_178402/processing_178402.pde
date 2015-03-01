
/* Arapaoa Moffat (300317288) DSDN 142 Tri3 2014, P2 Part B Final Handin Objects In Space (Interactive Animation)
All code is of my creation, with acknowledgement to the below people i have looked at there methods and implemented them in my own way.
 REFRENCES 
 1.1 - Getting Started With Processing by Casey Reas And Ben Fry 
 7.11 Triggering Timed Events
 1.2 - Extrapixel Gif Animation Libary
 http://extrapixel.github.io/gif-animation/
 1.3 - Experments in processing
 http://p5art.tumblr.com/post/76979034572/exporting-sketches-as-animated-gifs-in-processing
 1.4 - 09 - Sequential Animation Birgit Bachler
 https://vstream.victoria.ac.nz/ess/echo/presentation/81fcf2aa-e6c1-4b61-b080-bc1911e3edc6?ec=true
 1.5 - Processing: How to add background music
 http://stackoverflow.com/questions/11822144/processing-how-to-add-background-music
 1.6 - Ambient Wave By stk13
 https://www.freesound.org/people/stk13/sounds/146955/
 */

/****** GLOBLE IMPORT ******/
/*** import gif libary ***/
import gifAnimation.*;
/** makes sketch into a gif **/
GifMaker gifExport;
/***** LOAD AUDIO LIBARY *****/
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

/****** GLOBAL VARABLES ******/
/**** IMAGE LOAD ****/
/*** BACKGROUND ***/

/*** TWIKLING STARS ***/
int numFrames = 11;
int slow = 25; 
int frame = 0;
PImage[] images = new PImage[numFrames];

/****** FPS VARABLE ******/
float fpsPCMR = frameRate;

/* position varables */
/****** LINES *****/
int linesX = 640;
int linesY = 360;

/***** ELLIPSES ******/
/**** MOTHERSHIPS ****/
/*** TOP ***/
//1 middle
float xPos1 = 640;
float yPos1 = 50;
//2 right
float xPos2 = 150;
float yPos2 = 50;
//3  left
float xPos3 = 1100;
float yPos3 = 250;

/*** MIDDLE ***/
//4 middle left
float xPos4 =50;
float yPos4 =360;
//5 middle right
float xPos5 =1240;
float yPos5 =360;

/*** BOTTOM ***/
//6 Middle
float xPos6 =640;
float yPos6 =670;
//7 Right
float xPos7 =1240;
float yPos7 =670;
//8 Left
float xPos8 =250;
float yPos8 =570;

/**** ESCAPE PODS ****/
float xPosEP1 = 120;
float yPosEP1 = 120;

/****** BOUNCE OFF WALLS ******/
/**** MOTHERSHIPS ****/
/*** TOP ***/
//1 middle
int xDir1=1;
int yDir1=1;
//2 right
int xDir2=1;
int yDir2=1;
//3 left
int xDir3=1;
int yDir3=1;

/*** MIDDLE ***/
// 4 left
float xDir4=1;
float yDir4=1;
// 5 right
float xDir5=1;
float yDir5=1;

/*** BOTTOM ***/
//6 Middle
float xDir6=1;
float yDir6=1;
//7 Right
float xDir7=1;
float yDir7=1;
//8 Left
float xDir8=1;
float yDir8=1;

/**** ESCAPE PODS ****/
float xDirEP1 = 1;
float yDirEP1 = 1;

/****** COLOR ARRAY *****/
/*** BACKGROUND ***/
color [] planetEllipseArray = {
  #225378, // = [0]
  #1695A3, // = [1]
  #ACF0F2, // = [2]
  #F3FFE2, // = [3]
  #EB7F00, // = [4]
};
int planetEllipseColor = int(random(0, planetEllipseArray.length));

/*** ELLIPSE FOCUS COLOR ***/
color [] focusEllipseColorArray = {
  #A5F9CC, // = [0]
  #91DBC8, // = [1]
  #ACF0F2, // = [2]
  #91C5DB, // = [3]
  #A5CAF9, // = [4]
};
int focusEllipseColor =int(random(0, focusEllipseColorArray.length));

/****** SIZING ******/
/*** ELLIPSE SIZE ***/
// mothership
int ellipseMainShip = 60;
//escapepods
float ellipseEscapePod = random(10, 25);
// mouse ellipse pointer
float ellipsePointer = random(5, 10);

/*** Mouse X AND Y DIVIDED VARABLES ***/
int mouseXAndYDivided = 24;

void setup() {
  size(1280, 720);
  noCursor(); // disables mouse
  frameRate(25);
  smooth();
  /*** SHAPE ALIGNMENT MODE ***/
  ellipseMode(CENTER);

  /****** IMAGE LOAD ******/
  /***** BACKGROUND LOAD IMAGE *****/
  /**** TWINKLING STARS ****/
  for (int i = 0; i < numFrames; i++) {
    String imageName = "bgStars" + nf(i+1, 2) + ".jpg";
    images[i] = loadImage(imageName);
  }

  /******* LOAD AUDIO *****/
  minim = new Minim(this);
  player = minim.loadFile("ambientSpace.mp3", 2048);
  player.play();

  /****** EXPORT SKETCH TO GIF ******/
  /* gif export
   gifExport = new GifMaker(this, "MoffatArapDSDN142P2PB.gif");
   gifExport.setRepeat(0); // make it an "endless" animation
   gifExport.setTransparent(255);
   */
}

void draw() {

  /****** TIME BASED VARABLES ******/
  /* time varable */
  int currentTime = millis();

  /****** PRINT LN DEBUGGING ******/
  /*** Time ***/
  println(currentTime);
  /**** FPS ***/
  println(fpsPCMR);

  /*** POSITION ***/
  /** TOP **/
  /* 1 Mid
   println(xPos1);
   println(xPos2);
   println(xPos3);
   println(xPos4);
   println(xPos5);
   println(xPos6);
   println(xPos7);
   println(xPos8);
   
   println(yPos1);
   println(yPos2);
   println(yPos3);
   println(yPos4);
   println(yPos5);
   println(yPos6);
   println(yPos7);
   println(yPos8); */


  /****** IMAGE DISPLAY ******/
  /***** IMAGE BACKGROUND *****/
  background(0);
  /**** IMAGE TWLINKING STARS ****/
  //      i            x         y    
  if (frameCount%slow == 0) {
    frame = (frame+1) % numFrames;
  }
  image(images[frame], -640+mouseX/100, -360+mouseY/100);

  /*** ALPHA LAYER BETWEEN BG AND SKETCH ***/
  // a b c d 
  fill(#000000, 60);
  rect(-640, -360, 1920, 1080);

  /****** INTERCONNECTING LINES *****/
  /*** LINES TIME BASED IF TIME STATMENT ***/
  stroke(255);

  if ((currentTime > 4500) && (currentTime < 29000)) {
    //              x                               y                         x      y
    /*** TOP ***/
    // 1 mid
    line(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    //2 right
    line(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    //3 left
    line(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);

    /*** MIDDLE ***/
    //4 left
    line(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    //5 right
    line(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);

    /*** BOTTOM ***/
    // 6 mid
    line(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    // 7 right
    line(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    // 8 left
    line(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, xPos2+mouseY/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
  }

  /****** MOUSE INTERACTION IF STAMENT MOUSE *****/

  else if ((currentTime > 29000) && (mouseButton == LEFT)) {
    //              x                               y                         x      y
    /*** TOP ***/
    // 1 mid
    line(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, mouseX, mouseY); // 1 top mid +mouseX/24
    //2 right
    line(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, mouseX, mouseY);
    //3 left
    line(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, mouseX, mouseY);

    /*** MIDDLE ***/
    //4 left
    line(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, mouseX, mouseY);
    //5 right
    line(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, mouseX, mouseY);

    /*** BOTTOM ***/
    // 6 mid
    line(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, mouseX, mouseY);
    // 7 right
    line(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, mouseX, mouseY);
    // 8 left
    line(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, mouseX, mouseY);

    /*** ELLIPSE FOLLOW MOUSE ***/
    //fill
    fill(focusEllipseColorArray[focusEllipseColor]);
    //stroke
    noStroke();
    ellipse(mouseX, mouseY, ellipseMainShip, ellipseMainShip);
  }

  /****** KEYBORD INTERACTION SET LINE X AND Y "W" ******/

  else if ((currentTime > 29000) && (key == 'w')) {
    /*** TOP ***/
    //              x                               y                                         x                                                          y
    // 1 mid
    line(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    //2 right
    line(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    //3 left
    line(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, xPos4+mouseY/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);

    /*** MIDDLE ***/
    //4 left
    line(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    //5 right
    line(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);

    /*** BOTTOM ***/
    // 6 mid
    line(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    // 7 
    line(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    // 8 left
    line(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
  }
  /****** KEYBORD INTERACTION SET LINE X AND Y "A" SHOWING DISCONNECTION ******/

  else if ((currentTime > 29000) && (key == 'a')) {
    /*** TOP ***/
    //              x                               y                                         x                                                          y
    // 1 mid
    line(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, xPos1+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided);
    //2 right
    line(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, xPos3+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided);
    //3 left
    line(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, xPos6+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided);

    /*** MIDDLE ***/
    //4 left
    line(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, xPos5+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided);
    //5 right
    line(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, xPos7+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided);

    /*** BOTTOM ***/
    // 6 mid
    line(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, xPos2+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided);
    // 7 
    line(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, xPos4+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided);
    // 8 left
    line(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, xPos6+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided);
  }

  /*** LINES ELSE STAMENT IN CENTER ALIGMENT ***/
  else {

    //STROKE
    stroke(255);
    //      x     y      x    y
    /*** TOP ***/
    // 1 mid
    line(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, linesX, linesY); // 1 top mid +mouseX/mouseXAndYDivided
    //2 right
    line(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, linesX, linesY);
    //3 left
    line(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, linesX, linesY);

    /*** MIDDLE ***/
    //4 left
    line(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, linesX, linesY);
    //5 right
    line(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, linesX, linesY);

    /*** BOTTOM ***/
    // 6 mid
    line(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, linesX, linesY);
    // 7 right
    line(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, linesX, linesY);
    // 8 left
    line(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, linesX, linesY);
  }

  /****** ELLIPSE PLACEMENT ******/
  //fill
  fill(planetEllipseArray[planetEllipseColor]);
  //stroke
  noStroke();
  /*** TOP ***/
  //                 x             y        w               h
  ellipse(xPos1+mouseX/mouseXAndYDivided, yPos1+mouseY/mouseXAndYDivided, ellipseMainShip, ellipseMainShip); //1 top mid

  /*** FOCUS ELLIPSE COLOR FILL***/
  if ((currentTime > 4500) && (currentTime < 29000)) { 
    fill(focusEllipseColorArray[focusEllipseColor]);
  };
  ellipse(xPos2+mouseX/mouseXAndYDivided, yPos2+mouseY/mouseXAndYDivided, ellipseMainShip+40, ellipseMainShip+40); //2 top right
  //fill
  fill(planetEllipseArray[planetEllipseColor]);
  ellipse(xPos3+mouseX/mouseXAndYDivided, yPos3+mouseY/mouseXAndYDivided, ellipseMainShip+70, ellipseMainShip+70); //3 top left

  /*** MIDDLE ***/
  //left middle
  ellipse(xPos4+mouseX/mouseXAndYDivided, yPos4+mouseY/mouseXAndYDivided, ellipseMainShip+2, ellipseMainShip+2); //4 left center
  //right middle
  ellipse(xPos5+mouseX/mouseXAndYDivided, yPos5+mouseY/mouseXAndYDivided, ellipseMainShip+60, ellipseMainShip+60); //5 right center

  /* bottom */
  ellipse(xPos6+mouseX/mouseXAndYDivided, yPos6+mouseY/mouseXAndYDivided, ellipseMainShip+25, ellipseMainShip+25); //6 bottom mid
  ellipse(xPos7+mouseX/mouseXAndYDivided, yPos7+mouseY/mouseXAndYDivided, ellipseMainShip+15, ellipseMainShip+15); //7 bottom right
  ellipse(xPos8+mouseX/mouseXAndYDivided, yPos8+mouseY/mouseXAndYDivided, ellipseMainShip+55, ellipseMainShip+55); //8 bottom left

  /****** IF STATMENTS BOUNCE ELLIPSE******/
  /*** TOP ***/

  /* 1 MIDDLE */
  //incrmentation
  xPos1=xPos1+xDir1;
  yPos1=yPos1+yDir1;
  //ifstament stop going offscreen
  if ((xPos1>width)||(xPos1<0) || (yPos1>height)||(yPos1<0)) {
    xDir1=- xDir1;
    yDir1=- yDir1;
  }
  /* 2 RIGHT */
  //incrmentation
  xPos2=xPos2+xDir2;
  yPos2=yPos2+yDir2;
  //ifstament stop going offscreen
  if ((xPos2>width)||(xPos2<0) || (yPos2>height)||(yPos2<0)) {
    xDir2=- xDir2;
    yDir2=- yDir2;
  }
  /* 3 LEFT */
  //incrmentation
  xPos3=xPos3+xDir3;
  yPos3=yPos3+yDir3;
  //ifstament stop going offscreen
  if ((xPos3>width)||(xPos3<0) || (yPos3>height)||(yPos3<0)) {
    xDir3=- xDir3;
    yDir3=- yDir3;
  }

  /*** MIDDLE ***/
  /* 4 left */
  //incrmentation
  xPos4=xPos4+xDir4;
  yPos4=yPos4+yDir4;
  //ifstament stop going offscreen
  if ((xPos4>width)||(xPos4<0) || (yPos4>height)||(yPos4<0)) {
    xDir4=- xDir4;
    yDir4=- yDir4;
  }
  /* 5 RIGHT */
  //incrmentation
  xPos5=xPos5+xDir5;
  yPos5=yPos5+yDir5;
  //ifstament stop going offscreen
  if ((xPos5>width)||(xPos5<0) || (yPos5>height)||(yPos5<0)) {
    xDir5=- xDir5;
    yDir5=- yDir5;
  }

  /*** BOTTOM ***/
  /* 6 MID */
  //incrmentation
  xPos6=xPos6+xDir6;
  yPos6=yPos6+yDir6;
  //ifstament stop going offscreen
  if ((xPos6>width)||(xPos6<0) || (yPos6>height)||(yPos6<0)) {
    xDir6=- xDir6;
    yDir6=- yDir6;
  }
  /* 7 RIGHT */
  //incrmentation
  xPos7=xPos7+xDir7;
  yPos7=yPos7+yDir7;
  //ifstament stop going offscreen
  if ((xPos7>width)||(xPos7<0) || (yPos7>height)||(yPos7<0)) {
    xDir7=- xDir7;
    yDir7=- yDir7;
  }
  /* 8 LEFT */
  //incrmentation
  xPos8=xPos8+xDir8;
  yPos8=yPos8+yDir8;
  //ifstament stop going offscreen
  if ((xPos8>width)||(xPos8<0) || (yPos8>height)||(yPos8<0)) {
    xDir8=- xDir8;
    yDir8=- yDir8;
  }
  
  /****** EXPORT SKETCH *******/   
  /****** SAVE SKETCH TO GIF ******/
   /* if (frameCount%2==0 &&  frameCount<374) {
   gifExport.setDelay(0); // = speed of the animated GIF
   gifExport.addFrame();
   } */
  //save to gif 
  //if (frameCount>374) gifExport.finish();

  /****** SAVE SKETCH TO .TIFF ******/
  //saveFrame("./img/moffatArapDSDN142P2PB-####.tif");

  /***** RUN SKETCH FOR 15 SECONDS THEN EXIT FOR RECORDING ******/
  /* exit sketch after 15 seconds 
   //note since the loading takes up 3 seconds of processing time animation was endinup 3.33 seconds fewer frames so added this as a buffer so that exported is at 25fps for 15 seconds
   if (currentTime > 18000) { 
   
   exit(); 
   } */
}



