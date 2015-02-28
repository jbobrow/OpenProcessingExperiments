
//PS5
//Georgina Yeboah
//Chaotic Triangles

Tri [] tris = new Tri [200];
//--------------------------------------------------------------
void setup() {
  size(500, 500);
  smooth();

  for (int i=0; i < tris.length; i++) {
    float x = random(height);
    float y = random(width);

    tris[i] = new Tri (x, y);
  }
}
//---------------------------------------------------------------
void draw() {
  background(64);  
  int numTri = int ( map(mouseX, 0, height, 0, tris.length));
  for (int i = 0; i <numTri; i++) {

    tris[i].display();
  }
}
//---------------------------------------------------------------
class Tri {
  float x;
  float y;
  float c;

  Tri ( float x, float y ) {
    this.x = x;
    this.y = y;
  }

  void display() {
    pushMatrix();
    translate(this.x, this.y);

    c = int(map(c, 26, height, 80, 255));
    fill(mouseX, mouseY, c);

    triangle(0, 0, 50, 50, 60, 80);
    popMatrix();
  }
}
//---------------------------------------------------------------

