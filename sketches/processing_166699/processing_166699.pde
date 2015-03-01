
int z;

void setup() {
  size(700, 700, P3D);
  background(255);
}

float m = 0;

void draw() {
  background(255);
  translate(width/2, height/2);
  m = map(mouseX, 0, width, 20,100);

  for (int i = 0; i<m; i++) {
    translate(2*i,2*i,2*i);
    stroke(50,150+i*2,200-5*i,100);
    fill(255);
    sphere(10+1/10);
    rotate(TWO_PI/m*40); 
  }


}


