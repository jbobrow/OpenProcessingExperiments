
float r =0;


void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}
void draw() {
  fill(random(255), random(255), random(255), random(255));
  rotate(r);
  float circle_size = random(5, 15);
  ellipse(100 + r, 10, circle_size, circle_size);
  r = r + .4;
  println(r);
  //rotate(w);
  //float circle_s = random(5, 15);
  //ellipse(100 + w, 10, circle_s, circle_s);
  //w = w + 0.2;
  //println(w);  
}

