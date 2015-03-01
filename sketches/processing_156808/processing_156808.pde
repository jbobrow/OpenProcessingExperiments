
void setup() {
    size(500, 500); 
    colorMode(HSB);
} 

void draw() {
  background(0);
  for(int a = 0; a < mouseY; a = a + 20){
    for(int b = 0; b < mouseX; b = b + 20){
      stroke(255);
      line(250, 250, a, b);
    }
  }
}


