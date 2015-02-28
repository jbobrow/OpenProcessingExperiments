
void setup(){
  size(600, 600);
  smooth();
  noStroke();
  
}

void draw(){
  
  if(mousePressed == true){
    ellipse(mouseX-10, mouseY-10, 10, 10);
    ellipse(mouseX, mouseY, 10, 10);
    ellipse(mouseX+10, mouseY+10, 10, 10);
    fill(RGB, mouseX*.5, mouseX*.5, mouseX*.5);
  }
}

