
float bolita = 1;
void setup() {
  size(600, 600);
}
void draw() {
  if (bolita<width/2) {
    bolita = bolita+1;
  
  }
  ellipse(bolita, 300, 10, 10);
}

