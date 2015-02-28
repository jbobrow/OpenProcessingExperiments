
//
// by Jeffrey Melton, jmelton@nofi.org
// visit http://www.nofi.org/ for more info

void setup() {
  size(800, 500); // 
  smooth(); //turns on anti-aliasing
  frameRate(24);
  background(255);
  noFill();
  stroke(0,192);
} 
 
void draw() {
  for(int i=0; i<250; i=i+1) {
      randDiagonal();
  }
//    saveFrame("diagonal_lines-####.tif");
} 


void randDiagonal() {
  strokeWeight(random(50));
  float d1 = random(200);
  if(d1 < 20) {  //yellow
    stroke(255,255,0,192); 
  }
  if(d1 < 10) { // red
    stroke(255,0,0,192); 
  }
  if(d1 < 5) {  // blue
    stroke(0,0,255,192);
    strokeWeight(100); 
  }
  if(d1 < 1) {  // green
    stroke(0,255,0,192);
  }
  float r1 = random(width+10);
  float r2 = random(height+10);
  float r3 = random(250);
  line(r1,r2,r1-r3,r2-r3);
  stroke(0,192);
}
void keyPressed() {
  noLoop();
}

void mousePressed() {
  background(255);
}

