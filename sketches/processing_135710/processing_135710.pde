
float x;
void setup() {
  size(400, 400, P3D);
  background(0);
}
void draw() {
  if (mousePressed) {
    x=x+0.3;
    stroke(0, 255, 0);
    fill(random(255), 0, 0);
    frameRate(10);
    translate(mouseX, mouseY);
    rotateX(20);
    rotateY(10+x);
    box(40);
  }
  if (keyPressed) {
    if (key == 'n' || key == 'N') 
      background(0);  
    return;
  }
}



