
void setup() {
  size(640, 480);
}

void draw() {
  // overall circle
  noFill();
  ellipse(320, 180, 300, 300);
  
  // small top arc
  noFill();
  arc(320, 105, 150, 150, (PI)/2, 3*(PI)/2);
  
  // small bottom arc
  fill(0);
  arc(320, 255, 150, 150, -HALF_PI, HALF_PI);
  
  // bottom big arc
  fill(255);
  arc(320, 180, 300, 300, -HALF_PI, HALF_PI);
  
  // top big arc
  fill(0);
  arc(320, 180, 300, 300, (PI)/2, 3*(PI)/2);
  
  // bottom black circle
  noStroke();
  ellipse(320, 255, 150, 150);
  
  // top white circle
  noStroke();
  fill(255);
  ellipse(320, 105, 150, 150);
  
  // small top black circle
  fill(0);
  ellipse(320, 105, 50, 50);
  
  // small bottom white circle
  fill(255);
  ellipse(320, 255, 50, 50);

}


