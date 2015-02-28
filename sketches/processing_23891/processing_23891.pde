
// transformations move the origin (0, 0) as well as rotate/scale the canvas

void setup() {
  size(300, 300);  
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(64);
  
  // no transformations applied
  fill(255, 128);       // white
  rect(0, 0, 75, 75);
  
  // move the origin by a certain amount 
  translate(mouseX, mouseY);
  fill(255, 0, 0, 128);  // red
  rect(0, 0, 75, 75);
  
  // rotate the canvas (the angle should be in radians)
  rotate( radians(frameCount) );
  fill(0, 255, 0, 128);  // green
  rect(0, 0, 75, 75);
  
  // translate the origin again by 120 pixels to the right
  // note that "rotate" already turned the canvas, so the actual translation
  // is affected by the rotation!
  translate(120, 0);
  fill(0, 0, 255, 128);  // blue
  rect(0, 0, 75, 75);
}
