
void setup(){
  size(600,600);
  background(255);
}

void draw(){
  //noStroke();
  noFill();
  strokeWeight(4);
  ellipseMode(CENTER);
  
}

void mouseClicked(){
  for(int i = 0; i < 10; i++){
    stroke( random(255), random(255), random(255), random(255)); 
    ellipse(mouseX,mouseY,20 * i,20 * i);
  }
}
