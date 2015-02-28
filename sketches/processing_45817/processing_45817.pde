
int val = 0;

void setup() {
  size(800, 600);
  background(0);
  smooth();
}


void draw() {

  noFill();
  
  stroke(random(255), random(255), random(255), 10);
  
  if (keyPressed == true){
   fill(255,255,255,2); 
  }

  beginShape();
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  vertex (random(width), random(height));
  endShape();
}



