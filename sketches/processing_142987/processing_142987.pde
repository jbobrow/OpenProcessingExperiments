
// multiple robots with functions

void setup() {
  size(800,600);
}

void draw() {
  background(237,247,157);
  for (int c = 0; c <= 800; c += 100) {
    for (int d = 0; d <= 600; d += 100) {
      robot(c,d);
    }
  }
}

void robot(int x, int y) {
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  
  float mx = mouseX;
  float my = mouseY;
  
  float sx = map(mx,0,800,0,200);
  float sy = map(my,0,600,0,200);
  
  for (int a = 0; a <= 30; a += 5) {
    for (int b = 0; b <= 30; b += 5) {
      stroke(0);
      strokeWeight(1);
      noFill();
      rect(30,70,a,a/2);
      rect(70,70,a,a/2);
      rect(50,50,a*2,b);
      
      strokeWeight(1);
      stroke(sx,sy,sx);
      ellipse(40,40,a/2,b/2);
      ellipse(60,40,a/2,b/2);
      
      fill(255);
      noStroke();
      ellipse(40,40,10,10);
      ellipse(60,40,10,10);
      fill(0);
      ellipse(40,40,5,5);
      ellipse(60,40,5,5);
      
      noFill();
      stroke(0);
      bezier(20,40,50,50,sx,sy,sx,sy);
      bezier(80,40,50,50,sy,sx,sy,sx);
      
      noStroke();
      fill(0);
      rect(sx,sy,10,5);
      rect(sy,sx,10,5);
    }
  }
  popMatrix();
}


