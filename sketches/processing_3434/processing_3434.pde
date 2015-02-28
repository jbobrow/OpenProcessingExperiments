
void setup() {
  size(400,400);
  background(0);
  noStroke();
  colorMode(HSB,1);
}

void draw() {
  fill(pow(random(1),4),1,pow(random(1),2));
  ellipse(random(width),random(height),2,2);
  filter(BLUR);
  filter(DILATE); // also interesting if you reverse the filters...
}



