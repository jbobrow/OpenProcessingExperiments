




// function-Plotter 3D: 
//-------------------------------- 
// use n,p and F1
// use o, i for export to POV-Ray
// h,r camera 
// s - save as image
// 

// version 2 

final String PathToPOVRayExe = "C:\\Programme\\POV-Ray for Windows v3.62\\bin\\pvengine-sse2.exe"; 

// imports ---------------------------

//import eu.fluidforms.utils.*;
//import eu.fluidforms.processing.*;
//import eu.fluidforms.geom.*;
//import eu.fluidforms.primitives.*;
//import eu.fluidforms.io.*;
//import eu.fluidforms.parser.*;
//
//
//
//// use strg-e



// use camera from peasyCam 
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

// use opengl
import processing.opengl.*;

// consts --------------------------

final int MaxFunctions = 10;

// vars -----------------------------

// cam
PeasyCam cam;

// Vectors: 
// Lookup
PVector[][] MyResults = new PVector [400][400]; 

// Max value for MyResults
int MaxindexI=0;
int MaxindexJ=0;

// number of Formula
int GraphNumber = 0; 

// z = result
float result = 1.0;

// Text for left corner
String DefineShowText=""; 

// when has special text been shown
int ShowSpecialMessageStartTime = 0; 
String SpecialText = ""; 

// some boolean Flags
boolean boolShowCoor = false; // -x,-y,-z, x,y,z
boolean boolShowMovie = false; 
boolean boolHelpModus = false; 
boolean boolShowSpecialMessage = false; 

// Main functions ---------------------------- 


void setup() {

  // Init

  // size ( 900, 650, OPENGL ); 
  size ( 850, 650, P3D ); 
  cam = new PeasyCam(this, 100);
  background(117);

  // move
  cam.pan(100,50);
  cam.setDistance(830);
  cam.setResetOnDoubleClick (true);   

  noStroke();
  fill(color(254,0,0));
  fill (254,0,0);

  PFont font;
  font = createFont("FFScala-32.vlw",12); 
  textFont(font); 

  // FluidForms.setup(this);

} // setup 

void draw() {

  background(117);
  if (boolShowCoor) {
    ShowCoor(); 
  }
  if (boolShowMovie){
    cam.rotateY(radians(-1));
  }
  if (boolShowSpecialMessage){
    float mNow = millis();
    if  (ShowSpecialMessageStartTime + 5000 <= mNow) { 
      boolShowSpecialMessage=false;  
    }
  }  

  CallUpMathFunction () ; 

} // function 

void keyPressed(){

  if (boolHelpModus) {
    loop();
    boolHelpModus=false; 
  }

  else 
  {

    if (key == CODED) {

      switch (keyCode) { 
      case KeyEvent.VK_F1: 
        // F1 
        background(117); 
        ShowText(HelpText() +  "\nPress any key...");
        boolHelpModus=true ; 
        noLoop(); 
        break; 
      case UP:
        cam.rotateX(radians(-1));
        break; 
      case DOWN:
        cam.rotateX(radians(1));
        break;       
      case LEFT:
        cam.rotateY(radians(1));
        break; 
      case RIGHT:
        cam.rotateY(radians(-1));
        break;       
      default: 
        // 
        break; 
      } // switch
    } // if 

    else {

      // not key == CODED   
      switch(key){
      case 'r':
        cam.reset(); 
        break;
      case 'h':
        // horizontal
        setCamHorizontal();
        break;       
      case 'q':
        boolShowCoor = ! boolShowCoor; 
        break; 
      case 'c':
        background (117);
        break;
      case 'm':
        boolShowMovie = ! boolShowMovie; 
        break; 
      case 'p':
        // cam.reset(444);
        GraphNumber = GraphNumber - 1;    
        if (GraphNumber<0) { 
          GraphNumber = 0; 
        }
        break; 
      case 'n':
        // cam.reset(444);
        GraphNumber = GraphNumber + 1;
        if (GraphNumber>MaxFunctions) { 
          GraphNumber = MaxFunctions; 
        }    
        break; 
      case 's':        
        // Opens file chooser	
        String savePath = selectOutput("Save as picture...");  
        if (savePath != null) 
        {	
          delay(10);
          saveFrame(savePath);
        } 
        break; 
      case 'i':
        ShowLookupWithPovRaySpheres(); 
        break;   
      case 'o':
        ShowLookupWithPovRayPoly(); 
        break;           
      default:
        break; 
      } // switch 
    } // if 
  } // if 

  // for functions that rely on Lookup: init Lookup
  switch (GraphNumber) {
    // only when number is odd (and >=5)
  case 5:
    DefineShowText="Formula " + GraphNumber + ": \nz=x*x*y \nuse Previous and Next, F1 Help\ncan export to POV-Ray";
    InitGraph_ItimesItimesJ();
    break; 
  case 7:
    DefineShowText="Formula " + GraphNumber + ": \nSphere (distorted, looks good in OPENGL) \nuse Previous and Next, F1 Help\ncan export to POV-Ray";  
    InitGraph_Sphere(); 
    break; 
  case 9:
    DefineShowText="Formula " + GraphNumber + ": \nCrescent \nuse Previous and Next, F1 Help\ncan export to POV-Ray";
    InitGraph_Cresent(); 
    break; 
  case 6:
  case 8:
  case 10:
    break; 
  default: 
    MaxindexI=0;
    MaxindexJ=0;        
    break; 
  }  // switch 

} // keyPressed 

// functions related to draw etc. -------------------------------------------

void CallUpMathFunction () {

  switch(GraphNumber) {
  case 0:
    ShowText("Formula " + GraphNumber + ": \nz=1 \nuse Previous and Next, F1 Help");
    ShowGraph0();
    break; 
  case 1:
    ShowText("Formula " + GraphNumber + ": \nz=sin(x) \nuse Previous and Next, F1 Help");
    ShowGraph1();
    break;     
  case 2:
    ShowText("Formula " + GraphNumber + ": \ny=cos(x); z=sin(x) \nuse Previous and Next, F1 Help");    
    ShowGraph2();
    break;         
  case 3:
    ShowText("Formula " + GraphNumber + ": \nx=r*cos(i)*cos(j); y=r*sin(i)*sin(j); z=r*sin(i) \nuse Previous and Next, F1 Help");        
    ShowGraph3();
    break;  
  case 4:
    ShowText("Formula " + GraphNumber + ": \nz=sin(x) \nuse Previous and Next, F1 Help");
    ShowGraph4();
    break;      
  case 5:  // odd numbers 
  case 7:   
  case 9:   
    ShowText(DefineShowText);
    ShowLookupAsBoxes();  
    break; 
  case 6:    // even numbers 
  case 8: 
  case 10: 
    ShowText(DefineShowText);
    ShowLookupAsGrid();
    break; 
  default:
    // ShowGraph1();
    break; 
  } // switch 

}

// --------------------------------------------------------------------------
// direct functions without lookUp - evil...

void ShowGraph0() {

  for (int i = -80; i < 80; i = i+5) {
    int posX = i*4; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result = 1.0; 
      BoxParameters ( posX,(100-result)-100 ,-posY-20,
      3,3,3, 
      0,0,0, color(200,result,0) ); 
    }
  }
}

void ShowGraph1() {

  for (int i = 0; i < 360; i = i+5) {
    int posX = i; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result = 100* sin(radians(posX)); 
      BoxParameters ( posX,(100-result)-100 ,-posY-20,
      3,3,3, 
      0,0,0, color(200,result,0) ); 
    }
  }
}

void ShowGraph2() {

  for (int i = 0; i < 360; i = i+5) {
    int posX = i; 
    for (int j = -80; j < 80; j = j+5) {
      float posY = 100* cos(radians(posX));
      result = 100* sin(radians(posX)); 
      BoxParameters ( posX,(100-result)-100 ,-posY-20,
      3,3,3, 
      0,0,0, color(200,result,0) ); 
    }
  }
}

void ShowGraph3() {

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/sphere/

  float r1 = 100 ; 

  for (int i = 0; i < 360; i = i+10) {

    for (int j = -180; j < 180; j = j+10) {

      float x1 = 10 + r1* cos(i) *cos(j);
      float y1 = 10 + r1* sin(i) *sin(j);
      float z1 = 10 + r1* sin(i) ;
      BoxParameters ( x1,z1,y1,
      3,3,3, 
      0,0,0, color(200,result,0) ); 
    }
  }
}

void ShowGraph4() {

  for (int i = -180; i < 180; i = i+5) {
    int posX = i*4; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result =100* sin(radians(i)); 
      BoxParameters ( posX,(100-result)-100 ,-posY-20,
      3,3,3, 
      0,0,0, color(200,result,0) ); 
    }
  }
}

// ----------------------------------------------------------
// Show LookUps - different ways

void ShowLookupAsBoxes() {
  // not so nice
  colorMode(RGB,400);
  noStroke();

  if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
    ShowSpecialMessage("LookUp-Table not defined."); 
  } 
  else {
    for (int i = 0; i < MaxindexI; i = i+3) {
      for (int j = 0; j < MaxindexJ; j = j+3) {

        BoxParameters (MyResults[i][j].x,MyResults[i][j].y,MyResults[i][j].z,
        3,3,3, 
        0,0,0, 
        color(2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z)) ); 
      } // j 
    } //i
  } // else 
} // ShowGraph1

void ShowLookupAsGrid() {
  // nice
  colorMode(RGB,400);
  noStroke();
  if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
    ShowSpecialMessage("LookUp-Table not defined."); 
  } 
  else {
    for (int i = 0; i < MaxindexI; i = i+1) {
      for (int j = 0; j < MaxindexJ; j = j+1) {
        fill (2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z));
        beginShape(QUAD); 
        vertex(MyResults[i][j].x,MyResults[i][j].y,MyResults[i][j].z);      
        vertex(MyResults[i+1][j].x,MyResults[i+1][j].y,MyResults[i+1][j].z);      
        vertex(MyResults[i+1][j+1].x,MyResults[i+1][j+1].y,MyResults[i+1][j+1].z);  
        vertex(MyResults[i][j+1].x,MyResults[i][j+1].y,MyResults[i][j+1].z);      
        endShape(CLOSE); 
      } // j 
    } //i
  } // else 
} // ShowGraph2

void ShowLookupWithPovRaySpheres() {
  // With spheres in POV-Ray
  //colorMode(RGB,400);
  //noStroke();
  if (DoesPOVRayExist()) {
    if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
      ShowSpecialMessage("LookUp-Table not defined."); 
    } 
    else {    
      ShowSpecialMessage("Can take a while..."); 
      String Buffer = ""; 
      String MyText = ""; 
      println ("Start preparing Povray Spheres");
      for (int i = 0; i < MaxindexI; i = i+3) {
        for (int j = 0; j < MaxindexJ; j = j+3) {
          // fill (2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z));

          Buffer = Buffer + 
            "MySphere (" + 
            ((MyResults[i][j].x) * .1 ) + ", " + 
            ((8 - MyResults[i][j].z) * .1 ) + ", " + 
            ( (8 - MyResults[i][j].y) * .1 + 1.2) +  
            ")" + "\n";

        } // j 
      } //i

      println ("Now the files...");

      MyText = GetText("","") + "\n // Commands here " + Buffer; 
      WriteToFile ( MyText ); 

      println ("Finished preparing Povray");
    } // else
  } // if DoesPOVRayExist

} // function 

void ShowLookupWithPovRayPoly() {
  // with polygons in PovRay
  // colorMode(RGB,400);
  // noStroke();

  if (DoesPOVRayExist()) {
    if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
      ShowSpecialMessage("LookUp-Table not defined."); 
    } 
    else {
      ShowSpecialMessage("Can take a while (5 minutes or more)..."); 
      String Buffer = ""; 
      String MyText = ""; 
      println ("Start preparing Povray Polygons");
      for (int i = 0; i < MaxindexI; i = i+1) {
        for (int j = 0; j < MaxindexJ; j = j+1) {
          // fill (2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z));

          Buffer = Buffer + 
            "MyPoly (" + 
            MyResults[i][j].x*.1 + ", " + MyResults[i][j].y *.1+ ", " + MyResults[i][j].z*.1  + ", " + 
            MyResults[i+1][j].x*.1 + ", " + MyResults[i+1][j].y *.1+ ", " + MyResults[i+1][j].z*.1 + ", " + 
            MyResults[i+1][j+1].x*.1 + ", " + MyResults[i+1][j+1].y*.1 + ", " + MyResults[i+1][j+1].z*.1 + ", " + 
            MyResults[i][j+1].x *.1+ ", " + MyResults[i][j+1].y*.1 + ", " + MyResults[i][j+1].z *.1 + 
            ")" + "\n";

        } // j 
      } //i

      println ("Now the files...");

      MyText = GetText("","") + "\n // Commands here \n " + Buffer; 
      WriteToFile ( MyText ); 

      println ("Finished preparing Povray");
    } // else
  } //   if DoesPOVRayExist

} // function 

// -----------------------------------------------------------------
// Inits of LookUps (MyResults) - that's the way to do it

void InitGraph_Sphere() { 

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/sphere/

  int indexI=0;
  int indexJ=0;
  float r1 = 100 ; 

  for (int i = 0; i < 360; i = i+10) {
    indexJ=0;
    for (int j = -180; j < 180; j = j+10) {

      float x1 = 10 + r1* cos(i) *cos(j);
      float y1 = 10 + r1* cos(i) *sin(j);
      float z1 = 10 + r1* sin(i) ;
      MyResults[indexI][indexJ] = new PVector(x1,y1,z1);
      indexJ = indexJ + 1;

    }
    indexI=indexI+1; 
  }
  MaxindexJ = indexJ-1; 
  MaxindexI = indexI-1; 
} // function

void InitGraph_ItimesItimesJ() {

  int indexI=0;
  int indexJ=0;

  for (int i = -80; i < 80; i = i+1) {
    float posX = i*4.0; 
    indexJ=0; 
    for (int j = -80; j < 80; j = j+1) {
      float posY = j*4.0; 
      result = .001*i*i*j;            
      MyResults[indexI][indexJ] = new PVector(posX,(100-result)-100 ,-posY-20);
      indexJ = indexJ + 1;
    } // j 
    indexI=indexI+1; 
  } //i
  MaxindexJ = indexJ-1; 
  MaxindexI = indexI-1; 
} // function

void InitGraph_Cresent() {

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/cresent/

  //x = (2 + sin(2 pi u) sin(2 pi v)) sin(3 pi v) 
  //y = (2 + sin(2 pi u) sin(2 pi v)) cos(3 pi v) 
  //
  //z = cos(2 pi u) sin(2 pi v) + 4 v - 2 
  //
  //with 0 <= u <= 1, 0 <= v <= 1 

  float r1 = 100 ; 
  float u= 0;
  float x1,y1,z1;
  int indexI=0; 
  int indexJ = 0;

  for (int i = 0; i < 101; i = i+1) {
    float v=0;
    indexJ = 0; 
    for (int j = 0; j < 101; j = j+1) {

      x1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *sin(3 *PI *v) ;
      y1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *cos(3 *PI *v); 
      z1 = cos(2 *PI *u) *sin(2 *PI *v) + 4 *v - 2 ;

      MyResults[indexI][indexJ] = new PVector(100*x1,100*y1,100*z1);

      v = v + 0.03; // .01
      indexJ=indexJ+1; 
    }
    u = u + 0.03; // .01 
    indexI=indexI+1; 
  }
  MaxindexJ = indexJ - 1; 
  MaxindexI = indexI - 1; 
}

// Other functions ---------------------------- 

void ShowCoor() { 

  stroke(222,222,222);

  // all smaller 0 ----------------------------
  line ( -100, 0, 0, 0, 0, 0 );
  text("-x", -100, 0,0); 

  line ( 0, 100, 0, 0, 0, 0 );
  text("-z", 0,100,0); 

  line ( 0, 0, 100, 0, 0, 0 );
  text("-y", 0,0,100); 

  // all greater 0 ------------------------------
  line ( 0, 0, 0, 100,   0,   0 );
  text("x", 100, 0,0); 

  line ( 0, 0, 0, 0,   -100,   0 );
  text("z", 0,-100,0); 

  line ( 0, 0, 0, 0,     0, -100 );    
  text("y", 0,0,-100); 

} // function 

void ShowText (String MyText) {
  cam.beginHUD();
  fill(254, 254, 254);
  textMode(SCREEN);
  if (boolShowSpecialMessage) {   
    text(SpecialText, 40,45);   
  } 
  else {
    text(MyText, 40,45); 
  }
  textMode(MODEL);
  cam.endHUD();
} // function 

void BoxParameters ( float x,float y,float z, 
float w, float h, float d,  
float RotateX, float RotateY, float RotateZ,
color color1) {
  // Position and size and rotation of a box 
  stroke(0); 
  fill (color1);
  pushMatrix();
  translate ( x,y,z );
  rotateX ( radians(RotateX) );
  rotateY ( radians(RotateY) );
  rotateZ ( radians(RotateZ) );  
  box ( w,h,d );
  popMatrix();

} // function 

void setCamHorizontal() {

  // Brings Gamefield/cam in horizontal position 
  // without distorting the rotation around the x-axis.
  // Connected with letter 'h'.
  // Sometimes it does distort the rotation around the x-axis.

  float[] rotations = cam.getRotations(); // x, y, and z rotations required to face camera in model space  
  // camera.setRotations(double pitch, double yaw, double roll); // rotations are applied in that order
  // println( rotations[0] + " " +  rotations[1] + " " +  rotations[2] );
  // cam.rotateX(1);
  // Wert 1 nach hinten drehend, 2 nach links (Drehachse senkrecht), 3 Drehachse in den Schirm hinein ragend
  cam.setRotations( 0,  rotations[1], 0 ); // rotations are applied in that order

} // function 

// ---------------------------------------------------------------

String HelpText () {

  String Buffer = ""; 

  //   Buffer

  Buffer = "=== HELP === " +  "\n " +  "\n"; 
  Buffer = Buffer + "3D-Function plotter. " +  ""; 
  Buffer = Buffer + "You reach this help via F1. " ;  
  Buffer = Buffer + "\nSome functions are calculated directly, others via lookup-table.  " ;    
  Buffer = Buffer + "\nThe latter are shown first via small boxes, then as a grid (not working properly with \nthe sphere, but looks cool with OPENGL if you zoom in the sphere).  \n\n\n" ;   
  Buffer = Buffer + " ------ Issues: ---------\n\n";
  Buffer = Buffer + "The shown formulas are not always correct, there are some adjustments of the scales and so on.\n" ;  
  Buffer = Buffer + "Also the coordinates are not always perfect.\n" ;  
  Buffer = Buffer + "There are issues with P3D (when camera is to close to the graph) \nand OPENGL (in some browsers). " ;  
  Buffer = Buffer + "\n\n"  ; 
  Buffer = Buffer + "\n"  ;   
  Buffer = Buffer + " ------ Navigating the functions: ---------";
  Buffer = Buffer + "\n\nUse P for Previous function and N for next function. " ;  
  // Buffer = Buffer + "\nCamera resets with p and n. " ;  
  Buffer = Buffer + "\nIf first or last function is reached, nothing happens. " ;        
  Buffer = Buffer + "\n " ;  
  Buffer = Buffer + "\n " ;  
  Buffer = Buffer + "\n " ;    
  Buffer = Buffer + " ------ Moving the view of the Graph: ---------";
  Buffer = Buffer + "\n " ;
  Buffer = Buffer + "\n" ;
  Buffer = Buffer + "Left-drag to rotate; \nmouse wheel, or right-drag up and down to zoom; \nmiddle-drag (cmd-left-drag on mac) to pan.  \n " ;  
  Buffer = Buffer + "Use Mouse-Double-Click or 'r' to reset view. " ;  
  Buffer = Buffer + "\n " ;
  Buffer = Buffer + "\n "  ; 
  Buffer = Buffer + "\n "  ; 
  Buffer = Buffer + " ------ Keys to use (not mentioned above): --------"  ; 
  Buffer = Buffer + "\n\n"  ; 
  Buffer = Buffer + "m - toggle camera animation (slow rotation)\n"  ; 
  Buffer = Buffer + "q - toggle coordinates \n"  ;   
  Buffer = Buffer + "Up and Down Cursor-Key - rotate\n"  ; 
  Buffer = Buffer + "Left and Right Cursor-Key - rotate \n"  ; 
  Buffer = Buffer + "h - turns the Graph horizontal; sometimes also rotating around the x-axis\n"; 
  Buffer = Buffer + "s - save as simple tiff-image-file\n"; 
  Buffer = Buffer + "i - save as POV-Ray with spheres\n";   
  Buffer = Buffer + "o - save as POV-Ray with surface\n";     
  Buffer = Buffer + "ESC - quit .\n"  ;   
  Buffer = Buffer + "\n "  ;
  Buffer = Buffer + ""  ; 
  Buffer = Buffer + "Thanks goes to Paul Bourke for his page: http://local.wasp.uwa.edu.au/~pbourke/geometry. \nUsed sphere and crescent from there. "  ;
  Buffer = Buffer + "Thanks goes to PeasyCam. "  ;

  return (Buffer);

} // function help 

// PovRay-Export ----------------------------------------------------------------------------------------- 

String GetText( String strPfadKommentar, String strNameKommentar) {

  //    Dim i
  //    Dim j
  //    Dim a(205]
  //    Dim strT

  int i = 0; 

  String [] a = new String[350]; 


  a[i] = "// Persistence of Vision Ray Tracer Scene Description File"; 
  i = i + 1;
  a[i] = "// File: " + strPfadKommentar + " " + strNameKommentar; 
  i = i + 1;
  a[i] = "// Vers: 3.6"; 
  i = i + 1;
  a[i] = "// Desc: Basic Scene Example"; 
  i = i + 1;
  a[i] = "// Date: " + TodaysDate(); 
  i = i + 1;
  a[i] = "// Auth: ?"; 
  i = i + 1;
  a[i] = "//"; 
  i = i + 1;

  a[i] = "// This file was generated by math3D, using code by processing - see www.processing.org."; 
  i = i + 1;  
  a[i] = "// You probably need to adjust the code here in POV-Ray;"; 
  i = i + 1;  
  a[i] = "// e.g. adjust the camera (choose between two); adjust the plane (maybe your work is under it...), adjust the scale of your model, the lights..."; 
  i = i + 1;  

  a[i] = ""; 
  i = i + 1;
  a[i] = "#version 3.6;"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// \"colors\""; 
  i = i + 1;
  a[i] = "#include \"colors.inc\""; 
  i = i + 1;
  a[i] = "// a lot of stone textures"; 
  i = i + 1;
  a[i] = "// T_Stone1 - T_Stone44"; 
  i = i + 1;
  a[i] = "#include \"stones.inc\""; 
  i = i + 1;
  a[i] = "// various [mostly layered] wood textures"; 
  i = i + 1;
  a[i] = "// T_Wood1 - T_Wood35"; 
  i = i + 1;
  a[i] = "#include \"woods.inc\""; 
  i = i + 1;
  a[i] = "// several different gold colors, finishes and textures"; 
  i = i + 1;
  a[i] = "#include \"golds.inc\""; 
  i = i + 1;
  a[i] = "// various metal colors, finishes and textures"; 
  i = i + 1;
  a[i] = "// brass, copper, chrome, silver"; 
  i = i + 1;
  a[i] = "#include \"metals.inc\""; 
  i = i + 1;
  a[i] = "// various metal colors, finishes and textures"; 
  i = i + 1;
  a[i] = "// brass, copper, chrome, silver"; 
  i = i + 1;
  a[i] = "#include \"metals.inc\""; 
  i = i + 1;
  a[i] = "// various glass finishes, colors and interiors"; 
  i = i + 1;
  a[i] = "#include \"glass.inc\""; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "/*"; 
  i = i + 1;
  a[i] = "global_settings {"; 
  i = i + 1;
  a[i] = "  assumed_gamma 1.0"; 
  i = i + 1;
  a[i] = "}   */"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// ----------------------------------------"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "camera {"; 
  i = i + 1;
  a[i] = "  location  <15.0, 30.5, 15  >"; 
  i = i + 1;
  a[i] = "  look_at   <15.0, 0.0,  15.0>"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "camera {"; 
  i = i + 1;
  a[i] = "  location  <90.0, 0.0, -80.0>"; 
  i = i + 1;
  a[i] = "  // direction 1.5*z"; 
  //  i = i + 1;
  a[i] = "  // right     x*image_width/image_height"; 
  // i = i + 1;
  a[i] = "  look_at   < 10.0, 0.0, 0.0>"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = "  "; 
  i = i + 1;
  a[i] = "  "; 
  i = i + 1;
  a[i] = "sky_sphere {"; 
  i = i + 1;
  a[i] = "  pigment {"; 
  i = i + 1;
  a[i] = "    gradient y"; 
  i = i + 1;
  a[i] = "    color_map {"; 
  i = i + 1;
  a[i] = "      [0.0 rgb <0.6,0.7,1.0>]"; 
  i = i + 1;
  a[i] = "      [0.7 rgb <0.0,0.1,0.8>]"; 
  i = i + 1;
  a[i] = "    }"; 
  i = i + 1;
  a[i] = "  }"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "light_source {"; 
  i = i + 1;
  a[i] = "  <0, 0, 0>            // light's position (translated below]"; 
  i = i + 1;
  a[i] = "  color rgb <1, 1, 1>  // light's color"; 
  i = i + 1;
  a[i] = "  translate <-30, 30, -300>"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// ----------------------------------------"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "#macro MySphere (x1,y1,z1)  // ---------------------------------------------------------------------------"; 
  i = i + 1;
  a[i] = "    "; 
  i = i + 1;
  a[i] = "    sphere {"; 
  i = i + 1;
  a[i] = "        <x1,z1,y1>, 1"; 
  i = i + 1;
  a[i] = "        // texture { T_Stone2 }"; 
  i = i + 1;
  a[i] = "        texture { F_Glass5 } // texture { T_Glass1 }"; 
  i = i + 1;
  a[i] = "        "; 
  i = i + 1;
  a[i] = "        /*"; 
  i = i + 1;
  a[i] = "        // material {} is a wrapper for interior and texture"; 
  i = i + 1;
  a[i] = "        // you can declare it like texture and interior too"; 
  i = i + 1;
  a[i] = "        // Note that it has nothing to do with material_map  */ "; 
  i = i + 1;
  a[i] = "        material {"; 
  i = i + 1;
  a[i] = "          texture {"; 
  i = i + 1;
  a[i] = "            pigment { color rgbt <x1, y1, z1, 0.5> }"; 
  i = i + 1;
  a[i] = "            finish { diffuse 0.2 specular 0.6 }"; 
  i = i + 1;
  a[i] = "          }"; 
  i = i + 1;
  a[i] = "          interior {"; 
  i = i + 1;
  a[i] = "          // ior 1.5"; 
  i = i + 1;
  a[i] = "          }"; 
  i = i + 1;
  a[i] = "        }   "; 
  i = i + 1;
  a[i] = "     "; 
  i = i + 1;
  a[i] = "    }"; 
  i = i + 1;
  a[i] = "#end // macro  "; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "#macro MyPoly ( x1,y1,z1, x2,y2,z2, x3,y3,z3, x4,y4,z4 )  // ----------------------------"; 
  i = i + 1;

  a[i] = "     " ;  
  i = i + 1 ; 
  a[i] = "    // polygons  " ;  
  i = i + 1 ; 
  a[i] = "    polygon { " ;  
  i = i + 1 ; 
  a[i] = "      4, // number of points " ;  
  i = i + 1 ; 
  a[i] = "      <x1,y1,z1>, < x2,y2,z2 >,  " ;  
  i = i + 1 ; 
  a[i] = "      <x3,y3,z3>, <x1,y1,z1>  " ;  
  i = i + 1 ; 
  a[i] = "      texture { T_Chrome_2C } " ;  
  i = i + 1 ; 
  a[i] = "    }" ;  
  i = i + 1 ; 
  a[i] = "       " ;  
  i = i + 1 ; 
  a[i] = "    polygon { " ;  
  i = i + 1 ; 
  a[i] = "      4, // number of points " ;  
  i = i + 1 ; 
  a[i] = "      <x1,y1,z1>, < x2,y2,z2 >,  " ;  
  i = i + 1 ; 
  a[i] = "                  < x4,y4,z4 >, " ;  
  i = i + 1 ; 
  a[i] = "                  <x1,y1,z1>  " ;  
  i = i + 1 ; 
  a[i] = "      texture { T_Chrome_2C } " ;  
  i = i + 1 ; 
  a[i] = "    }       " ;  
  i = i + 1 ; 
  a[i] = "    polygon { " ;  
  i = i + 1 ; 
  a[i] = "      4, // number of points " ;  
  i = i + 1 ; 
  a[i] = "      <x3,y3,z3> , < x2,y2,z2 >,  " ;  
  i = i + 1 ; 
  a[i] = "                  < x4,y4,z4 >," ;  
  i = i + 1 ; 
  a[i] = "                  <x3,y3,z3>  " ;  
  i = i + 1 ; 
  a[i] = "      texture { T_Chrome_2C } " ;  
  i = i + 1 ; 
  a[i] = "    }      " ;  
  i = i + 1 ; 


  a[i] = "    "; 
  i = i + 1;
  a[i] = "#end // macro  "; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// ---------------------------------------------------------------------------"; 
  i = i + 1;
  a[i] = "#declare Radiosity=on;"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "global_settings {"; 
  i = i + 1;
  a[i] = "  assumed_gamma 1.0"; 
  i = i + 1;
  a[i] = "  //max_trace_level 25"; 
  i = i + 1;
  a[i] = "  #if (Radiosity)"; 
  i = i + 1;
  a[i] = "    radiosity {"; 
  i = i + 1;
  a[i] = "      pretrace_start 0.08           // start pretrace at this size"; 
  i = i + 1;
  a[i] = "      pretrace_end   0.04           // end pretrace at this size"; 
  i = i + 1;
  a[i] = "      count 35                      // higher -> higher quality [1..1600] [35]"; 
  i = i + 1;
  a[i] = "      nearest_count 5               // higher -> higher quality [1..10] [5]"; 
  i = i + 1;
  a[i] = "      error_bound 1.8               // higher -> smoother, less accurate [1.8]"; 
  i = i + 1;
  a[i] = "      recursion_limit 3             // how much interreflections are calculated [1..5+] [3]"; 
  i = i + 1;
  a[i] = "      low_error_factor .5           // reduce error_bound during last pretrace step"; 
  i = i + 1;
  a[i] = "      gray_threshold 0.0            // increase for weakening colors [0..1] [0]"; 
  i = i + 1;
  a[i] = "      minimum_reuse 0.015           // reuse of old radiosity samples [0.015]"; 
  i = i + 1;
  a[i] = "      brightness 1                  // brightness of radiosity effects (0..1] [1]"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "      adc_bailout 0.01/2"; 
  i = i + 1;
  a[i] = "      //normal on                   // take surface normals into account [off]"; 
  i = i + 1;
  a[i] = "      //media on                    // take media into account [off]"; 
  i = i + 1;
  a[i] = "      //save_file \"file_name\"       // save radiosity data"; 
  i = i + 1;
  a[i] = "      //load_file \"file_name\"       // load saved radiosity data"; 
  i = i + 1;
  a[i] = "      //always_sample off           // turn sampling in final trace off [on]"; 
  i = i + 1;
  a[i] = "      //max_sample 1.0              // maximum brightness of samples"; 
  i = i + 1;
  a[i] = "    }"; 
  i = i + 1;
  a[i] = "  #end"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "#default {"; 
  i = i + 1;
  a[i] = "  texture {"; 
  i = i + 1;
  a[i] = "    pigment {rgb 1}"; 
  i = i + 1;
  a[i] = "    #if (Radiosity)"; 
  i = i + 1;
  a[i] = "      finish {"; 
  i = i + 1;
  a[i] = "        ambient 0.0"; 
  i = i + 1;
  a[i] = "        diffuse 0.6"; 
  i = i + 1;
  a[i] = "        specular 0.3"; 
  i = i + 1;
  a[i] = "      }"; 
  i = i + 1;
  a[i] = "    #else"; 
  i = i + 1;
  a[i] = "      finish {"; 
  i = i + 1;
  a[i] = "        ambient 0.1"; 
  i = i + 1;
  a[i] = "        diffuse 0.6"; 
  i = i + 1;
  a[i] = "        specular 0.3"; 
  i = i + 1;
  a[i] = "      }"; 
  i = i + 1;
  a[i] = "    #end"; 
  i = i + 1;
  a[i] = "  }"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// ----------------------------------------"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "/*"; 
  i = i + 1;
  a[i] = "light_source {"; 
  i = i + 1;
  a[i] = "  <500,500,-500>       // light's position"; 
  i = i + 1;
  a[i] = "  color rgb <1, 1, 1>  // light's color"; 
  i = i + 1;
  a[i] = "} */"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "sky_sphere {"; 
  i = i + 1;
  a[i] = "  pigment {"; 
  i = i + 1;
  a[i] = "    gradient y"; 
  i = i + 1;
  a[i] = "    color_map {"; 
  i = i + 1;
  a[i] = "      [0.0 rgb <0.6,0.7,1.0>]"; 
  i = i + 1;
  a[i] = "      [0.7 rgb <0.0,0.1,0.8>]"; 
  i = i + 1;
  a[i] = "    }"; 
  i = i + 1;
  a[i] = "  }"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "// ----------------------------------------"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;
  a[i] = "plane {"; 
  i = i + 1;
  a[i] = "  y, -40"; 
  i = i + 1;
  a[i] = "  texture {"; 
  i = i + 1;
  a[i] = "    pigment {"; 
  i = i + 1;
  a[i] = "      checker"; 
  i = i + 1;
  a[i] = "      color rgb <1.0, 0.8, 0.6>"; 
  i = i + 1;
  a[i] = "      color rgb <1.0, 0.0, 0.0>"; 
  i = i + 1;
  a[i] = "      scale 25"; 
  i = i + 1;
  a[i] = "    }"; 
  i = i + 1;
  a[i] = "  }"; 
  i = i + 1;
  a[i] = "}"; 
  i = i + 1;
  a[i] = ""; 
  i = i + 1;

  String strT = "";

  for (int j = 0; j < i; j = j+1) {
    strT = strT + a[j] + "\n";
  }

  return (strT);

} // function 

String TodaysDate () {
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  String s = String.valueOf(d);

  return( s+"." + String.valueOf(m) + "." + String.valueOf(y) + " (dd.mm.yyyy)" );
}

void WriteToFile ( String MyText ){

  // Write to file

  final String fileName = "output.pov"; 

  // for save 
  PrintWriter output;

  int i = 13; 
  int i2 = 10;  
  char c = char(i);
  char c2 = char(i2);
  String SketchPath1 = sketchPath(""); 

  // Create a new file in the sketch directory
  output = createWriter(fileName);   
  String Buffer = MyText; 
  String ReplaceWith = " " +  c + c2; 
  output.println(Buffer.replaceAll ("\n", ReplaceWith )); // Write to the file
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  File f = new File(PathToPOVRayExe);
  if (f.exists()) { 
    // println("I found the file."); 
    String[] params = { 
      PathToPOVRayExe,  "/RENDER" , "" + SketchPath1 + fileName + "" , "/EDIT" ,  "" + SketchPath1 + fileName + "" , "/NR"                                                                                                                                                 }  
    ;
    // from http://www.coderanch.com/t/419192/Java-General/java/Runtime-getRuntime-exec-String-command
    Runtime rt = Runtime.getRuntime();  //  
    try {   
      rt.exec(params  ) ; // "mspaint " + strPictureLocation);  
    } 
    catch (IOException ioe) {   
      ioe.printStackTrace();    
    }    
  } 
  else 
  {     
    ShowSpecialMessage("Could not find POV-Ray: " + PathToPOVRayExe + ". Sorry. Please correct the path in source."); 
  }
} // function 

// Misc ----------------------------------------------------------------------------------------------------------------------

void ShowSpecialMessage (String strText1) {
  boolShowSpecialMessage = true; 
  SpecialText = strText1; 
  ShowText(strText1);
  ShowSpecialMessageStartTime = millis(); 
}

boolean DoesPOVRayExist () {
  boolean Buffer = false; 
  File f = new File(PathToPOVRayExe);
  if ( ! f.exists() ) { 
    ShowSpecialMessage("Could not find POV-Ray:\n" + PathToPOVRayExe + ". \nSorry. Please correct the path in source."); 
    Buffer = false; 
  } 
  else { 
    Buffer = true; 
  }
  return ( Buffer ); 
} // function 

//String AtTheEnd( String Word1, int LengthSubstring ) {
//
//  String Buffer = "";
//  Buffer = Word1.substring ( Word1.length() - LengthSubstring, Word1.length() ); 
//  return (Buffer);
//}

//void BoxParametersKoor ( float x,float y,float z, 
//float w, float h, float d,  
//float RotateX, float RotateY, float RotateZ ) {
//  // Position and size and rotation of a box 
//  stroke(222); 
//  noFill(); //  (0,254,1);
//  pushMatrix();
//  translate ( x,y,z );
//  rotateX ( radians(RotateX) );
//  rotateY ( radians(RotateY) );
//  rotateZ ( radians(RotateZ) );  
//  box ( w,h,d );
//  popMatrix();
//
//} // function 

//void printVector (PVector p1) {
//
//  println (p1.x + ", " + p1.y + ", " + p1.z ); 
//
//}




















































































































































