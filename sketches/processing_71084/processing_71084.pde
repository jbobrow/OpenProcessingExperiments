
void setup() {
  size(900,800);
  background(0);
}




void mousePressed() {
  stroke(mouseX,mouseY,60,60);
  strokeWeight(0.8);
  fill(255);
  ellipse (mouseX,mouseY,40,40);
}
void draw() {
  stroke(30);
  strokeWeight(0.3);
fill(mouseX,mouseY,150,120);
ellipse(mouseX,mouseY,-30,+30);


  stroke(0);
  strokeWeight(0);
fill(mouseX,mouseY,180,100);
rect (mouseX,55,mouseY,-230);


  stroke(0);
  strokeWeight(0);
fill(180,100,mouseX,mouseY);
rect (mouseX,655,mouseY,123);




}








