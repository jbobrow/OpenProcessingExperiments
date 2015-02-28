
/*

 Proto1: 10th November 2011
 Creating a series of sliders that can feed into variables of a shape
 - the ellispe used is that from test button two: 
 file location: D:\Michael\MArch\MA6\Thesis\Primer\ControlP5 experiments\button_Test_2
 
 Proto_2: 10th November 2011
 Create a dodecahedron mesh using the hemesh libraries at the push of a button
 NB: Created a void GUI so that the control P5 can be shown when using 3d forms.
 
 Proto_2 RevA: 10th November 2011
 using openGL to carry out 3d graphics instead of P3G
 create a 3d geometry at the push of a button with controlP5
 
 Proto_3: 10th November 2011
 replace the box in proto2RevA with a dodecahedron using Hemesh
 
 Proto_3 RevA: 10th November 2011
 1. put the dodecahedron in its own function
 2. changed the fill of the mesh
 3. make the mesh rotate in relation to the x and y.. it maye be a good idea to link this to pushing keys!
 
 Proto_4: 10th November 2011
 1. pass values into the dodecohedran
 2. Apply a modifier with a button
 
 proto_5: 10th November 2011
 1. move the if modifier statement
 
 proto_6: 10th November 2011
 1. remove modifier and try doing a subdivide
 
 proto_7: 10th November 20111 
 still not working - what I took to the tutorial with tom
 
 Proto_8: 12th November 2011
 A working modifier by Tom
 
 Proto_9: 13th November 2011
 1. Create the GUI do that all the modifiers are there
 
 */
////////////////////////////////////////////////////////////////////////////////////

//libraries//////////////////////////////////////////////////////
import processing.opengl.*; //import the opengl libraries
//import controlP5 libraries
import controlP5.*;    
//import Hemesh libraries
import wblut.processing.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.core.*;
import wblut.hemesh.modifiers.*;
import wblut.hemesh.subdividors.*;

//create classes ////////////////////////////////////////////////////
ControlP5 controlP5;  //creating a class called controlP5 - NB I need to relate to this controlP5 in my sliders
HE_Mesh mesh; //Hemesh class called mesh
WB_Render render;//Hemesh render class called render
HEM_Extrude ExModifierOne;
HEC_Dodecahedron creator; //tom added

//Global Variables////////////////////////////////////////////////////////

//declare modifier event variables
float myGlobalModifierVariable;

// general settings
int sceneWidth = 1280;                 // sketch width
int sceneHeight = 720;                 // sketch height
PFont fontA;  //


//declare the floats used in the sliders so that they can be used in the sketch
float ShapeVariable1, ShapeVariable2, ShapeVariable3, ShapeVariable4; //the 

//declare shape event variables
boolean showDodec=false; //for the showDodec toggle



//declare modifier event variables
boolean applyExModifierOne=false;




void setup() {
  size(sceneWidth, sceneHeight, OPENGL); 
  hint(ENABLE_OPENGL_4X_SMOOTH);



  creator=new HEC_Dodecahedron(); 

  //all setting up shape stuff now moved to here (tom)
  setupDoDec();

  render=new WB_Render(this);
  //setup gui
  gui();
}

void draw() { 
  background(40);

  //the modifier is applied once a button is pressed
  if (applyExModifierOne) {
    modifierExtrudeOne();
    applyExModifierOne=false;
  }
  pushMatrix();

  translate (width/2, height/2);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);


  if (showDodec) {
    showDodecahedron();
  }


  // }
  popMatrix();
  // }
}



/////////////////////////////////////
//GUI
////////////////////////////////////////
void setupDoDec() {
  creator.setEdge(ShapeVariable1); // creator relates to the creator class in the above line
  creator.setRadius(50);
  mesh=new HE_Mesh(creator);
}
void gui() {

  controlP5 = new ControlP5(this);
  
  //setting buttons
  controlP5.addButton ("ExportSTL", 1, 20, height-35, 100, 15).setLabel("Export STl"); // export as stl
  controlP5.addButton ("RESET", 1, 20, height-55, 100, 15); // reset

  //circle parameter controler sliders
  controlP5.addSlider("ShapeVariable1", 0, 100,34, width-300, 20, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable2", 0, 100,34, width-300, 40, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable3", 0, 100,34, width-300, 60, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable4", 0, 100,34, width-300, 80, 200, 15).setDecimalPrecision(0);

  //shape buttons
  controlP5.addButton("ShowShape", 1, width-300, 120, 200, 15).setLabel("Dodecahedron");
  controlP5.addButton("ShapeTwo", 1, width-300, 140, 200, 15).setLabel("Doghnut");//

  // modifier buttons and sliders
  fontA = loadFont ("BrowalliaUPC-10.vlw");
  textFont(fontA, 10);
  fill(255);
  text("Personalities", 20, 10);

  controlP5.addButton ("modifierOne", 1, 20, 20, 100, 15).setLabel("Confrontational"); // extrude 
  controlP5.addSlider ("modifierOneSlider", 0, 100, 34, 125, 20, 200, 15).setLabel("");

  controlP5.addButton ("modifierTwo", 1, 20, 40, 100, 15).setLabel("Nagging"); //noise
  controlP5.addSlider ("modifierTwoSlider", 0, 100, 34, 125, 40, 200, 15).setLabel("");

  controlP5.addButton ("modifierThree", 1, 20, 60, 100, 15).setLabel("Dividing"); //planer subdivide
  controlP5.addSlider ("modifierThreeSlider", 0, 100, 34, 125, 60, 200, 15).setLabel("");

  controlP5.addButton ("modifierFour", 1, 20, 80, 100, 15).setLabel("Teasing"); //twist
  controlP5.addSlider ("modifierFourSlider", 0, 100, 34, 125, 80, 200, 15).setLabel("");

  controlP5.addButton ("modifierFive", 1, 20, 100, 100, 15).setLabel("Secrative"); //skew 
  controlP5.addSlider ("modifierFiveSlider", 0, 100, 34, 125, 100, 200, 15).setLabel("");

  controlP5.addButton ("modifierSix", 1, 20, 120, 100, 15).setLabel("Friendly"); //cullendark smoothing
  controlP5.addSlider ("modifierSixSlider", 0, 100, 34, 125, 120, 200, 15).setLabel("");
  
  
}

//end of GUI
/////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
//Shapes
///////////////////////////////////////////////////////////

void showDodecahedron() {

  // rendering the mesh and edges on the screen 
  stroke(0);
  render.drawEdges(mesh);
  noStroke();
  fill(48, 58, 234);
  render.drawFaces(mesh);
}

//////////////////////////////////////////////////////////


//end of Shapes
/////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//Modifiers
////////////////////////////////////////////////////////////

void modifierExtrudeOne() {
  ExModifierOne=new HEM_Extrude();

  ExModifierOne.setDistance(myGlobalModifierVariable);// extrusion distance, set to 0 for inset faces - (I could contrle this and add a mathematical equation to it MS)
  ExModifierOne.setRelative(false);// treat chamfer as relative to face size or as absolute value
  ExModifierOne.setChamfer(4);// chamfer for non-hard edges
  ExModifierOne.setHardEdgeChamfer(100);// chamfer for hard edges
  ExModifierOne.setThresholdAngle(1.5*HALF_PI);// treat edges sharper than this angle as hard edges
  ExModifierOne.setFuse(true);// try to fuse planar adjacent planar faces created by the extrude
  ExModifierOne.setFuseAngle(0.05*HALF_PI);// threshold angle to be considered coplanar
  ExModifierOne.setPeak(true);//if absolute chamfer is too large for face, create a peak on the face
  mesh.modify(ExModifierOne);
}


//end of Modifiers
/////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////
//Control Event listener function 
/////////////////////////////////////////////////////////

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isController()) { 

    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());

    if (theEvent.controller().name()=="ShowShape") {
      showDodec=!showDodec; //toggle
    }

    if (theEvent.controller().name()=="modifierOne") {
      applyExModifierOne=!applyExModifierOne; //toggle
    }
    if (theEvent.controller().name()=="ShapeVariable1") {
      myGlobalModifierVariable=theEvent.controller().value();
    }
  }
}


