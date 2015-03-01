
void setup(){
  size(300, 300);
  smooth();
  frameRate(10);
}

void draw(){
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  rect(random(500), random(500), random(500), random(500));  
}
