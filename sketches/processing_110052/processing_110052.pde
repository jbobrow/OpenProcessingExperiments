
void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  
  
  for (int i = 0;i < width;i+=20) {
    float rainbow = map(i, 0, width, 200, 360);
    stroke(rainbow, 100, 100, 100);
    for (int j = 0; j < height;j+=20) {
      if (mouseX > i && mouseX < i +20 && mouseY > j && mouseY < j+20 && mousePressed) {
       
        fill(rainbow, 100, 70, 80);
      } 
      else {
        noFill();
      }
       
       rect(i, j, 20, 20);
    
    }
  }
}
