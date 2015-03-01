
// Sets up the program to run, only runs once at begining 
void setup(){
// sets the canvas size to 750pi by 750pi  
  size(750,750);
// sets back ground color to a shade of black  
  background(20);
// sets frame rate to 24 frames per second  
  frameRate(24);
}
// Draws info in this chuck of code over and over again
void draw(){
// states that the next object will be filled(a shade of red)
  fill(140,0,0,5);
// tells the program not to use a stroke on the object
  noStroke();
// determines where the ellipse will be on screem inverted mousex/mousey
//also determines size of elipse
  ellipse( mouseY, mouseX, 15, 150);
}


