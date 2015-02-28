
void setup() {
  size(700, 450);
  background(0);
  smooth();
  frameRate(10);
}

void draw() {
  for (int i = 10; i <= 700; i = i+5) {
    ellipse(50+i, height/2, i, i);
    ellipse(650-i, height/2, -i, -i);
  }
  for (int i = 10; i <= 300; i = i+5) {
    ellipse(50+i, height/2, i, i);
    ellipse(650-i, height/2, -i, -i);
  }
  
   }
   


  // for(int j = 10; j <= width; j = j/2){
  // ellipse
