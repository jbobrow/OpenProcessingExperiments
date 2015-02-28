
// FINAL PROJECT
// division version 1

void setup() {
  size(900,600);
}

void draw() {
  background(255);
  
  float w = width;
  float w1 = width/3;
  float w2 = width*2/3;
  float h = height;
  float h1 = height/3;
  float h2 = height*2/3;
  
  stroke(0);
  noFill();
  line(w1,0,w1,h2);
  line(w2,0,w2,h2);
  line(0,h2,w,h2);
  
  // functions
  
  Grid(0,0);
  Grid(w1,0);
  Grid(w2,0);
  
  Variable1(0,0);
  Variable2(w1,0);
  Dividend(w2,0);
  
}

void Grid(float x, float y) {
  pushMatrix();
  translate(x,y);
  for (int a = 25; a < width/3; a += 25) {
    for (int b = 25; b <= height*2/3; b += 25) {
      point(a,b);
    }
  }
  popMatrix();
}

void Variable1(float x, float y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(255,0,255);
  for (int v11 = 25; v11 < width/3; v11 += 25) {
    for (int v12 = 25; v12 <= 100; v12 += 25) {
      ellipse(v11,v12,10,10);
    }
  }
  popMatrix();
}

void Variable2(float x, float y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(0,0,255);
  for (int v21 = 25; v21 < width/3; v21 += 25) {
    for (int v22 = 25; v22 <= 25; v22 += 25) {
      ellipse(v21,v22,10,10);
    }
  }
  popMatrix();
}

void Dividend(float x, float y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(255,0,0);
  for (int v21 = 25; v21 <= 25; v21 += 25) {
    for (int v22 = 25; v22 <= 100; v22 += 25) {
      ellipse(v21,v22,10,10);
    }
  }
  popMatrix();
}


