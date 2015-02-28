
void setup() {
  size(800, 400); 
  frameRate(5);
  smooth();
}

int maxTriangles = random(10, 20);
int triangles = 0;

void draw() {
  //solo dibuja una cantidad limitada
  if(triangles > maxTriangles){
      return; 
  }
  triangles++;
  
  stroke(random(255), random(255), random(255), 22);
  fill(random(255), random(255), random(255), 50);

  beginShape(TRIANGLES);
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  endShape();
}

void mouseClicked() {
    maxTriangles = random(25);
    triangles = 0;
    clear();
}
