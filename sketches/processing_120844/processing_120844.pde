
void setup(){
  size(500,500);
  background(255);
}

void draw() {
  noStroke();
  fill(255,15);
  rect(0, 0, width, height); // fades background
  noFill();
  stroke(random(160), random(220), random(120), random(200));
  strokeWeight(random(12,100));
  point(random(width),random(height));/*random(width),random(height));*/
  filter(BLUR);
  stroke(255);
  strokeWeight(152);
}


