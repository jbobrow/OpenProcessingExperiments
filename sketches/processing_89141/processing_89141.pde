
float d;
void setup() {
  size(400, 400);
}
void draw() {
  d+=0.03;
  background(255);
  strokeWeight(10);
  stroke(0);
  fill(0);
  for(int h =0; h<15;h++) {
    line(200, 200, 200+sin(d-((TWO_PI/14)*h))*175, 200 +cos(d-((TWO_PI/14)*h))*175);
    ellipse(200+sin(d-((TWO_PI/14)*h))*(sin(d)*175), 200+cos(d-((TWO_PI/14)*h))*(sin(d)*175), 15, 15);
  }
    for(int h =0; h<15;h++) {
    line(200, 200, 200+sin(d*-1+((TWO_PI/14)*h))*175, 200 +cos(d*-1+((TWO_PI/14)*h))*175);
     ellipse(200+sin(d*-1-((TWO_PI/14)*h))*(sin(d-PI/2)*175), 200+cos(d*-1-((TWO_PI/14)*h))*(sin(d-PI/2)*175), 15, 15);
  }
}
