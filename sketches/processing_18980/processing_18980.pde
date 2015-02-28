
// variables IV 
// using built-in variables
// using the modulo (%) operator (gives us the reminder of a division)

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
}

//--------------------------------------------------------
void draw() {
  background(128);
  noStroke();
  fill(frameCount % 256);
  rectMode(CENTER);
  // width/2 and height/2 = center of the window!
  rect(width/2, height/2, mouseX+10, mouseY+10); 
}
