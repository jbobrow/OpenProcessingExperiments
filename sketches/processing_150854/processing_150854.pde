
float P;
float xoff;

void setup() {

  size(600, 600, P3D);


}
void draw() {
  background(#eeeeee);
  lights();
  for (int i = 30; i < width; i+=500) {
  for (int j = 30; j < width; j+=500) {
    pushMatrix();
    translate(i, j, -400);
    rotateX(radians(mouseX));
    stroke(2);
    fill(#D5C2EE);
    rotateY(radians(mouseY));
    box(60);
    popMatrix();

  
  }
  }
}

