
void setup() {
  size(500, 600, P3D);
  background(0);
  stroke(255);
  fill(255);
  //smooth();
  textFont(createFont("Arial", 16));
}

float angle = 0;
boolean bClear = false;

void draw() {
  if (bClear) {
    bClear = false;
    background(0);
    angle = 0;
  }
  
  smooth();
  
  float pRadius = getRadius(angle) * width/(3+(param3*2));
  float pX = sin(angle) * pRadius;
  float pY = cos(angle) * pRadius;
  
  angle += param4;
  
  float nRadius = getRadius(angle) * width/(3+(param3*2));
  float nX = sin(angle) * nRadius;
  float nY = cos(angle) * nRadius;
  
  drawControls();
  
  stroke(255);
  translate(width/2, width/2);  
  line(pX, pY, nX, nY);
  
}

float param1 = 4;
float param2 = 1;
float param3 = 0.01;
float param4 = 0.05;

float getRadius(float angle) {
  return sin(angle*(param1/param2)) + param3;
}

// CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS 
// CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS 
// CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS 
// CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS // CONTROLS 

float controlFontSize = 14;
float controlKnobSize = 20;
float controlHeight   = 25;

float controlCol = 255;

void drawControls () {
  noStroke(); 

  if (controlCol > 30) controlCol -= 3;
  fill(controlCol);
  stroke(controlCol);
  
  textAlign(LEFT, CENTER);
  textSize(controlFontSize);
  float elementHeight;
  
  elementHeight = height-(controlHeight*3.5);
  text(nf(param1, 2, 2), 10, elementHeight);  
  line(controlFontSize*6, elementHeight, width - controlKnobSize, elementHeight);
  ellipse(map(param1, 0, 100, controlFontSize*6, width - controlKnobSize), elementHeight, controlKnobSize, controlKnobSize);
  
  elementHeight = height-(controlHeight*2.5);
  text(nf(param2, 2, 2), 10, elementHeight);  
  line(controlFontSize*6, elementHeight, width - controlKnobSize, elementHeight);
  ellipse(map(param2, 1, 100, controlFontSize*6, width - controlKnobSize), elementHeight, controlKnobSize, controlKnobSize);
  
  elementHeight = height -(controlHeight*1.5);
  text(nf(param3, 2, 2), 10, elementHeight);  
  line(controlFontSize*6, elementHeight, width - controlKnobSize, elementHeight);
  ellipse(map(param3, 0, 4, controlFontSize*6, width - controlKnobSize), elementHeight, controlKnobSize, controlKnobSize);
  
  elementHeight = height -(controlHeight*0.5);
  text(nf(param4, 2, 2), 10, elementHeight);  
  line(controlFontSize*6, elementHeight, width - controlKnobSize, elementHeight);
  ellipse(map(param4, 0, PI, controlFontSize*6, width - controlKnobSize), elementHeight, controlKnobSize, controlKnobSize);
}

void mousePressed () {
  float mouseHeight = mouseY - height + (controlHeight*4);
   
  if (mouseHeight >= (controlHeight*3)) {
    if (mouseX >= controlFontSize*6 && mouseX <= width - controlKnobSize) {
       param4 = map(mouseX, controlFontSize*6, width - controlKnobSize, 0, PI);
    }
  }
  else if (mouseHeight >= (controlHeight*2)) {
    if (mouseX >= controlFontSize*6 && mouseX <= width - controlKnobSize) {
       param3 = map(mouseX, controlFontSize*6, width - controlKnobSize, 0, 4);
    }
  }
  else if (mouseHeight >= controlHeight) {
    if (mouseX >= controlFontSize*6 && mouseX <= width - controlKnobSize) {
       param2 = floor(map(mouseX, controlFontSize*6, width - controlKnobSize, 1, 100));
    }
  }
  else if (mouseHeight >= 0) {
    if (mouseX >= controlFontSize*6 && mouseX <= width - controlKnobSize) {
       param1 = floor(map(mouseX, controlFontSize*6, width - controlKnobSize, 0, 100));
    }
  }
  bClear = true;
  controlCol = 255;
}
