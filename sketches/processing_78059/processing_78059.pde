
void draw (){
  size(500,500);
  if (mousePressed) {
    fill(0);
    ellipse(mouseX, mouseY, 2, 2);
  } else {
     noFill();
    noStroke();
  }
  
}
