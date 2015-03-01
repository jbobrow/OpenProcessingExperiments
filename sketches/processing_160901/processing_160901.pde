
void setup() {
  size(1000, 1000, P3D);
  background(211, 166, 2);
  noStroke();
  smooth();
}

void draw() {
  for (int i = 0; i < width; i += 100){
    for (int j = 0; j < height; j +=100){
      for (int z = 0; z < height; z += 100){
        pushMatrix();
        translate(i, j*2, z);
        lights();
        fill(173, 250, 252);
        sphere(15);   
        popMatrix();   
      }
    }
  }

}



