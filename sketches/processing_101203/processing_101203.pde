
void setup() {
  size(1000, 500);
}
void draw() {
  if(!mousePressed){
  noStroke();
  if (mouseX<width/2) {
    float  x = map(mouseX, 0, width/2, 0, 255);
    fill(x);
    ellipse(mouseX, mouseY, mouseX/2, mouseX/2);
  } 
  else if (mouseX>width/2) {
    float  x1 = map(mouseX, width/2, width, 255, 0);
    fill(x1);
    ellipse(mouseX, mouseY, (width-mouseX)/2, (width-mouseX)/2);
  }
}
  else if (mousePressed) {
    fill(0);
    if (mouseX<width/2) {
   ellipse(mouseX, mouseY, mouseX/20, mouseX/20); 
    }
     else if (mouseX>width/2) {
     ellipse(mouseX, mouseY, (width-mouseX)/20, (width-mouseX)/20); 
     }
  }
}





