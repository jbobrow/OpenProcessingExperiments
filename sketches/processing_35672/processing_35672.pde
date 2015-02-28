
void setup() {
size(300,300);
background(7,67,255);
colorMode(HSB,765);
smooth();

}

int x = 20;
void mousePressed() {
  fill(mouseX,mouseY,width);
  

}
void draw() {
  stroke(0,100,0,100);
  strokeWeight(5);
  rect(mouseX,mouseY,40,40);
  ellipse(mouseX,mouseY,19,19);
  fill(mouseX/2,mouseY/2,17,200);
  rect(mouseY,mouseX,40,40);
  
}


