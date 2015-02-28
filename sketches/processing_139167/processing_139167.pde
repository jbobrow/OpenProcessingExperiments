
void setup() {
  //Bruno Costa e Silva
  //05/03/2014
  size(1000, 500);  
  background(255);
  for (int i = 0; i < 1001; i = i+5) {
    line(i, 0, i, 700); //começa com a tela listrada.
    stroke(0);
  }
}

int e=70;
int z=50;

float a;
void draw() {
  fill(0, random(255), random(255), random(255));  
  translate (mouseX, mouseY);
  rotate(radians(a));
  a+=6;
  ellipse(e*noise(z), mouseY*noise(z), e, mouseY);
}


void mousePressed() {
  if (mouseButton == LEFT) { //limpa a tela
    background(255);
  }
}



