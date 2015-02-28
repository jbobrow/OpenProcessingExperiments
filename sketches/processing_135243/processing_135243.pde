
float om = PI/2;
float theta = 0;
boolean roll = true;
boolean pressed = false;
int ringSize = 150;
int ringWidth = 15;
int frame = 60;
int[][] rPoint;
float[][] gPoint;
float[][] bPoint;

void setup() {
  size(1200, 700);
  rPoint = new int[frame][2];
  gPoint = new float[frame][2];
  bPoint = new float[frame][2];
  for (int i = 0; i <= frame-1; i ++) {
    rPoint[i][0] = 0;
    rPoint[i][1] = 0;
    gPoint[i][0] = 0;
    gPoint[i][1] = 0;
    bPoint[i][0] = 0;
    bPoint[i][1] = 0;
  }
}

void draw() {
  background(0);
  if (mousePressed) {
    if (!pressed)
      roll = !roll; 
    pressed = true;
  }
  else
    pressed = false;
  if (roll) 
    theta += om/60;
  else 
    theta -= om/60;
    
  fill(255);
  noStroke();
  ellipse(mouseX+(ringSize/2)*cos(theta), mouseY+(ringSize/2)*sin(theta), ringSize+ringWidth, ringSize+ringWidth);
  ellipse(mouseX-(ringSize/2)*cos(theta), mouseY-(ringSize/2)*sin(theta), ringSize+ringWidth, ringSize+ringWidth);
  fill(0);
  ellipse(mouseX+(ringSize/2)*cos(theta), mouseY+(ringSize/2)*sin(theta), ringSize-ringWidth, ringSize-ringWidth);
  ellipse(mouseX-(ringSize/2)*cos(theta), mouseY-(ringSize/2)*sin(theta), ringSize-ringWidth, ringSize-ringWidth);
  
  for (int i = 0; i <= frame-2; i ++) {
    rPoint[i][0] = rPoint[i+1][0];
    rPoint[i][1] = rPoint[i+1][1];
    gPoint[i][0] = gPoint[i+1][0];
    gPoint[i][1] = gPoint[i+1][1];
    bPoint[i][0] = bPoint[i+1][0];
    bPoint[i][1] = bPoint[i+1][1];
  }
  rPoint[59][0] = mouseX;
  rPoint[59][1] = mouseY;
  gPoint[59][0] = mouseX+(ringSize/2)*cos(theta);
  gPoint[59][1] = mouseY+(ringSize/2)*sin(theta);
  bPoint[59][0] = mouseX-(ringSize/2)*cos(theta);
  bPoint[59][1] = mouseY-(ringSize/2)*sin(theta);
  
  strokeWeight(10);
  
  for (int i = 0; i <= frame-2; i ++) {
    stroke(255*i/(frame), 0, 0);
    point(rPoint[i][0],rPoint[i][1]);
    stroke(0, 255*i/(frame), 0);
    point(gPoint[i][0],gPoint[i][1]);
    stroke(0, 0, 255*i/(frame));
    point(bPoint[i][0],bPoint[i][1]);
  }
  stroke(0, 255, 0);
  point(mouseX+(ringSize/2)*cos(theta), mouseY+(ringSize/2)*sin(theta));
  stroke(0, 0, 255);
  point(mouseX-(ringSize/2)*cos(theta), mouseY-(ringSize/2)*sin(theta));
}

