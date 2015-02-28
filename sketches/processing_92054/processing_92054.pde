
PImage a;
int increment1 = 100;
int increment2 = 55;
void setup() {
  background(255);
  size(800, 600);
  smooth();
  a=loadImage("pattern.png");
}

void draw() {
  for (int i = 0; i<800; i+= increment1) {
    for (int j = 0; j<600; j+= increment2) {
      noStroke();
      image(a,i,j,100,100);
    }
  }
}


