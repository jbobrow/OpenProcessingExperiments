
int step, cols, frames=120;
float theta;

void setup() {
  size(600, 400);
  cols = 20;
  step = int(width/cols);
}

void draw() {
  background(20);
  noStroke();
  fill(#FFD900);
  float px = width/2 + cos(theta)*width/3 ;
  float py = height/2+sin(theta*2)*height/3;  
  //ellipse(px, py, 20, 20);
  for (int x = step/2; x<width; x+=step) {
    for (int y = step/2; y<height; y+=step) {
      float dx = px-x;
      float dy = py-y;
      float r = atan2(dy, dx);
      pushMatrix();
      translate(x, y);
      rotate(r);
      float d = step;
      float p = radians(20); 
      arc(step/2, 0, d, d, PI-p, PI+p);
      popMatrix();
    }
  }
  theta += TWO_PI/frames;
}
