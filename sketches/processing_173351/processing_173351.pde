
int num =10, r = 50;
float xoff = 0.0;
boolean goFar = false;
void setup() {
  size(600, 600);
  noStroke();
}


void draw() {
  background(0,   map(r,10,width/2,150,230),   map(r,10,width/2,200,255));
  num = floor(r/5);
  if (goFar){
   if(r<width/2){
    r+=noise(xoff)*10;
   }
  }
  else {
    if (r>50){
      r-=noise(xoff)*10;
    }
  }
  for (int i=0; i<num; i++) {
    fill(0, random(100, 200), 0, 50);
    float deg = radians(random(0, 360));
    float x =mouseX+r*cos(deg);
    float y =mouseY+r*sin(deg);
    drawLeaf(x, y, deg);
  }
  xoff+=0.1;
}
void mousePressed() {
  goFar=!goFar;
}

void drawLeaf() {

  beginShape();
  vertex(0, 0);
  bezierVertex(20, 10, 15, 60, 0, 65);
  vertex(0, 65);
  bezierVertex(-15, 60, -20, 10, 0, 0);
  endShape();
}

void drawLeaf(float x, float y) {
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(0, 0);
  bezierVertex(20, 10, 15, 60, 0, 65);
  vertex(0, 65);
  bezierVertex(-15, 60, -20, 10, 0, 0);
  endShape();
  popMatrix();
}

void drawLeaf(float x, float y, float d) {
  pushMatrix();
  translate(x, y);
  rotate(d-radians(90)+radians(noise(xoff)*45));
  beginShape();
  vertex(0, 0);
  bezierVertex(20, 10, 15, 60, 0, 65);
  vertex(0, 65);
  bezierVertex(-15, 60, -20, 10, 0, 0);
  endShape();
  popMatrix();
}
