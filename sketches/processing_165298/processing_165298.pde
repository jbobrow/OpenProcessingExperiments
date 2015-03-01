
void setup() {
  size(450, 450);
  smooth();
  stroke(255, 255, 0);
  strokeWeight(17);
  fill(255, 0, 0);
} 
 
void draw() {
  background(2,224,29);
  int dd=55;
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      ellipse(90*i+45,90*j+45,dd,dd);
    }
  }
}
