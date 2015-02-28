
void setup(){
  size(650,130);
  fill(0);
  frameRate(20);
}

void draw(){
  background(255);
  stroke(3);
  fill(0);
  if(mouseX>325){
    noStroke();
    fill(random(230), random(230), random(230));
    rect(0,0,650,130);
    noCursor();
  }
}
