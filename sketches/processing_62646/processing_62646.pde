
int farbe = 0;

void setup() {
  size(300, 300);
}

void draw() {
background(255);
  for (int i = 0; i < mouseX; i = i + 100) {

    for (int j = 0; j < mouseY; j = j + 100) {

      fill(farbe);
      rect(i, j, 100, 100);
      farbe = farbe + 25;
    }
    
  }
  
  farbe = 0;
}
