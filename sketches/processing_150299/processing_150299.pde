
// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.

// center point

float centerX = 0, centerY = 0;



float radius = 45, rotAngle = -90;

float accelX, accelY;

float springing = .0085, damping = .98;



//corner nodes

int nodes = 5;

float nodeStartX[] = new float[nodes];

float nodeStartY[] = new float[nodes];

float[]nodeX = new float[nodes];

float[]nodeY = new float[nodes];

float[]angle = new float[nodes];

float[]frequency = new float[nodes];



// soft-body dynamics

float organicConstant = 1;



void setup() {

  size(700, 700);

  //center shape in window

  centerX = width/2;

  centerY = height/2;

  // iniitalize frequencies for corner nodes

  for (int i=0; i<nodes; i++){

    frequency[i] = random(5, 12);

  }

  noStroke();

  smooth();

  frameRate(30);

}



void draw() {

  //fade background

  

  drawShape();

  moveShape();

}



void drawShape() {

  //  calculate node  starting locations

  for (int i=0; i<nodes; i++){

    nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;

    nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;

    rotAngle += 300.0/nodes;

  }



  // draw polygon

  curveTightness(organicConstant);

  fill(300, 0, 0);

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

    nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*2);

    nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);

    angle[i]+=frequency[i];
    
  }

}
