
size(800, 600, P3D);
translate(0, height/2, -500);


for (int x = 0; x<300; x+=100) {
  for ( int z = 0; z< 300; z += 100) {
    for (int y = 0; x<300; y+=100) {
      pushMatrix();
      translate(x, y, z);
      float h = 100;
      box(100, -h/2, 10);
      popMatrix();
    }
  }
}


