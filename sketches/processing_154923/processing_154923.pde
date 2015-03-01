
void setup(){
  size(500,500);
  background(255,130,40);
 smooth(8);
}

void draw(){
  float r=random(255);
  fill(random(255),random(255),random(255),random(255));
  stroke(random(255),random(255),random(255),random(255));
  strokeWeight(random(255));
  if(mousePressed){
    ellipse(mouseX,mouseY,15,15);
  }
}
