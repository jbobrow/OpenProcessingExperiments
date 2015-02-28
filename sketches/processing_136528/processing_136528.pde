
float theta;
float diam = 70;
int num = 15;

void setup() {
  size(500, 500);
  background(255);
  noFill();
}


void draw() {
  background(255);
  stroke(0);
  strokeWeight(diam/3);
  float y = height/2;

  for (int i=1; i<num+1; i++) {
    float x = map(sin(theta), -1, 1, 0, width);    
    float sw = map(sin(theta), -1, 1, 3, 7); 
    strokeWeight(diam/sw);
    ellipse(x, y, i*diam, i*diam);
    ellipse(width-x, y, i*diam, i*diam);
  }
  theta += 0.0523/3;
  
  
}
