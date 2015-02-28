
void setup(){
  size(600, 600);
  smooth();
  background (255, 255, 255);
}


void draw(){
  noStroke();
  fill(0, 0, 0, 60);
  if(mousePressed){
    ellipse(mouseX, mouseY, 500, 500);
  }else{
    ellipse(mouseX, mouseY, 5, 5);
  }
}

