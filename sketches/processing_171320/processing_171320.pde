
void setup() {
  size(500,400);
  background(0,0,255);
}
 
void draw() {
 
  if(keyPressed) {
    fill(34,267,90);
    stroke(34,267,90);
  } else {
    stroke(189,45,209);
    fill(189,45,209)
  }
   
  if(mousePressed){
    ellipse(mouseX, mouseY, 10, 10);
  }
}

