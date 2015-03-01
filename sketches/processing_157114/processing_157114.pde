
void setup(){
  size(500, 500);
}

void draw(){
  fill(125, 125, 125, 25);
  rect(0, 0, 500 ,500);
  if(mousePressed){
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 50, 50);
  }
  
}
