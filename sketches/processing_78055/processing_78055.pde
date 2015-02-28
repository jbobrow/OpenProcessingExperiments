
void draw (){
  size(1000,1000);
  if (mousePressed) {
    fill(0);
    ellipse(mouseX, mouseY, 2, 2);
  } else {
     noFill();
    noStroke();
  }
  
}
