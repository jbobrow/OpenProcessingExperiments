
// Final project of Computational Arts

// Idea was taken from falling leaves of fall. Initially I thought of making a realistic representation
// of leaves falling but processing is all about artistic representation, so a non-realistic 
// represention of leaves, drops or "balls" falling have been shown. 
// I also add a very simple implementation of sound in which a "music ball" can be added that will ring
// if a falling  object touches it.


// Title: Falling colorfully
// Draws 3 types of objects on mouse click that will be redrawn on increasingly higher value of y and with 
// some randomness in x.
// The object types can be selected by keypresses. The color filled in these objects is typically random but
// 9 other colors can be chosen by pressing 1-9
// A special round shape can also be added through mouse click (and selection by pressing the appropriate key 
// on the keyboard). This shape will play a sample sound when an object coming down comes in contact with it.
// The fill color of the object is also changed.

/* Input
MOUSE
click: creates a leaf/drop/ball that will "fall down". A "music sphere" can also be created (depending
on the keypressed) that will be stationary.

KEYBOARD
0: Select white color
1-9: Selects the color of lines
r: Select random fill color (default)
b: Toggles ball object
l: Toggles leaf object (default)
d: Toggles drop object 
m: Toggles music object

s or S: save a screen shot
DEL or BACKSPACE: Reset variables and clear the drawing surface
+: Increase the frequency of the objects
-: Decrease the frequency of the objects

*: Increase the distance of falling objects
/: Decrease the distance of falling objects
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// Lecture 2: loading sound

Minim minimVar;
AudioSample bellSample;
AudioPlayer bellPlayer;


// ------------ Global Varibles
color strokeColor = color(0,10);
boolean randomColor = true;
int screenSaveNo = 1;
int hasHorizontalOption = 1;
int hasVerticalOption = 1;

boolean dropLeaves = true; // With key 'd'
boolean addMusicDome = false; // With key 'm'
boolean dropWater = false; // With key 'w'
boolean dropBall = false;

int maxFrameRate = 30;
int dropleavesAfterFrames = 15;
int dropLeavesPixels = 10;
//float dropSpeedWater = 0.1; // = 30 * 0.1 = 3 pixels/second
int dropWaterAfterFrames = 15;
int dropWaterPixels = 6;


int maxDropSpeedLeaves = 20; // = 30 frames/sec * 20 pixels/frames = 600pixels/sec
int maxDropWaterLeaves = 50; // = 30 * 50 = 1500 pixels/sec

int screenSizeX = 1280;
int screenSizeY = 720;

int leavesToDropCount = 0;
int musicBoxToAddCount = 0;

IntList leavesXPosList;
IntList leavesYPosList;
IntList leavesNextMoveFrames;
IntList leavesNextMovePixelCount;

IntList musicBoxXPosList;
IntList musicBoxYPosList;

void setup() {
  
  minimVar = new Minim(this);
  
  leavesXPosList = new IntList();
  leavesYPosList = new IntList();
  leavesNextMoveFrames = new IntList();
  leavesNextMovePixelCount = new IntList();
  
  musicBoxXPosList = new IntList();
  musicBoxYPosList = new IntList();
  
  try
  {
    //bellPlayer = minimVar.loadFile("bell-ringing-05.wav");
    //bellPlayer = minimVar.loadFile("small-bell-ring-01a.mp3");
    bellSample = minimVar.loadSample("small-bell-ring-01a.mp3");
    //bellSample = minimVar.loadSample("bell-ringing-05.wav");
    
    //bellPlayer.play();
  }
  catch(Exception e)
  {
  }
  
  size(screenSizeX, screenSizeY);

  colorMode(HSB, 360, 100, 100, 100);
  //colorMode(RGB, 720, 720, 720);
  noFill();

  //background(360);  // White
  background(40, 50, 50, 10); // very pale brown
  
  frameRate(maxFrameRate);
}

void draw() {

   // Draw animation of leaves
   if( leavesXPosList.size() > 0)
   {
         // For all leaves drawn (it turns out that my code can run only 1 at a time for some reason)
         for( int leafI = 0; leafI < leavesXPosList.size(); leafI++ )
         {
           int currMoveFrame = leavesNextMoveFrames.get(leafI);
           if( currMoveFrame > 0 )
             leavesNextMoveFrames.set(leafI, currMoveFrame-1);
           else
           {
             // The time has come to move the leaf down
             int initPosX = leavesXPosList.get(leafI);
             int initPosY = leavesYPosList.get(leafI);
             int dropPix = leavesNextMovePixelCount.get(leafI);
             float angle  = random(PI/4) - PI/8;
             
             initPosY = initPosY + dropPix;
             initPosX = initPosX + (int)random(0, dropPix*2) - dropPix;
             
             translate(initPosX, initPosY);
             rotate(angle);
             
             // Draw the appropriate object (note we use leaf x, y and frame but they apply to all)
             if( dropLeaves == true )
               drawSimpleLeaf();
             else if( dropWater == true )
               drawSimpleDrop();
             else if( dropBall == true )
               drawSimpleBall();
             else //addMusicDome = false;
             {
               // Nothing to do here
             }
             
             leavesYPosList.set(leafI, initPosY);
             // Don't update leavesXPosList
             
             if( initPosY >= height)
             {
               leavesXPosList.remove(leafI);
               leavesYPosList.remove(leafI);
               leavesNextMoveFrames.remove(leafI);
               leavesNextMovePixelCount.remove(leafI);
             }
             
             HitWithMusicBox(initPosX+20,initPosY+45);
           }
         }
   }
   
   // If a new falling object has been added, draw it and add it to the list of animation
   // NOTE: "leaves" is used but it refers to all objects
   if( leavesToDropCount > 0)
   {
     if( randomColor == true )
       fill(random(100,360),random(100),random(100),random(100));
     else
       fill(strokeColor);
       
       translate(mouseX, mouseY);
       
       if( dropLeaves == true )
         drawSimpleLeaf();
       else if( dropWater == true )
         drawSimpleDrop();
       else if( dropBall == true)
         drawSimpleBall();
       else //addMusicDome = false;
       {
         // No translation for music dome
       }
       
       leavesToDropCount--;
       
       // Add the leaf for processing movement
       leavesXPosList.append(mouseX);
       leavesYPosList.append(mouseY);
       leavesNextMoveFrames.append(dropleavesAfterFrames);
       leavesNextMovePixelCount.append(dropLeavesPixels);
   }
   
   // If a music ball is added with a mouse click, create it
   if( musicBoxToAddCount > 0 )
   {
     int newPosY = mouseY + 50;
     if( newPosY > height)
       newPosY = height - 20;
     
     fill(random(100,360),random(100),random(100),random(100));
     drawMusicDome(mouseX+20,newPosY);
     
     musicBoxXPosList.append(mouseX+20);
     musicBoxYPosList.append(newPosY);
     musicBoxToAddCount--;
   }
}

// Check if a falling object hits the music ball
// If a hit occurs, play the sample sound and change the color of the fill
void HitWithMusicBox(int x, int y)
{
  for( int boxI = 0; boxI < musicBoxXPosList.size(); boxI++ )
  {
    int currX = musicBoxXPosList.get(boxI);
    int currY = musicBoxYPosList.get(boxI);
    
    int diffX = currX - x;
    int diffY = currY - y;
    
    //print("Difference x=");
    //print(diffX);
    //print("\n Difference y=");
    //print(diffY);
    //print("\n");
    
    if( diffX > -20 && diffX < 20)
    {
      if( diffY > -20 && diffY < 20 )
      { 
        for( int elI = 0; elI < 10; elI++ )
        {
          int elx = currX + (int)random(10) - 5;
          int ely = currY + (int)random(10) - 5;
          int elSize = (int)random(5, 25);
          
          fill(random(0, 120),random(100),random(100),random(100));
          //ellipse( elx, ely, elSize, elSize);
          
        }
        
        try
        {
          //bellPlayer.play();
          bellSample.trigger();
        }
        catch(Exception e)
        {
        }
        
        musicBoxXPosList.remove(boxI);
        musicBoxYPosList.remove(boxI);
      }
    }
  }
}

void drawSimpleLeaf(){ // draw a leaf as follows
 
 color leafStrokecolor = color(0);
 stroke(leafStrokecolor);
  float pointShift = random(-20,20); // here is a variable between -20 and 20
  beginShape(); // start to draw a shape
  vertex(20, 45); // begin at this point x, y
  //vertex(0,0);
  // bezierVertex(30,30,60,40,70 + random(-20,20),50); // moving only the pointy point meant that sometimes the leaf shape would turn into a heart shape, because the control points were not also moving. So I created a variable called pointShift
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); // make the pointy end of the leaf vary on the x axis (so the leaf gets longer or shorter) AND vary the y axis of the control points by the same amount. It should be possible to have 'normal' leaves, very short fat ones and very long thin ones.
    bezierVertex(60 + pointShift,55, 30,65, 20,45); // draw the other half of the shape
  endShape();
 
}

// Draw an object shaped like water drop
void drawSimpleDrop(){
  noStroke();
  int r = 8;
  for (int i = 2; i < r; i++ )
   ellipse(20, 45 + i*4,i*2,i*2); 
}

void drawSimpleBall(){
  
  noStroke();
  float sizeX = random(6, 20);
  ellipse( 20, 45, sizeX, sizeX);
}

// Draw a ball/circle that can play back a sound sample
void drawMusicDome(int centerX, int centerY){
  
  noStroke();
  float sizeX = random(20, 45);
  ellipse( centerX, centerY, sizeX, sizeX);
  
}

void mouseReleased() {
  
  if( addMusicDome != true )
    leavesToDropCount++;
  else
    musicBoxToAddCount++;
    
}

void keyPressed() {
  
  if( key == DELETE || key == BACKSPACE )
  {
    //background(360); // white
    background(40, 50, 50, 10); // very pale brown
    
    leavesXPosList = new IntList();
    leavesYPosList = new IntList();
    leavesNextMoveFrames = new IntList();
    leavesNextMovePixelCount = new IntList();
    
    musicBoxXPosList = new IntList();
    musicBoxYPosList = new IntList();
    
    dropLeaves = true; // With key 'd'
    addMusicDome = false; // With key 'm'
    dropWater = false; // With key 'w'
    dropBall = false;
    
    maxFrameRate = 30;
    dropleavesAfterFrames = 15;
    dropLeavesPixels = 10;
    dropWaterAfterFrames = 15;
    dropWaterPixels = 6;
  }
  
  if( key == 's' || key == 'S' ) {
    String name = "Screenshot_" + screenSaveNo;
    saveFrame(name + ".png");
    screenSaveNo++;
  }
    
  if( key == 'h' || key == 'H')
  {
    if(hasHorizontalOption == 1 )
      hasHorizontalOption = 0;
    else if(hasHorizontalOption == 0 )
      hasHorizontalOption = 1;
  }
  
  if( key == 'v' || key == 'V') {
    if(hasVerticalOption == 1 )
      hasVerticalOption = 0;
    else if(hasVerticalOption == 0 )
      hasVerticalOption = 1;
   }
    
    switch(key) {
      case '0':
        strokeColor = color(360); // White
        randomColor = false;
      break;
      case '1':
        strokeColor = color(0,10); // black/grey
        randomColor = false;
        break;
      case '2':
        strokeColor = color(328, 78, 78, 10); // Dark pink
        randomColor = false;
        break;
      case '3':
        strokeColor = color(359, 93, 97, 10); // Kind of strong red
        randomColor = false;
        break;
      case '4':
        strokeColor = color(283, 82, 69, 10); // Purple
        randomColor = false;
        break;
      case '5':
        strokeColor = color(251, 98, 95, 10); // Strong blue
        randomColor = false;
        break;
      case '6':
        strokeColor = color(216, 92, 97, 10); // Mildly strong blue
        randomColor = false;
        break;
      case '7':
        strokeColor = color(16, 80, 73, 10); // water green
        randomColor = false;
        break;
      case '8':
        strokeColor = color(138, 80, 73, 10); // deep green
        randomColor = false;
        break; 
      case '9':
        strokeColor = color(51, 81, 91, 10); // Tangy yellow
        randomColor = false;
        break;  
      case 'l':
        dropLeaves = true;
        addMusicDome = false;
        dropWater = false;
        dropBall = false;
        break;
      case 'd':
        dropLeaves = false;
        addMusicDome = false;
        dropWater = true;
        dropBall = false;
        break;
      case 'b':
        dropLeaves = false;
        addMusicDome = false;
        dropWater = false;
        dropBall = true;
        break;
      case 'm':
        dropLeaves = false;
        addMusicDome = true;
        dropWater = false;
        dropBall = false;
        break;
      case 'r':
        randomColor = true;
        break;
       case '+':
         dropleavesAfterFrames++;
       break;
       case '-':
         dropleavesAfterFrames--;
       break;
       case '*':
         dropLeavesPixels++;
       break;
       case '/':
         dropLeavesPixels--;
       break;
    }
}




