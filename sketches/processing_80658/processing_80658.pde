
void setup() {
size(400,400);
}
void draw() {
  noLoop();
  scale(3);
  for (int a=1;a<20;a++) {
    miron(58+a*2,80+a,150-a*5,1.0);
    miron(59+a*2,75+a,150+a*5,1.0);
  }
}

void miron(int x, int y, int w, float z) {
  smooth();
  noFill();
  scale(z);
  stroke(w);
  strokeWeight(5);
  beginShape();///
  curveVertex(x-55,y-65);
  curveVertex(x-20,y-55);
  curveVertex(x-20,y-35);
  curveVertex(x+10,y-25);
  curveVertex(x,y+15);
  endShape();
  beginShape();///
  vertex(x-40,y-65);
  bezierVertex(x+35,y-70,x+35,y+20,x-10,y+20);
  bezierVertex(x-55,y+20,x-35,y-25,x-10,y-25);
  vertex(x,y);
  bezierVertex(x-10,y+15,x-55,y-70,x-20,y-55);
  endShape();
}

