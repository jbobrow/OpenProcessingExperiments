


// Tic Tac Toe

// Features: 
//   * AutoPlay (different Computer players) 
//   * human plays against different Computer players 
//   * two humans play against each other 

// Main Tab

// ohne Lernen, aber mit Spiel gegen Computer 

// Titel 
final String SpielTitel = "Button Test"; 
final float numVersion = 0.9;

// Auf dem Screen sind Schaltflächen (Buttons) für die Maus: 
// Für das Spielfeld in der Mitte und für die Befehle Neu, Hilfe, 
// Verlassen am rechten Rand. 
// Diese Buttons werden in einer Liste gespeichert. 
// Anzahl der Buttons (Länge der Liste):
final int btnLength = 13;

// List of Buttons (length of List = btnLength).
RectButton[] rectButtons = new RectButton[ btnLength ];
boolean locked;

// colors Buttons 
final color col1 = #ff0000;
final color col2 = #ffff00;
final color col3 = #000000;

// Font 
PFont font; 

// Flags 
boolean boolHelpModus = false; 
boolean boolShowSpecialMessage = false; 
boolean MoveWasMade=false; 
boolean bStop;  // Pause
// for game over: 
boolean isAllowedToMakeMove = true; 

// SpecialText
String SpecialText = ""; 

// Text for left corner: empty
String DefineShowText = ""; 

// define middle of the screen in X-direction 
int HalfOfWidth ; 

final int Y_Axis = 600; //height

int timeSinceLastMouseMoved=0;
int mouseXOld=0;
int mouseYOld=0;

// ==========================================================

void setup () {
  // Init: 
  size( 600, 600 );
  // Define middle of the screen in X-direction   
  HalfOfWidth=(width / 2); 
  // Create the font on the fly 
  font = createFont("Sans Serif", 80); 
  // Font   
  textFont(font);   
  // Init: 
  // see tab Buttons
  SetupButtons ();
  timeSinceLastMouseMoved = millis();
} // setup

void draw () {
  // Main Management
  background(217);
  if ((mouseX!=mouseXOld) || (mouseY!=mouseYOld)) {
    // mouse moved 
    // store time since last mouse moved 
    timeSinceLastMouseMoved = millis();
  }
  // HeadLine
  HeadLine(SpielTitel);
  // draw Buttons
  checkListOfButtons() ;
  // Help Text 
  ShowText(DefineShowText);
  mouseXOld=mouseX; 
  mouseYOld=mouseY;
} // draw 

// ==========================================================


