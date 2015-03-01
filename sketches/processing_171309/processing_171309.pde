
void setup() {
  size(600, 600);
}



void draw() {
  background(255);
  translate(width/2, height/4);
  noStroke();
  fill(#FAB04E);
  rect(-width/2,height/8,width,height);
  stroke(#3BB400);
  strokeWeight(0.5);
  
  road();
  
  for(int i=0; i<226; i++){
    sky(i);
  }
  
  for(int i=0; i<200;i++){
    land(i*2);
  }
  
  for (int i=0; i<4; i++) {
    tree(-150-i*70, 0+i*70, 0.5+ 0.1*i);
    tree(50+i*70, 0+i*70, 0.5+ 0.1*i);
  }


}


void sky(float y){
  noStroke();
  pushMatrix();
  translate(-width/2,y-height/4);
  fill(map(y,0,300,100,200), map(y,0,360,0,255), 0, 50);
  rect(0,0,width, 10);
  popMatrix();
}

void road(){
  
  pushMatrix();
  translate(-width/2 + 290, -height/4 + 226);
  fill(255);
  noStroke();
  beginShape();
  vertex(10, 0);
  vertex(-400, 600);
  vertex(400, 600);
  vertex(30, 0);
  endShape();
  popMatrix();
}

void land(float y) {
  noStroke();
  pushMatrix();
  translate(-width/2,y+height/8);
  fill(map(y,0,300,255,0), map(y,0,360,255,0), map(y,0,300,255,0), 50);
  rect(0,0,width, 10);
  popMatrix();
}


void leaf(float s, float b, float x, float y) {

  fill(HSB, 100, s, b);
  beginShape();
  vertex(x, y);
  bezierVertex(x+50, y-20, x+50, y+50, x-10, y+50);
  bezierVertex(x-10, y+60, x-20, y+10, x, y);
  endShape();
}
void stem(float x, float y) {

  fill(#A56C11, 200);
  rect(x, y, 40, 200);
}


void tree(float startX, float startY, float scaleSz) {
  pushMatrix();
  scale(scaleSz);
  translate(66+startX, -166+startY);
  float mx = map(mouseX, 0, width, 30, 60);
  float my = map(mouseY, 0, height, 60, 100);

  int d = 20;
  stem(-17, +181);
  for (int y = 0; y < 250; y += 20) {
    d += 10;
    for (int a = -y + d; a< y - d; a += 20) {
      leaf(mx, my, a, y);
    }
  }
  popMatrix();
}
