
void setup() {
  size(400, 200);
  smooth();
}

void draw() {
  for(int y = 0; y <= height; y = y + 40){
    for(int x = 0; x <= width; x = x + 40) {
      for(int z = 10; z <= height; z = z + 40) {
        for(int a = 10; a <= width; a = a + 40) {
      fill(133, 49, 219);
      ellipse(x, y, 30, 30);
      fill(33, 14, 29);
      rect(x, y, 50, 50);
      fill(252, 243, 48);
      ellipse(x, y, 10, 10);
      fill(80, 126, 247);
      rect(x, z, 5, 5);
    }
  }
}
  }
   if(pmouseX > 0 && mousePressed) {
     fill(255);
     noStroke();
  rect(pmouseX, pmouseY, mouseX, mouseY);
} 
}
