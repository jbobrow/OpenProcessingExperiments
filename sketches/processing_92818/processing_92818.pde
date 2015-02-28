
//this is what happens when the program starts.
//it only happens once
void setup() {
  size(400, 400);
  //this creates a canvas of 400 pixels wide
  //and 400 pixels high
  smooth();
  //press 3 times harder than drawing lines
  strokeWeight(10);
}
//this tels Precessing how to draw
//it happens continuously
void draw() {
  
  background(300,150,300);
  fill(150,400,30);
  
  //draw face
  stroke(0);
  ellipse(200, 200, 300, 300);
  fill(150);
  //draw eyes
  stroke(200);
  ellipse(140, 150, 50, mouseX);
  ellipse(260, 150, 50, mouseX);
  //draw a line from 100,250 to 300,250
  //draw mouth
  fill(10,100,100);
  rect(130,250,150,40);
  //draw nose
  line(200, 200, 200, 220);
}
