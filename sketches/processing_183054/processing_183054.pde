
float ang = 0.0;

void setup() {
size(400, 400, P3D);
}

void draw() {
background(0);
translate(width/2, height/2, -100);
for (int x = 30; x < 120; x +=30) {
  for (int z = 30; z < 120; z +=30) {
    for (int y = 30; y < 120; y += 30) {
      pushMatrix();
      rotateX(radians(ang));
      rotateY(radians(ang));
      rotateZ(radians(ang));
      fill(#83E582, 50);
      translate(x, y, z);
      box(30);
      popMatrix();
    }
  }
}
 ang +=1;
}
