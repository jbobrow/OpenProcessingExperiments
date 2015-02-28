
void setup() {
  size(400, 400);
  background(50, 150, 200);//light blue background
}

void draw() { //sets the spacing and order for the pattern of two triangles
  for (int b=20; b<height; b+=40) {
    for (int h=20; h<width; h+=30) {
      twotriangles(h, b);
    }
  }
  noLoop();
}

void twotriangles(float x, float y) {//sets the sizing and properties of the triangles
  pushMatrix(); 
  translate(x, y);
  fill(0, 150);// upper triangle color
  strokeWeight(random(0, 2));// breaks the regular pattern of the triangles
  triangle(0, -8, -12, 0, 12, 0);
  fill(0, 200, 250);// lower triangle color
  triangle(2, 12, -12, 4, 12, 4);
  popMatrix();
}

