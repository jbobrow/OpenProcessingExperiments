

void setup() {
  size(255,255);
  smooth();
  frameRate(10);
  noStroke();
}
void draw() {
  background(255);
  drawCircle(mouseX,mouseY,random(25),color(mouseX, mouseY,0));
}
void drawCircle(int circX,int circY,float diameter,color c){  
  fill(c);
  ellipse(circX,circY,diameter,diameter);  
}

