
int steps = 6;

void setup() {
  size(500, 500);
  smooth();
}

void draw(){
 
  background(50);
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  strokeWeight(10);
  
  translate(50, 50);
  rotate( radians(45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(-45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(-45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(-45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
  
  translate(50, 50);
  rotate( radians(45));
  rect(0, 0, 50, 50);
  fill(random(255), random(255), random(255));
}


