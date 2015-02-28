
void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  fill(0, 50);
  noStroke();
  rect(0, 0, 500, 500);
  
  stroke (255);
  noFill();
  ellipse(250, 0, mouseY, mouseY);
  line(250, mouseY, 250, 500);
}               
