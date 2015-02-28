
/**
* the Hidden Golden Ratio (HGR).<br />
* Written in Processing by 0p0.<br />
*/

float rot = 0;
float radius;
float rSize = 0;
float rSizeCounter = 1;
float internalRot = 0;
float internalRotCounter = 1.618;

void setup() {
  size(600,400);
  frameRate(30);
  smooth();
  radius = (width/1.618)/(2*1.618);
}

void draw() {
  //background(50);
  noStroke();
  rectMode(CENTER);
  fill(0,10);
  rect(width/2,height/2,width,height);
  rectMode(CENTER);
  noFill();
  stroke(255,100,rSize/3);
  strokeWeight(0.1);
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(internalRot));
  while (rot < 180) {
    rotate(radians(rot));
    pushMatrix();
    translate(radius,radius);
    rotate(radians(internalRot));
    rect(0,0,rSize,rSize);
    popMatrix();
    rot += 52;
  }
  popMatrix();
  internalRot += internalRotCounter;
  rSize += rSizeCounter;
  rot = 0;
  if (rSize > (width/1.618) || rSize < -(width/1.618)) {
    rSizeCounter *= -1;
  }
}


void mousePressed() {
  if (mousePressed) {
    noLoop();
  }
}

void mouseReleased() {
  loop();
}




