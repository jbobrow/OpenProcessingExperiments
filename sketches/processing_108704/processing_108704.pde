
// Remix from original code: http://processing.org/examples/softbody.html


// center point
float centerX = 0, centerY = 0;

float radius = 45, rotAngle = -90;
float accelX, accelY;
float springing = .0009, damping = .98;

//corner nodes
int nodes = 9;
float nodeStartX[] = new float[nodes];
float nodeStartY[] = new float[nodes];
float[]nodeX = new float[nodes];
float[]nodeY = new float[nodes];
float[]angle = new float[nodes];
float[]frequency = new float[nodes];
int segmentCount = 360; // Min kode

// soft-body dynamics
float organicConstant = 1;

void setup() {
  size(1200, 700);
  //center shape in window
  centerX = width/2;
  centerY = height/2;
  // iniitalize frequencies for corner nodes
  for (int i=0; i<nodes; i++){
    frequency[i] = random(5, 12);
  }
  noStroke();
  frameRate(30);
}

void draw() {
  //fade background
  fill(0, 100);
  rect(0,0,width,height);
  drawShape();
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
  fill(255);
  float angleStep = 360/segmentCount; //Min kode
  
  beginShape();
  for (int i=0; i<nodes; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  for (int i=0; i<nodes-1; i++){
    curveVertex(nodeX[i], nodeY[i]);
  }
  
  //Min kode
  vertex(width/2, height/2);
  for (float angle=0; angle<=360; angle+=angleStep){
    float vx = width/2 + cos(radians(angle))*radius;
    float vy = height/2 + sin(radians(angle))*radius;
    vertex(vx, vy);
    fill(angle, mouseX, mouseY);
  } 
  //Min kode slut 
 
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
    nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*2);
    nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);
    angle[i]+=frequency[i];
  }
}



