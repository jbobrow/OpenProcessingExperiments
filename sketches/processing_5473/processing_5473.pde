
// center point
float centerX = 0, centerY = 0;

float radius = 25, rotAngle = -90;
float accelX, accelY;
float springing = .001, damping = .98;

//corner nodes
int nodes = 4;
float nodeStartX[] = new float[nodes];
float nodeStartY[] = new float[nodes];
float[]nodeX = new float[nodes];
float[]nodeY = new float[nodes];
float[]angle = new float[nodes];
float[]frequency = new float[nodes];

// soft-body dynamics
float organicConstant = -2;

void setup() {
  size(600,600);
  //center shape in window
  centerX = width/2;
  centerY = height/2;
  // iniitalize frequencies for corner nodes
  for (int i=0; i<nodes; i++){
    frequency[i] = random(8);
  }
  noStroke();
  smooth();
  frameRate(20);
  background(0);
}

void draw() {
  
  if(mousePressed) {
    fill(10, 10);
    rect(0,0,width,height);
    clickShape();
  }
  else {
     //fade background
  fill(245, 5);
  rect(0,0,width, height);
  drawShape();
  }
  moveShape();
  
  
}


void drawShape() {
  //  calculate node  starting locations
  for (int i=0; i<nodes; i++){
    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
    nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
    rotAngle += 360.0/nodes;
  }

  // draw polygon
  curveTightness(organicConstant);

  fill(50, 60);
  stroke(200);
  beginShape();
  for (int i=0; i<nodes; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  for (int i=0; i<nodes-1; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  endShape(CLOSE);
}

void clickShape() {
  //  calculate node  starting locations
  for (int i=0; i<nodes; i++){
    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
    nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
    rotAngle += 360.0/nodes;
  }

  // draw polygon
  curveTightness(organicConstant);

  fill(250, 40);
  stroke(20);
  beginShape();
  for (int i=0; i<nodes; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  for (int i=0; i<nodes-1; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  endShape(CLOSE);

}

void moveShape() {
  //move center point
  float deltaX = mouseX-centerX;
  float deltaY = mouseY-centerY;

  // create springing effect
  deltaX *= springing;
  deltaY *= springing;
  accelX += deltaX;
  accelY += deltaY;

  // move predator's center
  centerX += accelX;
  centerY += accelY;

  // slow down springing
  accelX *= damping;
  accelY *= damping;

  // change curve tightness
  organicConstant = 1-((abs(accelX)+abs(accelY))*.1);

  //move nodes
  for (int i=0; i<nodes; i++){
    nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*3);
    nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*3);
    angle[i]+=frequency[i];
  }
}


