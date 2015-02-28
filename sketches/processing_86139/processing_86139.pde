
void setup() {
  size(512, 512, P3D);
  background(128, 128, 128);
  //rotateZ(radians(30));
  rotateX(radians(90));
  //rotateY(radians(30));
  rotate(24);
  translate(0,-96,-384);
  rect(0, 0, 512, 512);
  triangles( 4, 256, 256, sqrt(2*512*512/3), 512);
  noStroke();
  smooth();
}



void triangles(int it, float xpos, float ypos, float zpos, float tri) {
  if (it>1) {

    triangles(it-1, xpos, ypos, zpos, tri/2);
    triangles(it-1, xpos, ypos-tri*sqrt(3)/6, zpos-sqrt(2*tri*tri/12), tri/2);
    triangles(it-1, xpos+tri/4, ypos+tri*sqrt(3)/12, zpos-sqrt(2*tri*tri/12), tri/2);
    triangles(it-1, xpos-tri/4, ypos+tri*sqrt(3)/12, zpos-sqrt(2*tri*tri/12), tri/2);
  }
  else {
    fill(64, 64, 64);
    translate(xpos, ypos, zpos);
    beginShape();
    vertex(0, 0, 0);
    vertex(0, -tri*sqrt(3)/3, -sqrt(2*tri*tri/3));
    vertex(tri/2, tri*sqrt(3)/6, -sqrt(2*tri*tri/3));
    endShape();

    beginShape();
    vertex(0, 0, 0);
    vertex(0, -tri*sqrt(3)/3, -sqrt(2*tri*tri/3));
    vertex(-tri/2, tri*sqrt(3)/6, -sqrt(2*tri*tri/3));
    endShape();

    beginShape();
    vertex(0, 0, 0);
    vertex(tri/2, tri*sqrt(3)/6, -sqrt(2*tri*tri/3));
    vertex(-tri/2, tri*sqrt(3)/6, -sqrt(2*tri*tri/3));
    endShape();
    translate(-xpos, -ypos, -zpos);
  }
}



