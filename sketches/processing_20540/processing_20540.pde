
void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  for(int v=0; v <= height; v+=50) {
    for(int h=0; h <= width; h+=50) {
      fill(50,0,0);
      rect(v,h, 50, 50);
    }
  }
}


