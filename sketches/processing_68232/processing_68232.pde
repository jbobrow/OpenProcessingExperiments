
//Genera una espiral a velocidad y ángulos aleatorios
//El color depende del ángulo
float r = 0;
float theta = 0;
float colorz = 0;
float varrandom = random(1);
void setup() {
  size(500,500);
  colorMode(HSB);
  background(255);
  smooth();
}
void draw() {

  float x = r * cos(theta);
  float y = r * sin(theta);

  noStroke();
  fill(colorz,150,170);
  ellipse(x+width/2, y+height/2, 16, 16); 

  theta=theta+varrandom;
  r=r+varrandom;
  colorz=(theta*100)%255;
}

