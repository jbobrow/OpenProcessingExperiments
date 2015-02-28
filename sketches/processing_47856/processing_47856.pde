
void setup() {
  size(100, 100, P3D);
  rectMode(CENTER);
}

void draw() {
  background(0); 
  translate(width*2/5, height/2);
  rotateY(PI/6);
  for (int i = 0; i < 5; i++) {
    pushMatrix();
    translate(0, 0, i*10);
    rotateZ(frameCount*(i+1)*PI/600);
    fill(255, 51);
    rect(0, 0, width/2, height/2);
    popMatrix();
  }
}

