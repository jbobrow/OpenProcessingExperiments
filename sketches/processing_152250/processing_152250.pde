
/* Colourful TRIANGLES
/ By Jason Prine; inspired by a background image I saw on an iPad @ a bookstore.
/ Move the mouse to change colour; press 's' to save a JPG or 'p' to save a PDF.
/ Moified June 20, 2014
*/

//PDF setup
import processing.pdf.*;


//global variables
int disWidth = 500; // displayWidth;
int disHeight = 500; // displayHeight;
float numTriangles = 7; //number of triangles in half a row
float sideLength = disWidth / numTriangles; //length of a side
float triHeight = sideLength; //
float calcHeight = triHeight;

void setup() {
  
    //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  size(disWidth, disHeight);
  beginRecord(PDF, "colourful_triangles.pdf"); //for saving a PDF
  noStroke();
  smooth( );
}

void draw () {

// generate multiple rows

for (int r=0; r<triHeight; r++) {
  calcHeight = triHeight * r;// calc the top y value for the row
  
  // top of row triangles

  for (int i=0; i<numTriangles; i++){
    fill(mouseX/10*(i+1),mouseX/10*(i+1),mouseY/10*(i+1)); 
    triangle (sideLength * i, calcHeight, sideLength * i + sideLength, calcHeight, sideLength * i + sideLength / 2, calcHeight+triHeight);
  }
 
  println ("disWidth:",disWidth,"disHeight:",disHeight,"numTriangles:",numTriangles,"sideLength:",sideLength,"triHeight:",triHeight);// debug
    
 // bottom of row triangles
 
  for (int j=0; j<=numTriangles; j++){
  fill(mouseY/10*(j+2),mouseX/10*(j+2),mouseY/10*(j+2)); 
    if (j==0){
     
     triangle (sideLength * j, calcHeight, sideLength * j + sideLength / 2, calcHeight + triHeight, sideLength * j, calcHeight + triHeight);
     triangle (sideLength * j+(sideLength/2), calcHeight + triHeight, sideLength * j+(sideLength*1.5), calcHeight + triHeight, sideLength * j+sideLength, calcHeight);
     println("first bottom triangle" );  
 } else if (j==numTriangles){
      triangle (sideLength * j, calcHeight, sideLength * j, calcHeight + triHeight, sideLength * j - (sideLength / 2), calcHeight + triHeight);
      println("last bottom triangle",sideLength * j, 0, sideLength * j, triHeight, sideLength * j - (sideLength /2), triHeight );
 } else {
      triangle (sideLength * j+(sideLength/2), calcHeight + triHeight, sideLength * j+(sideLength*1.5), calcHeight + triHeight, sideLength * j+sideLength, calcHeight);
      println ("middle triangles:",sideLength * j+(sideLength/2), triHeight, sideLength * j+sideLength, triHeight, sideLength * j+sideLength, 0);
 }
  println("j:",j) ; 
}
}
}

void keyPressed(){
 
    switch( key ){
      case 's': // save your drawing when you press keyboard 's'
        saveFrame("making_squares-####.jpg");
        break;
      case 'p': // save your drawing as PDF you press keyboard 'p'
        endRecord();
        exit();
        break;
      case 'r': // erase your drawing when you press keyboard 'r'
        background(255);
        
    }
}
