
/*color [] cores;

void setup() {
  size(700, 500);
  colorMode(HSB);
  cores = new color [36];
  for (int i=0; i<36; i++) {
  color [i] = color (i*255/36,255,255);
  }
  background(255);
  smooth();
}
float spin = 0;
void draw()
{
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(spin);
  noStroke();
  fill(cores[floor(spin)%36]);
  ellipse(50, 50, 10, 10);
  ellipse(30, 30, 5, 5);
 
  fill(-mouseX, 255, -mouseY, random(100));
  ellipse(20, 20, 5, 5);
 
  spin+=.5; 
  popMatrix();
}

*/


//Professor, acima está o código que você sugeriu mas não rodou


void setup() {
  size(700, 500);
  background(255);
  smooth();
}
float spin = 0;
void draw()
{
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(spin);
  noStroke();
  fill(mouseY, mouseX, 255, random(100));
  ellipse(50, 50, 10, 10);
  ellipse(30, 30, 5, 5);

  fill(-mouseX, 255, -mouseY, random(100));
  ellipse(20, 20, 5, 5);

  spin+=.5;  
  popMatrix();
}



