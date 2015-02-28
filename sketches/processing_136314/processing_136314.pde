
float theta;
float diam = 50;
int num = 10;

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  noFill();
}


void draw() {
  background(255);
  strokeWeight(diam/2.5);
  float y = height/2;

  for (int i=1; i<num+1; i++) {
    float x = map(sin(theta), -1, 1, 0, width);    
    ellipse(x, y, i*diam, i*diam);
    ellipse(width-x, y, i*diam, i*diam);
  }
  theta += 0.0523/2;
  
  //if (frameCount%4==0 && frameCount<121) saveFrame("image-###.gif");
  
  
}

