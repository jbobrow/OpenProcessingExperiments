
void setup() {
  size(600, 600);
  background(0);
}
void draw() {
  for (int i = 255; i > 0 ; i=i-15) {
    fill(i/3, 200, 200);
    float desviacion  = mouseX/100.0;
    ellipse((width/2)+(desviacion*i), height/2, i, i);
    float desviacion  = mouseY/100.0;
    ellipse((width/2)+(desviacion*i), height/2, i, i);
    }
}
