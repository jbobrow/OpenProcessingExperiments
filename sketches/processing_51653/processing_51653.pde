
//2) a representation of something cute/evil
void setup(){
  // Set the size of the window
  size(200,200);
  smooth();
}
void draw() {
  // yellow background
  background(255, 247, 3);
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  // characters head
  stroke(0);
  fill(245, 218, 175);
  ellipse(100,70,150, 150);
  // characters eyes
  fill(255);
  ellipse(60,70,60,60);
  ellipse(140,70,60,60);
  //characters pupils
  fill(8, 133, 255);
  ellipse(60, 70, 10, 20);
  ellipse(140, 70, 10, 20);
  //characters smile
  fill(255);
  ellipse(100,110, 20, 10);
}

