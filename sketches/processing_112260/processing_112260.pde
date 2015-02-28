
void setup() {
  size (500, 500);
  smooth();
}

void draw() {
  background(0);

  for (int i = 0; i < 60; i++) {
    for (int j = 0; j < 60; j++) {
      line(i *10, j* 10, 10, 10);
    stroke(255);
    }
  } 
}


