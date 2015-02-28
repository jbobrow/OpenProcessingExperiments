

void setup() {
  size(1200, 1200);
  background(0, 245, 255);
  smooth();
  noStroke();
}

void draw() {
  stroke(1);
  noFill();
  drawLilGuy();
  rotate(TWO_PI /frameCount);
  drawTria();
  rotate(QUARTER_PI /frameCount/200);
  drawTri();
  drawLine();
 }

void drawTri() {
  triangle(400, 200, 450, 450, 200, 200);
}

void drawLine() {
  int pointPlacex = (200+frameCount*2);
  int pointPlacey = (600+frameCount);
  line(400, 200, pointPlacex, 450);
  if (pointPlacex>600) {
    frameCount=(-frameCount);
  }
}
void drawTria() {
 triangle(600, 200, 650, 250, 250, 250); 
}

void drawLilGuy() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(TWO_PI /frameCount+100);
  rect(70, -70, 85, -75);
  popMatrix();
}
    


//setup
//initialize variables
//draw a shape
//draw another shape

//draw
//push matrix
//translate
//draw shape one
//pop matrix

//push matrix
//translate
//draw shape two
//pop Matrix



