
int swag = -100; // starting point for "swag" variable
int hi = -100; // starting point for "hi" variable
int bang = -100; // starting point for "bang" variable

void setup() {
  size(500, 500); // size of canvas
  background(0); // background color
}

void draw() {
  background(0); // prevents shadow/trail of shapes
  // head
  fill(255); // head color
  ellipse(230, 230, 225, 225); // head shape
  
  fill(0); // right eye color
  // right eye
  swag = swag + 5; // speed of eye movement
  swag = min(160, swag); // end point of eye
  ellipse(120+swag, 40+swag, 60, 60); // eye shape
  
  // left eye
  bang = bang + 3; // speed of eye movement
  bang = min(160, bang); // end point of eye
  ellipse(20+bang, 40+bang, 60, 60); // eye shape
  
  // open mouth
  hi = hi + 2; // speed of mouth movement
  hi = min(190, hi); // end point of mouth
  arc(40+hi, 90+hi, 100, 100, 0, PI); // mouth shape
}


