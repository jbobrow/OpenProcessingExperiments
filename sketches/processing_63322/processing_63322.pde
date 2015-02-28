
void setup() {
  size(800,600);
  colorMode(RGB,250,250,250);
  background(255,249,227);
 
}
void draw(){
  if(mousePressed)
  stroke(mouseX-100,mouseY-100,150,(abs(mouseX+pmouseX)/10));
  triangle(mouseX,mouseY,(pmouseX),(pmouseY+10),mouseX,mouseY);
    strokeWeight(abs(mouseX-pmouseX));
    noStroke();
  
}

  void keyPressed() {
  saveFrame("test.png");
}

