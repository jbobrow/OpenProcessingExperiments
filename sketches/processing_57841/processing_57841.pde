
void setup() {
  size(500,500);
  smooth();
  background(100, 216, 182);
}

void draw() {
  coloredRect();
  
if(mousePressed){
  coloredLines();
  }
}

void coloredRect() {
  stroke(0);
  strokeWeight(.5);
  fill(mouseX,mouseY,70,100);
  rect(mouseX, mouseY, mouseX-30, mouseY-30);
}

void coloredLines(){
  stroke(mouseX, mouseY, 20);
  strokeWeight(2);
  line(mouseX,mouseY,50,50);
}

