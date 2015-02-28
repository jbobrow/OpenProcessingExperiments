
void setup() {
  size(450,450);
  background(000);

  fill(255, 240, 195);
  quad(225, 0, 125, 325, 250, 450, 350, 325);
  stroke(255, 240, 195);
pushMatrix();
  scale(0.1, 0.1);

for (int z = 0; z < 20; z = z+1) {
  pushMatrix();
  for (int i = 0; i < 8; i = i+1) {
    translate(450, 0);  
    quad(225, 0, 125, 325, 250, 450, 350, 325);
  }
  popMatrix();
  
  translate(0, 425);
}
popMatrix();
  quad(225, 0, 125, 325, 250, 450, 350, 325);
  }             
