
void setup() {
size(1280,1024);
strokeWeight(1);
}
  void draw(){
    background(0);
    stroke(255);
    noFill();
    for (int i = 0; i < 1380; i = i+50) {
      for (int j = 0; j<1124; j = j+50){      
    triangle(i,j, i+50, j+36, i+mouseY, i-j);
      }
  }
}
