
float r=150;
float xp;
float yp;
float xs=2;
float cell=15;

void setup() {
  size(800, 600);
  background(255);

}
void draw() {
  background(255);
  stroke(0,150,255);
  
  for (int i=0; i<=width;i+=cell) {
    for (int j=0; j<=height;j+=cell) {
  PVector m = new PVector(mouseX,mouseY);
  PVector p = new PVector(i,j);
  m.sub(p);
  m.normalize();
  m.mult(15);
strokeWeight(2);
pushMatrix();
translate(i,j);
  line(0,0,m.x,m.y);
  popMatrix();
    }
  }

}



