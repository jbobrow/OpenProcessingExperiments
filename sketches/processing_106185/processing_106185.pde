
float angle = 0;

void setup() {
  //size(displayWidth, displayHeight, P3D);
  size(1000, 800, P3D);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);
 
  // use this for nice, slow rotation
  angle += 0.005;
  
  // use this to rotate once per minute
  // (like a clock!)
  //angle = millis()/1000.0;
  //angle /= TWO_PI;
  

  // wrong way
  // rotates around the top left corner (0, 0)
  //rotate(angle);
  //rect(width/2, height/2, 300, 300);

  // right way. translate 0, 0 to where you want to 
  // draw, then draw at 0, 0
  pushMatrix();
  translate(width/2, height/2);
  
  rotate(angle);
  stroke(0);
  line(-width/2, 0, width, 0);
  line(0, -height/2, 0, height/2);
  
  fill(#007DB4, 100);
  noStroke();
  rect(0, 0, 300, 300);
  //popMatrix();

  // draw another rectangle to the right
  //pushMatrix();
  translate(300, 0);
  //translate(width/2 + 300, height/2);
  //rotate(angle);
  fill(#00B254);
  rotateX(angle*10);
  rect(0, 0, 300, 300);
  
  translate(300, 300);
  fill(#FF4652);
  scale(0.5);
  rotateY(angle*10);
  rect(0, 0, 300, 300);
  
  popMatrix();

}

boolean sketchFullScreen() {
  return true;
}
