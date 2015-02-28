
// This sketch draws on the mouse and mouseX inverse when a mouse
// button is clicked. This is acheived using the map function.

void setup() {
  size(480,480);
  background(255);
  noStroke();
  fill(0);
}

void draw() {
  // float rx is the inverse of mouseX achieved through map func.
  float rx = map(mouseX,0,width,width,0);
  
  // By pressing r, g, b, or k, the user can change the color of
  // the ellipse to create a unique design.
  if(keyPressed){
    if(key == 'r' || key == 'R'){
      fill(255,0,0);
    }
    if(key == 'g' || key == 'G'){
      fill(0,255,0);
    }
    if(key == 'b' || key == 'B'){
      fill(0,0,255);
    }
    if(key == 'k' || key == 'K'){
      fill(0);
    }
  }
  if(mousePressed) {
    ellipse(rx,mouseY,30,30);
    ellipse(mouseX,mouseY,30,30);
  }

}
  


