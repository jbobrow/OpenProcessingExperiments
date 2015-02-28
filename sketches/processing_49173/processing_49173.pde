



// Book Prototype

// new version with backspace for delete (the last small line segment)

// separate the window in two areas, left is for text 

// Title
final String Title="Skizzenbuch";

// Screen 
int screenWidth = 900;
int screenHeight = 650;

// right Segment
int rightSegmentX= screenWidth/2+5;
int rightSegmentY= 5;
int rightSegmentWidth=screenWidth/2-10;
int rightSegmentHeight=screenHeight-10;

// Font
PFont fontHeadline;
PFont fontNormalText;

// Text in left segment
final int leftIndentText = 30; 

// Pages in Book
int currentPage = 0;    // current page
final int maxPages = 4; // max page 

// Headlines
String [] pageHeadlines = {
  "Inhalt", "Linien", "Boxen", "Kugeln", "Ellipsen"
};

// Misc
float rotateValue=0.0; // for Box
PVector helpPoint; // for Line
PVector helpPoint2;
PVector helpPointAdd;
PVector helpPoint2Add;

// Flags 
boolean boolHelpModus = false; 

// Maus 
boolean halten = false;

// Zeichnen
// from http://processing.org/learning/topics/arraylistclass.html
ArrayList lines;
int lineWidth = 4;
// array of colors
color [] myNiceColors = { 
  color (255, 0, 0), 
  color (0, 255, 0), 
  color (0, 0, 255), 
  color (255, 0, 255), 
  color (255, 255, 255)
};
int colorPointer = 2; // current color 

// ==========================================================

void setup () {
  size(900, 650, P3D);
  // screenWidth = width;
  // screenHeight = height;

  fontNormalText = createFont("Arial", 18); 
  fontHeadline = createFont("Arial", 32); 
  textMode(SCREEN);

  // for line 
  initPointsForLine();

  // Init: 
  // Create an empty ArrayList
  lines = new ArrayList();
  // see tab Buttons
  SetupButtons ();
}

void draw () {
  // delete all
  background (200);

  // rotate
  rotateValue += 1.0; 
  if (rotateValue>=360) {
    rotateValue=0;
  }

  // Help for line on page 1 
  //if (currentPage==1) {
  checkHelpPointsForLine();
  //}

  // general layout
  strokeWeight(1);
  textFont(fontHeadline, 32); 
  showGeneralLayout();

  // current Page
  textFont(fontNormalText, 18); 
  textAlign(LEFT);
  // page number
  text (currentPage, screenWidth/4-12, screenHeight-40);  
  showCurrentPage();

  if ((mouseX!=mouseXOld) || (mouseY!=mouseYOld)) {
    // mouse moved 
    // store time since last mouse moved 
    timeSinceLastMouseMoved = millis();
  }

  // free hand drawing
  zeichnen() ;

  // monitor mouse
  mouseXOld=mouseX; 
  mouseYOld=mouseY;

  // draw Buttons
  checkListOfButtons() ;

  drawLines () ;
} // func 

// =================================================

void showGeneralLayout() {
  // show frame left and right
  stroke(0);  
  fill(0, 0, 0);
  // parameter: x,y, width, height 
  rect (5, 5, screenWidth/2-10, screenHeight-10); // left 
  rect (rightSegmentX, rightSegmentY, rightSegmentWidth, rightSegmentHeight); // right 

    // Headline
  fill(255, 2, 2);
  // textSize(32);
  textAlign(CENTER);
  text (pageHeadlines[currentPage], screenWidth/4, 129);
} // func

void showCurrentPage() {
  switch(currentPage) {
  case 0:
    showPage0();
    break;
  case 1:
    showPage1();
    break;
  case 2:
    showPage2();
    break;
  case 3:
    showPage3();
    break;
  case 4:
    showPage4();
    break;  
  default:
    println("This should not be reached. Go to showCurrentPage and add more case-elements... +++++++++++++++++++++++++++++++++++");
    break;
  } // switch
} // func 

void showPage0() {
  // Page 0
  // left panel
  text ("Linien.........1 ", 111, 222);
  text ("Boxen.........2 ", 111, 262);  
  text ("Kugel..........3 ", 111, 302);
  text ("Ellipse........4 ", 111, 342);
}

void showPage1() {
  // Page 1
  // left panel
  text ("This explains a little about lines", leftIndentText, 222);
  stroke(0, 255, 0);
  /*  line (220, 275, 
   370, 360 );  */
  line (helpPoint.x, helpPoint.y, 
  helpPoint2.x, helpPoint2.y );
}

void showPage2() {
  // Page 2
  // left panel
  text ("This explains a little about boxes", leftIndentText, 222);
  drawBox();
}

void showPage3() {
  // Page 3
  // left panel
  text ("This explains a little about Spheres", leftIndentText, 222);
  drawBall();
}

void showPage4() {
  // Page 4
  // left panel
  text ("This explains a little about ellipses", leftIndentText, 222);
  stroke(22, 222, 22);
  ellipse ( 160, 375, helpPoint.x, 55);
}

// =========================================================

void drawBall() {
  lights();
  stroke(0, 23, 23);
  fill(255, 23, 23);
  pushMatrix();
  translate ( helpPoint.x, helpPoint.y, 0 );
  noStroke();
  sphere( 44 );
  popMatrix();
} // func 

void drawBox() {
  lights();
  pushMatrix();
  translate ( 260, 375, +100 );
  rotateY(radians(rotateValue));
  rotateX(radians(31));
  // red
  fill(230, 11, 11);
  stroke(0);
  box ( 60 );
  popMatrix();
}


