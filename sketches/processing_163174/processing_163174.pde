
float ang1 = 0;
float ang2 = 0;

void setup() {
  size(400, 400, P3D);
 
}
void draw() {
  background(0);
  translate(width/2, height/2);
    rotateX(radians(150+ang1));
    for (int x = -80; x < 50; x+=5) {
    for (int y = -80; y < 50; y+=5) {
      rotateY(radians(ang2));
      stroke(255, 0, 255);
      point(x, y);
      pushMatrix();
      rotateZ(radians(1));
      stroke(0, 255, 255);
      point(x, y);
      popMatrix();
      ang2 += 0.0001;
    }
  }
  ang1 += 1;
}

