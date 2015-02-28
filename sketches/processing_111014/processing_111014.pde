
void setup(){
 
 size(900,600);
 background(0);
 
 PFont sampleFont;
 sampleFont = loadFont("ArialMT-48.vlw");
 textFont(sampleFont);
 
 fill(255);
 text("This is an example of a font", 100, 300);
  
}

/*
float rotater;
void draw(){
rotater += .05; // rotation value grows each frame
fill(255,42);
stroke(0,255,45,45);
translate(mouseX,mouseY); // positions next shape at
// the mouse position
rotate(rotater); // Rotation in RADIANS not degrees
text("John", 0, 0); // draws at 0,0 (top left)
}
*/




