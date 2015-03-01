
void setup() {
  size(300,300);
  background(500);
}
void draw() {
  for (int i = 300; i > 0 ; i=i-10) {
    fill(i/3, 100,0);
    float desviacion  = mouseX/100.0;
  line((width/2)+(desviacion*i), height/2, i, i);
    float desviacion  = mouseY/100.0;
    ellipse ((width/2)+(desviacion*i), height/2, i, i);
    }
}

