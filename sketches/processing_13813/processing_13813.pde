
void setup(){
  size(300, 300);
  background(0);
}

float i;
float a = 0.0;
void draw() {
   for (int i = 0; i < 80; i = i+50) {
  background(0);
  a = (a + 0.5)%500;
  rect(i, i, a, a);
  fill(255, 255, 255);
}
}

                
                
