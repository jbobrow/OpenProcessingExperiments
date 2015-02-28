
//Devon Nitz -  Art 348 - Processing Interactive Drawing Tool

///////////////////////
///    VARIABLES   ////
///////////////////////


int dia= random(20,100); //diameter of ellipse change
int trans= 40; //transparency 

int r1= 0; //color darker blue 
int g1= 123; //color darker blue
int b1= 218; //color darker blue

int r2=188; //color light blue
int g2=226; //color light blue
int b2=255; //color light blue


///////////////////////
///  VOID SETUP    ////
///////////////////////

void setup() {
  background(0);
  size(800,800);
  smooth();
}
 
 
 ///////////////////////
///      DRAW       ///
///////////////////////
 
void draw() {
 
///////////////////////
/// MOUSE PRESSED  ////
///////////////////////
    if (mousePressed) {
drawEllipse();  }  


///////////////////////
//// KEY PRESSED  /////
///////////////////////

 if (keyPressed) {
 if (key=='s') { saveDrawing();}  //Save 
 if (key==' ') {clearScreen();}   //Clear Screen
 if (key=='c') {colorColor(); }   //Change color (random)
 if (key=='f') {layerFade();}     // Layer Fades
 dia=random(20,100);}             //Ellipse Diameter changes, regardless of what key you press.
 }

///////////////////////
// CUSTOM FUCNTIONS ///
///////////////////////

void colorColor() { 
 r1=random(0,7); g1=random(99,123); b1=random(171,218);
 r2=random(156,188); g2=random(207,226); b2=random(247,255);
} // Color Change function when you press the 'c' key

function saveDrawing() {
saveFrame("images/Microscope_###.png");
} //Save function

void clearScreen(){
   background(0);} //clear background function
   


void drawEllipse() {
  float x= random(2,30);
  float y= random(2,30);
      noFill();
      stroke(r1,g1,b1,trans);
ellipse (mouseX, mouseY, dia, dia);
      stroke(r2,g2,b2,trans);
ellipse (mouseY, mouseX, dia, dia);
}  //draw the ellipses and symmetry function


void layerFade(){ 
  noStroke();
  fill(15,15,15,30);
  rect(0,0,800,800);
} //layer fade function


