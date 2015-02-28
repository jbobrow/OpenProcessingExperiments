




// Book Prototype 23.
// Separate the window in two areas, left side is for text like in a book.
// The right side is your sketchbook you can draw or write in.
// see tab doku for further documentation. 

// variables and constants 
// further global variables and constants in tabs: Buttons, State_hsb, 
// StateInput3D, StateBrowseElements.

// ---------------------------------
// part 1: for the whole program 
//
//
import java.io.*;
//
// Title
String Title;

// Known languages - see tab Languages
final int intLangEnglish = 0;
final int intLangGerman  = 1;
// that's how many Languages:
final int intLangMAX     = 1;

// active language
//int intActivelanguage = intLangEnglish; 
int intActivelanguage = intLangEnglish; 

// Screen 
int screenWidth = 900;
int screenHeight = 650;

// controlling program behaviour on the highest level 
final int programStateSplashScreen = 0;      // start-up
final int programStateNormal = 1;            // normal 
final int programStateGetColor = 2;          // for getting color 
final int programStateShowHelp = 3;          // for F1
final int programStateGet3DInput = 4;        // see tab Input3D
final int programStateBrowseElements = 5;        // see tab StateBrowseElements
int programState = programStateSplashScreen; 

// Timer for SplashScreen
int programStateSplashScreenTimer=0;

// Font
PFont fontHeadline;
PFont fontNormalText;

// Flags 
boolean programIsStarting = true;  // for text in the right panel at startup
boolean disableEscapeKey = false;  // disable ESC

// Timer for disableEscapeKey
int disableEscapeKeyTimer = 0;     // for a few millis

//--------------------------------
// part 2: for the left Segment
// The static pages

// Text in left segment
final int leftIndentText = 30; // left indent

// Pages in Book
int currentPage = 0;    // current page
final int maxPages = 4; // max page 

// Headlines
String [][] pageHeadlines = new String [2] [7] ;  // array 

// Misc
float rotateValue=0.0; // for Box, left segment
PVector helpPoint;     // for Line etc., left segment, Point #1
PVector helpPoint2;             // Point #2
PVector helpPointAdd;           // vector for moving Point #1
PVector helpPoint2Add;          // vector for moving Point #2

//--------------------------------
// part 3: for the right Segment
//

// position and size of right side
int rightSegmentX= screenWidth/2+5;
int rightSegmentY= 5;
int rightSegmentWidth= screenWidth/2-10;
int rightSegmentHeight= screenHeight-10;

// show a message for a few seconds 
String specialTextInRightPanel = "";    // what 
int specialTextInRightPanelTimer = 0;   // timer

// Mouse 
boolean halten = false;

// Zeichnen
// from http://processing.org/learning/topics/arraylistclass.html
// this is for the sketchbook in the right panel 
ArrayList <Line> [] lines = new ArrayList [maxPages+1];

// what is drawn by mouse in the right panel 
final int drawFreeHand=0;  // const 
final int drawLINE=1; 
final int drawRect=2;
final int drawEllipse=3;
final int drawText=4; 
final int drawCircle=5;
final int drawBox=6;
final int drawSphere=7;
int drawElementType=drawFreeHand;  // var 

// this is the startPoint when you draw a rect or ellipse etc. 
PVector startPoint = new PVector(rightSegmentX+10, rightSegmentY+10);

// thickness for your drawing
int lineWidth = 4;

// Text input for your drawing
String input = "";
String lastInput = "";

// box Infos - for drawing 
int boxLengthInZDir=100; // length in x & y is stored in 

// for line when using 3D-Editor
Line lineBackup ; 

// global color 
color globalColor = color (255, 0, 0);      // stroke red
color globalColorFill  = color (0, 255, 0); // fill green

// array of colors for your drawing
color [] myNiceColors1 = { 
  color (255, 0, 0), // red
  color (0, 255, 0), // green
  color (0, 0, 255), // blue 
  color (255, 0, 255), 
  color (255, 255, 255), 
  color (255, 255, 0), 
  color (0, 255, 255), 
  color (0, 0, 0)
};

// name of colors for your drawing
String [][] myNiceColorsNames = 
{
  { 
    "rot", // red
    "grün", // green
    "blau", // blue 
    "Flieder", 
    "weiß", 
    "gelb", 
    "türkis", 
    "schwarz"
  }
  , { 
    "red", 
    "green", 
    "blue", 
    "light blue", 
    "white", 
    "yellow", 
    "turquoise", 
    "black"
  }
}
;

// current color as index of myNiceColors1 -  
// myNiceColors1[colorPointer] gets then 
// stored in globalColor. 
//  - for your drawing
int colorPointer = 2;  

// color picker stuff
final int usingColorPickerForStrokeColor = 0;
final int usingColorPickerForFillColor = 1;
int usingColorPickerFor = usingColorPickerForStrokeColor;  
int currentGroupNumber = 0;

// ==========================================================

void setup () {
  // Init
  size(900, 650, P3D);

  screenWidth=width;
  screenHeight = height;   

  fontNormalText = createFont("Arial", 18); 
  fontHeadline = createFont("Arial", 32); 
  textMode(SCREEN);

  defineLanguages();

  // for the green line in left panel
  initPointsForLine();

  // Init: for loop
  for (int i=0; i<=maxPages; i++) {
    // Create an empty ArrayList - one ArrayList for each page
    lines[i] = new ArrayList();
  }

  // see tab Buttons
  SetupButtons ();

  // Timer - for 1st state 
  programStateSplashScreenTimer = millis();

  lineBackup = new Line(pmouseX, pmouseY, mouseX, mouseY, 
  lineWidth, globalColor, "", drawFreeHand, 0);
} // func 

// ----------------------------------------

void draw () {
  switch (programState) {
  case programStateSplashScreen:
    doSplashScreenState () ;
    break; 
  case programStateNormal:
    doNormalState();
    break; 
  case programStateGetColor:
    doGetColorState ();
    break;
  case programStateShowHelp:
    doHelpState();
    break; 
  case programStateGet3DInput:
    doDraw3DInputTool ();  
    break;
  case programStateBrowseElements:
    doBrowseElements ();
    break; 
  default:
    println ("Error programState (tab MAIN: Book) - Nr.: " + programState);
    break;
  } // switch
} // func 


