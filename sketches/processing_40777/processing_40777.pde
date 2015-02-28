
int dimensioneX=5;
int dimensioneY=5;
void setup(){
  size(400, 400);
  background(255);
  smooth();
}

void draw (){
  noStroke();
  
  if (mousePressed && (mouseButton==LEFT)){
    fill(255);
    stroke(0);
    strokeWeight(0.5);
    ellipse(mouseX, mouseY, 10, 10);
  }
  else if (mousePressed && (mouseButton==RIGHT)) {
    fill(mouseX, mouseY, -mouseY);
    ellipse(mouseX, mouseY, 10, 10);
  }
}
