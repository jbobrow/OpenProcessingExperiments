
float r_noise = noise(random(10));

void setup() {
  size(200, 200);
  // noLoop();
}

void draw() {
  translate(width/2, height/2);
  background(255);
  //point(0, 0);
  int count = 36;
  
  beginShape();
  for (int i = 0; i < count; i++) {
    float r = 50.0 + 10.0*noise(r_noise);
    float x = r*cos(TWO_PI/count*i);
    float y = r*sin(TWO_PI/count*i);
    vertex(x, y);
    r_noise+=0.1;
  }
  endShape(CLOSE);
}
