
size(800, 600, P3D);
background(random(255),random(255),random(255));
rotate(PI/16);
translate(width/2, height/2, -50);
for (int x = 0; x < 200; x+=70) {
  for (int y = 0; y < 200; y+=70) {
    for (int z = 0; z < 200; z+=70) {
      pushMatrix();
      translate(x, y, z);
      fill(random(255),random(255),random(255));
      box(70,70, 70);
      popMatrix();
    }
  }
}


