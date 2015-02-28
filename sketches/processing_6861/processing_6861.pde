
void setup(){
  size(600, 600);
  background(120, 60, 60);
}
void draw(){
  strokeWeight(abs(mouseX-pmouseX));
  stroke(mouseX, mouseY, mouseX-mouseY, 150);
  line(width/2, height/2, mouseX, mouseY);
}
void mousePressed(){
  background(random(100,255), 0, random(100,200));
}

