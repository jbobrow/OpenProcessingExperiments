
size(600, 600, P3D);
translate(0, height/2, -500);
rotateX(PI/4);
rotateY(PI/4);

for (int x = 0; x<300; x+=100) {
  for ( int z = 0; z< 300; z += 100) {
    for (int y = 0; y<300; y+=100) {
      pushMatrix();
      translate(x, y, z);
      box(100);
      popMatrix();
    }
  }
}

