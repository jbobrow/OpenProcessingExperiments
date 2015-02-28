
ArrayList balls;
float[] x = new float[2];
float[] y = new float[2];
float segLength = 50;

void setup() {
  balls = new ArrayList();  
  size(900,425); 
  background(255); 
  strokeWeight(1);
  stroke(0,40); 
  noFill();
  smooth(); 
}

void draw() {
 
}

void mouseDragged() {
  dragSegment(0, mouseX, mouseY);
  dragSegment(1, x[0], y[0]);
  PVector d = new PVector(mouseX, mouseY, 0);
  balls.add(d); 
  for (int i=0; i<balls.size(); i++) { 
        PVector ball = (PVector) balls.get(i);
      float gagga = d.dist(ball)/60;
      if (gagga < random(1)){        
       line(mouseX, mouseY,  ball.x, ball.y);
      }    
  }    
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

