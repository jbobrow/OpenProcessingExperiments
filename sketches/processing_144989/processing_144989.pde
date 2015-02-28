
// Konkuk University  

 // Department of Dynamic Media 

 // SOS iDesign  

// Name: LEE hyeri 

 // ID: 201420101  

float h, w, theta;
int num = 20;
 
void setup() {
  size(600, 600);
  ellipseMode(CORNER);
  noStroke();
  fill(random(255),random(255),random(255),random(255));
  background(255);
}
 
void draw() {
  w = 50;
  h = map(cos(theta), -1, 1, w, 200);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    rotate((PI/num)*i-2);
    rectMode(CENTER);
    rect(-w/2, 0, w, h);
    popMatrix();
    
  }
  filter(DILATE);
  theta += 0.0523;
}
