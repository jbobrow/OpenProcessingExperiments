
float controlX, controlY, boxWidth;
float trunkLen, maxTrunkLen; 
float angle = 3*PI/2, angleDiff = PI/4;
int iterations = 11; //depth of tree
PVector treeRoot;
float trunkWidth = 8; //width of starting trunk
float childRatio = .65; //length of child branches compared to parent

void setup() {
  size(500,600);
  smooth();
  frameRate(20);
  controlX = .18*width;
  controlY = .85*height;
  boxWidth = width/4.8;
  trunkLen = width/5;
  maxTrunkLen = trunkLen * 2;
  treeRoot = new PVector(.5*width, .7*height);
}

void draw() {
  background(255);
  
  //render the tree fractal
  drawTree(treeRoot, trunkLen, angle, iterations); 
  
  fill(0);
  text("Move the mouse through the box at lower left to control the fractal's parameters.",10,20);
    
  //control area
  fill(255); strokeWeight(2); stroke(0);
  rect(controlX - boxWidth/2, controlY - boxWidth/2, boxWidth, boxWidth);  
  if ( mouseInControlBox() ) {
    
    //draw line to mouse pointer
    strokeWeight(1); stroke(0,150,0);
    line(controlX, controlY, mouseX, mouseY);
    
    //adjust trunk length and branching angle based on mouse position in control box    
    float maxDist = boxWidth / 2;
    float curDist = sqrt( (controlX-mouseX)*(controlX-mouseX) + 
                          (controlY-mouseY)*(controlY-mouseY) );
    if ( curDist > boxWidth/2 ) curDist = boxWidth/2;
    trunkLen = maxTrunkLen * curDist/maxDist;
    angleDiff = atan((float)(mouseY-controlY)/(mouseX-controlX));
    if ( angleDiff < 0 ) angleDiff += PI;
    
    
    
  }   
  fill(255,0,0); strokeWeight(2); stroke(0);
  ellipse(controlX, controlY, 10, 10);
  //end control area
  
    
}

void drawTree(PVector root, float len, float angle, int count) {
  
  if ( count == 0 ) return;
  
  stroke(150);
  strokeWeight( (float)count/iterations * trunkWidth );
  float endX = len * cos(angle);
  float endY = len * sin(angle);
  PVector endPt = new PVector(root.x + endX, root.y + endY); 
  line(root.x, root.y, endPt.x, endPt.y);
  
  drawTree(endPt, childRatio*len, angle - angleDiff, count - 1);
  drawTree(endPt, childRatio*len, angle + angleDiff, count - 1);
  
}


boolean mouseInControlBox() {
  return mouseX >= controlX - boxWidth/2 && mouseX <= controlX + boxWidth/2 &&
    mouseY >= controlY - boxWidth/2 && mouseY <= controlY + boxWidth/2;
}


