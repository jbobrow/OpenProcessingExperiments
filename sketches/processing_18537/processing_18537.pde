
void setup () {
size(250,250);
background(255);
frameRate(20);
}
  
void draw() {
 if (keyPressed == true) {
    fill(255);
  } else {
    fill(#239866,20);
  }
  noStroke();
  ellipse (mouseX,mouseY,70,70);
}
                
                
