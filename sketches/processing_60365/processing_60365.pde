




// you can draw mutiple shapes 

// program works with states and ArrayLists


// question / idea from
// https://forum.processing.org/topic/creating-shapes-on-grid

// Code from
// http://processing.org/learning/topics/arraylistclass.html etc.

// further ideas: duplicate 1st shape into 2nd shape

// Program allows to draw a shape with the mouse (dragging).
// It shows the current input with the mouse -
// stop current line / vertex with Escape.
// Undo with backspace (you can undo all steps).
// Quit with q.
//
// r - println AS CODE.

// States of the program
final int stateNormal = 0; 
final int stateHelp   = 1; 
// current state 
int state = stateNormal;
//
// these are the shapes
ArrayList <ShapeClass> shapes; 
// number
int currentShapeNo = 0;
// current shape
ShapeClass currentShape;

// when Mouse clicked, this is your starting point
PVector startingPoint;
// when mouse is clicked and hold / dragged, this is true
boolean MouseHold = false;

void setup() {
  // init
  size(600, 600);

  // Create an empty ArrayList
  shapes = new ArrayList();

  // insert 1st shape in it
  shapes.add(new ShapeClass());

  // Vector
  startingPoint = new PVector(0, 0);
} // func
//
//
void draw() {
  // runs again and again
  switch (state) {
  case stateNormal:
    normalStateDraw();
    break;
  case stateHelp:
    helpStateDraw();
    break;
  default:
    println ("Unknown state in 63 ++++++++++++++++++++++++");
    exit();
    break;
  } // switch
} // func

void normalStateDraw() {
  background(0);
  stroke(122);
  strokeWeight(0);
  // -------------- 
  // Grid
  for (int i = 0; i < width; i+=30) {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=30) {
    line (0, i, width, i);
  }
  // -------------- 
  // Information in the upper screen
  fill(0);    // black rectangle = background for information
  noStroke();
  rect(0, 0, width, 50);
  fill(255);  // Text
  text ("F1 Help; drag-shape; q-quit; esc-stop vertex; Backspace-undo; d-del; r-CODE", 10, 30);
  text ("Mouse: " + mouseX + ", " + mouseY, width-100, 30);
  // -------------- 
  showOldShapes ();
  stroke(255);
  currentShape = shapes.get(currentShapeNo);
  // Shape begin
  beginShape();
  // With an array, we say vertices.length, with an ArrayList, we say vertices.size().
  // The length of an ArrayList is dynamic.
  // Notice how we are looping through the ArrayList backwards.
  for (int i = currentShape.vertices.size()-1; i >= 0; i--) {
    // get object
    VertexClass myVertex = currentShape.vertices.get(i);
    vertex(myVertex.x, myVertex.y);
    myVertex.display();
  } 
  // When user is currently drawing, show the current mouse pos
  // as if already part of the shape
  if (MouseHold) {
    vertex( mouseX, mouseY);
  }
  fill(0, 0, 255); 
  endShape(); // shape end
  //
  // -------------- 
  // When user is currently drawing
  if (MouseHold) {
    // show line of current mouse Input
    stroke(255, 0, 0);
    line(startingPoint.x, startingPoint.y, mouseX, mouseY);
  } // if
  // show text fields on top of shape 
  for (int i = currentShape.vertices.size()-1; i >= 0; i--) {
    // get object
    VertexClass myVertex = currentShape.vertices.get(i);
    fill(0);
    noStroke();
    rect( myVertex.x-4, myVertex.y-14, 110, 20);
    fill(255); 
    stroke(0, 255, 0);
    text ( myVertex.getCoor(), myVertex.x+6, myVertex.y);
  } // for
  // When user is currently drawing
  if (MouseHold) {
    // show Mouse pos on top 
    stroke(0, 255, 0);
    fill(0);
    rect( mouseX-4, mouseY-14, 110, 20);
    fill(255); 
    text ( mouseX + ", " + mouseY, mouseX+6, mouseY );
  }
}

void helpStateDraw() {

  final int topBorder = 20; 
  int lineNumber=0;

  background(0);
  fill(255);
  text("Help for Shape Drawer", 10, lineNumber*20+topBorder );
  lineNumber++;
  text(" ", 10, lineNumber*20+topBorder );
  lineNumber++;     

  text("You can draw mutiple shapes one after another. ", 10, lineNumber*20+topBorder );
  lineNumber++;     
  text("You can drag (or click) the mouse to enter next corner / vertex of the shape. ", 10, lineNumber*20+topBorder );
  lineNumber++;     
  text("When you drag the mouse, you can see what the shape will look like and position the corner precisely. ", 10, lineNumber*20+topBorder );
  lineNumber++;     
  text("With Return you end the shape and move on to the next. ", 10, lineNumber*20+topBorder );
  lineNumber++;     
  text("To support programmers, you can export the shape(s) as Code in the direct window via println", 10, lineNumber*20+topBorder );
  lineNumber++;     
  text("(works only offline and not in the browser).", 10, lineNumber*20+topBorder );
  lineNumber++;       

  text("Press r to do so. ", 10, lineNumber*20+topBorder );
  lineNumber++;       

  text(" ", 10, lineNumber*20+topBorder );
  lineNumber++;       
  text("q-quit; esc-drop current line; Backspace-undo; d-del; r-CODE ", 10, lineNumber*20+topBorder );
  lineNumber++;
} // func

// ----------------------------------------------------------------------

void showOldShapes () {
  // show old shapes as outline
  //noFill();
  fill(2, 2, 230, 60);
  stroke(255);
  // loop over shapes
  for (int i_shape = shapes.size()-1; i_shape >= 0; i_shape--) {
    ShapeClass  currentShape = shapes.get(i_shape);
    // Shape begin
    beginShape();
    // loop over its vertices
    for (int i = currentShape.vertices.size()-1; i >= 0; i--) {
      // get object
      VertexClass myVertex = currentShape.vertices.get(i);
      vertex(myVertex.x, myVertex.y);
      myVertex.display();
    } // for 
    endShape();
  } // for
} // func 

// ----------------------------------------------------------------------

void mousePressed() {
  if (state==stateNormal) {
    startingPoint.set( mouseX, mouseY, 0 );
    MouseHold=true;
    // when empty
    if (currentShape.vertices.isEmpty()) {
      // A new vertex object is added to the ArrayList (by default to the end)
      currentShape.vertices.add(new VertexClass(mouseX, mouseY));
    } // if
  } // if
} // func

void mouseDragged() {
  if (state==stateNormal) {
    MouseHold=true;
  } // if
} // func

void mouseReleased() {
  switch (state) {
  case stateNormal:
    // normal state 
    if (MouseHold) {
      // A new vertex object is added to the ArrayList (by default to the end)
      currentShape.vertices.add(new VertexClass(mouseX, mouseY));
      MouseHold=false;
    } // if
    break;
  case stateHelp:
    // return from help screen to the normal state 
    state=stateNormal;
    break;
  default:
    println ("Unknown state in 239 ++++++++++++++++++++++++");
    exit();
    break;
  } // switch
} // func

// -----------------------------------------------------------------------------------

void keyPressed() {
  switch (state) {
  case stateNormal:
    normalStateKeyPressed();
    break;
  case stateHelp:
    helpStateKeyPressed();
    break;
  default:
    println ("Unknown state in 213 ++++++++++++++++++++++++");
    exit();
    break;
  } // switch
} // func

void normalStateKeyPressed() {
  if (key == CODED) {
    // CODED
    switch (keyCode) {
    case KeyEvent.VK_F1:
      state=stateHelp;
      break;
    } // switch
  } // if 
  else
  {
    // not CODED
    switch (key) {
    case ENTER:
    case RETURN: 
      // close current shape and get new one. 
      VertexClass firstVertex = currentShape.vertices.get(0);
      currentShape.vertices.add(new VertexClass(firstVertex.x, firstVertex.y));
      // increase counter
      currentShapeNo++;
      // insert new shape
      shapes.add(new ShapeClass());
      break;
    case BACKSPACE:
      // remove last vertex / undo
      if (!currentShape.vertices.isEmpty()) {
        currentShape.vertices.remove(currentShape.vertices.size()-1);
      }
      break;
    case ESC:
      if (MouseHold) {
        key = 0;  // kill Esc
        MouseHold=false;
      }
      else
      {
        key = 0 ; // kill Esc
      }
      break;
    case 'd':
      currentShape.vertices.clear();
      break;
    case 'r':   
      // result II
      printTheArrayListAsCode ();
      break;  
    case 'q':
      // quit
      // result II
      printTheArrayListAsCode ();
      // quit
      exit();
      break;
    default:
      break;
    } // switch
  } // if
} // func

void helpStateKeyPressed() {
  state = stateNormal;
  key = 0 ; // kill Esc
}

// -----------------------------------------------------------------------------------

void printTheArrayListAsCode() {
  // 2D 
  // Intro 
  print("size (700, 700);\n");
  print("fill(244, 3, 3);\n");
  print("float shape_offsetX = 0.0;\n");
  print("float shape_offsetY = 0.0;\n");

  // loop over shapes
  for (ShapeClass currentShape : shapes) {

    if (currentShape!=null) {
      if (!currentShape.vertices.isEmpty()) {      
        print(" \n");
        print("// shape '" +currentShape.shapeName+"'\n" );
        // Shape begin
        print("beginShape();\n");    
        // loop over its vertices
        for (VertexClass myVertex : currentShape.vertices) {
          if (myVertex!=null) {        
            print("  vertex( "
              + myVertex.getCoorWithStrings(" + shape_offsetX", " + shape_offsetY")
              + " );\n" );
          } // if
        } // for 
        endShape();
        // close it
        print("endShape(); // " + currentShape.shapeName+"\n");
      } // if
    } // if
  } // for
} // func 

// -----------------------------------------------------------------------------------
// Simple shape class

class ShapeClass {

  // its name 
  String shapeName = "";
  // these are the vertices of the shape
  ArrayList <VertexClass> vertices;
  // id 
  int id;

  // constructor
  ShapeClass () {
    // Create an empty ArrayList
    vertices = new ArrayList();
    // create name 
    shapeName = "shapeName"+currentShapeNo;
    // give id 
    id = currentShapeNo;
  }  // constructor
} // class

// -----------------------------------------------------------------------------------
// Simple vertex class

class VertexClass {

  float x;
  float y;

  // constructor
  VertexClass(float tempX, float tempY ) {
    x = tempX;
    y = tempY;
  } // constructor

  //
  String getCoor() {
    // returns a string 
    return ( x + ", " + y );
  } // method 

  String getCoorWithStrings (String a, String b) {
    // returns a string 
    return ( x + a + ", "
      + y + b );
  } // method   

  //
  void display() {
    // Display as circle
    ellipse(x, y, 7, 7);
  } // method
} // class
//


