
// Drawing 2 rotating pyramids, like a planet and a moon.
// The user can write text on canvas and save the first line.

PFont f; //  Declare PFont variable
float theta = 0.0;
// Variable to store text currently being typed
String typing = "";
// Variable to store saved text when return is hit
String saved = "";

void setup() {
  size(800,600,P3D);
  f = createFont("Arial",16,true); // Create Font
}

void draw() {
  background(255);
  int indent = 25;
  
  theta += 0.01;
 
  textFont(f, 22);   // Specify font to be used
  fill(0);          // Specify font color 
  
  // Display everything
  text( "Type on your keyboard. Hit return to save what you typed.\n\n It may show only numbers. Copy and paste my code into your Processing.\n In Java mode you'll be able to write and see characters. ", indent, 40);
  text(typing,indent,190);
  text(saved,indent,170);
  
  translate(400,350,0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(80);
  
  // translate the scene again
  translate(100,100,60);
  // call the pyramid drawing function
  drawPyramid(15);

  if(mousePressed){
  strokeWeight(mouseY/40);
 }
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}

void drawPyramid(int t) {
  stroke(0);

  // this pyramid has 4 sides, each drawn as a separate triangle
  // each side has 3 vertices, making up a triangle shape
  // the parameter " t " determines the size of the pyramid
  beginShape(TRIANGLES);
  
  fill(150,0,0,127);
  vertex(-t,-t,-t);
  vertex( t,-t,-t);
  vertex( 0, 0, t);
  
  fill(0,150,0,127);
  vertex( t,-t,-t);
  vertex( t, t,-t);
  vertex( 0, 0, t);
  
  fill(0,0,150,127);
  vertex( t, t,-t);
  vertex(-t, t,-t);
  vertex( 0, 0, t);
  
  fill(150,0,150,127);
  vertex(-t, t,-t);
  vertex(-t,-t,-t);
  vertex( 0, 0, t);
  
  endShape();
}
