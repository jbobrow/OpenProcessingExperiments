
int i=0;

void setup() {
  size(500, 500);
  smooth();
  background(0);

  noFill();

  stroke(255);
}

void draw() {
    background(0);
    float f=frameCount/550.0;

  for (int i=0; i<50; i++) {
    bezier(
    width/2, height, 
    width/2, noise(1,i,f)*height, 
    noise(2,i,f)*height, noise(4,i,f)*height, 
    noise(3,i,f)*width, noise(5,i,f)*height
    );
  }
}

