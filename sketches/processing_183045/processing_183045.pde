
float q=0;
float w=0;
float e=0;


void setup() {
  size(800, 600, P3D);
}
void draw() {

  background(0);
  translate(width/2, height/2, -500);
  for (int x=0; x<150; x+=60) {
    for (int y=0; y<150; y+=60) {
      for (int z=0; z<150; z+=60) {
        pushMatrix();

        rotateX(radians(q));
        rotateY(radians(w));
        q=mouseX;
        w=mouseY;
        translate(x, y, z);
        box(50);
        popMatrix();
      }
    }
  }
}
