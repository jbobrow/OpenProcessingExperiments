
void setup() {
  size (600,600,P3D);
}
 
void draw() {
  background(0);
  lights();
  noStroke();
  int boxnum = 12;
  int spacing = height / (boxnum);
  int boxsize = height / (boxnum + 2);
  for (int i = 0 ; i < boxnum ; i ++) {
    for (int j = 0 ; j < boxnum ; j++) {
      pushMatrix();
      translate(spacing * i + spacing / 2,spacing * j + spacing / 2);
      rotateY(-float(height)/mouseX * PI);
      rotateX(float(width)/mouseY * PI);
      fill(256*float(mouseX)/width,256-256*float(mouseX)/width,256/12*i);
      box(boxsize);
      popMatrix();
    }
  }
}

