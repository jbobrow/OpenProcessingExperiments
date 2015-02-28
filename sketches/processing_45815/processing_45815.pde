
// Notes about the sketch and in the tab: "Notes"
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
import wblut.geom.*;
import wblut.hemesh.tools.*; //for stl

//create classes ////////////////////////////////////////////////////
ControlP5 controlP5;  //creating a class called controlP5 - NB I need to relate to this controlP5 in my sliders
HE_Mesh mesh; //Hemesh class called mesh
WB_Render render;//Hemesh render class called render
HEM_Extrude ExModifierOne;
HEC_Dodecahedron creator; //tom added
WB_Line TwL;
HEM_Twist TwModifier;
WB_Plane ScrewP;
WB_Vector ScrewV;
HEM_Skew ScrewModifier;


//Global Variables////////////////////////////////////////////////////////

// general settings
int sceneWidth = 1280;                 // sketch width
int sceneHeight = 720;                 // sketch height
PFont fontA;  //
String timestamp;

//declare modifier event variables

float modifierOneSlider;  
float modifierTwoSlider; 
float modifierThreeSlider; 
float modifierFourSlider; 
float modifierFiveSlider; 
float modifierSixSlider; 

//declare shape creator variables
float ShapeVariable1, ShapeVariable2, ShapeVariable3, ShapeVariable4; 

//declare shape event variables
boolean showDodec=false; //for the showDodec toggle

//declare modifier event variables
boolean applyExModifierOne = false;
boolean applyModifierNoise = false;
boolean applyModifierPlanarSudivide = false;
boolean applyTwModifier = false;
boolean applyScrewModifier = false;
boolean applyCatmullCModifier = false;



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

  if (applyModifierNoise) {
    modifierNoise ();
    applyModifierNoise = false;
  }

  if (applyModifierPlanarSudivide) {
    modifierPlanarSudivide();
    applyModifierPlanarSudivide = false;
  }

  if (applyTwModifier) {
    modifierTwist();
    applyTwModifier = false;
  }

  if (applyScrewModifier) {
    modifierScrew();
    applyScrewModifier = false;
  }
  
  if (applyCatmullCModifier){
    CatmullClarkSubdivide();
    applyCatmullCModifier = false;
  }


  pushMatrix();

  translate (width/2, height/2);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);


  if (showDodec) {
    showDodecahedron();
  }

  popMatrix();
}



/////////////////////////////////////
//GUI
////////////////////////////////////////

void gui() {

  controlP5 = new ControlP5(this);

  //setting buttons
  controlP5.addButton ("ExportSTL", 1, 20, height-35, 100, 15).setLabel("Export STl"); // export as stl
  controlP5.addButton ("RESET", 1, 20, height-55, 100, 15); // reset

  //circle parameter controler sliders
  controlP5.addSlider("ShapeVariable1", 0, 100, 34, width-300, 20, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable2", 0, 100, 34, width-300, 40, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable3", 0, 100, 34, width-300, 60, 200, 15).setDecimalPrecision(0);
  controlP5.addSlider("ShapeVariable4", 0, 100, 34, width-300, 80, 200, 15).setDecimalPrecision(0);

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
  controlP5.addSlider ("modifierThreeSlider", 1, 3, 2, 125, 60, 200, 15).setLabel("");

  controlP5.addButton ("modifierFour", 1, 20, 80, 100, 15).setLabel("Teasing"); //twist
  controlP5.addSlider ("modifierFourSlider", 0, 1, 0.40, 125, 80, 200, 15).setLabel("");

  controlP5.addButton ("modifierFive", 1, 20, 100, 100, 15).setLabel("Secrative"); //skew 
  controlP5.addSlider ("modifierFiveSlider", 0, 100, 34, 125, 100, 200, 15).setLabel("");

  controlP5.addButton ("modifierSix", 1, 20, 120, 100, 15).setLabel("Friendly"); //cullendark smoothing
  controlP5.addSlider ("modifierSixSlider", 0, 5, 1.4, 125, 120, 200, 15).setLabel("");
}

//end of GUI
/////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
//Shapes
///////////////////////////////////////////////////////////

void setupDoDec() {
  creator.setEdge(ShapeVariable1); // creator relates to the creator class in the above line
  creator.setRadius(50);
  mesh=new HE_Mesh(creator);
}

void showDodecahedron() {

  // rendering the mesh and edges on the screen 
  stroke(0);
  render.drawEdges(mesh);
  noStroke();
  fill(48, 58, 234);
  render.drawFaces(mesh);
}

//end of Shapes
/////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//Modifiers
////////////////////////////////////////////////////////////

void modifierExtrudeOne() {
  ExModifierOne=new HEM_Extrude();

  ExModifierOne.setDistance(modifierOneSlider);// extrusion distance, set to 0 for inset faces - (I could contrle this and add a mathematical equation to it MS)
  ExModifierOne.setRelative(false);// treat chamfer as relative to face size or as absolute value
  ExModifierOne.setChamfer(4);// chamfer for non-hard edges
  ExModifierOne.setHardEdgeChamfer(100);// chamfer for hard edges
  ExModifierOne.setThresholdAngle(1.5*HALF_PI);// treat edges sharper than this angle as hard edges
  ExModifierOne.setFuse(true);// try to fuse planar adjacent planar faces created by the extrude
  ExModifierOne.setFuseAngle(0.05*HALF_PI);// threshold angle to be considered coplanar
  ExModifierOne.setPeak(true);//if absolute chamfer is too large for face, create a peak on the face
  mesh.modify(ExModifierOne);
}

void modifierNoise() {
  // subdividor
  HES_PlanarMidEdge subdividorNoise=new HES_PlanarMidEdge();
  mesh.subdivide(subdividorNoise, 2);

  //noise modifier
  HEM_Noise NoiseModifier=new HEM_Noise();
  NoiseModifier.setDistance(modifierTwoSlider);
  mesh.modify(NoiseModifier);
}

void modifierPlanarSudivide() {

  HES_Planar subdividorPlanar=new HES_Planar();

  subdividorPlanar.setRandom(true);// Randomize center edge and center face points 
  subdividorPlanar.setRange(0.5);// Random range of center offset, from 0 (no random) to 1(fully random)
  subdividorPlanar.setSeed(1234L);// Seed of random point generator
  subdividorPlanar.setKeepTriangles(true);// Subdivide triangles into 4 triangles instead of 3 quads
  mesh.subdivide(subdividorPlanar, 2);
}

void modifierTwist() {
  HEM_Twist TwistModifier=new HEM_Twist();

  TwL=new WB_Line(width/2, 0, 0, width/2, 0, 1);

  TwistModifier.setTwistAxis(TwL);// Twist axis
  TwistModifier.setAngleFactor(modifierFourSlider);// Angle per unit distance (in degrees) to the twist axis

  mesh.modify(TwistModifier);
}

void modifierScrew() {

  ScrewModifier=new HEM_Skew();

  ScrewP=new WB_Plane(0, 0, -200, 0, 0, 1); 
  ScrewModifier.setGroundPlane(ScrewP);// Ground plane of skew modifier 
  //you can also pass directly as origin and normal:  modifier.setGroundPlane(0,0,-200,0,0,1)

  ScrewV=new WB_Vector(0, 1, 0);
  ScrewModifier.setSkewDirection(ScrewV);// Direction of skew shift
  //you can also pass the vector directly:  modifier.setSkewDirection(1,0,0)

  ScrewModifier.setSkewFactor(modifierFiveSlider);// Skew distance per unit distance to the ground plane
  // points which are a distance d from the ground plane are move over a distance
  // d*skewFactor in the skew direction

  ScrewModifier.setPosOnly(false);// apply modifier only on positive side of the ground plane?

  mesh.modify(ScrewModifier);
}

void CatmullClarkSubdivide (){
  HES_CatmullClark subdividorCatmullC=new HES_CatmullClark();
  subdividorCatmullC.setKeepBoundary(true);// preserve position of vertices on a surface boundary
  subdividorCatmullC.setKeepEdges(true);// preserve position of vertices on edge of selection (only useful if using subdivideSelected)

  mesh.subdivide(subdividorCatmullC, 2);
  
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


//Modifiers//////////////////////////////////////////////////////

    if (theEvent.controller().name()=="modifierOne") {
      applyExModifierOne=!applyExModifierOne; //toggle
    }

    if (theEvent.controller().name()=="modifierTwo") {
      applyModifierNoise=!applyModifierNoise; //toggle
    }
    if (theEvent.controller().name()=="modifierThree") {
      applyModifierPlanarSudivide=!applyModifierPlanarSudivide; //toggle
    }

    if (theEvent.controller().name()=="modifierFour") {
      applyTwModifier=!applyTwModifier; //toggle
    }

    if (theEvent.controller().name()=="modifierFive") {
      applyScrewModifier=!applyScrewModifier; //toggle
    }
    
    if (theEvent.controller().name()=="modifierSix") {
      applyCatmullCModifier=!applyCatmullCModifier; //toggle
    }
    
    
    //stl export/////////////////////////////////////////////////////
    
    if (theEvent.controller().name()=="ExportSTL") {
    timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
    String path = sketchPath + "/output/stl/" + timestamp + ".stl";
    HET_Export exporter = new HET_Export();
    exporter.saveToSTL(mesh, path, 1);
    println("STL exported");
    }
    
  }
  }


