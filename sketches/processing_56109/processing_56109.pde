
int mida = 100;

void setup()
{
  size(600, 450);
  background(0);

  smooth();
  noCursor();
  colorMode(HSB, 360, 100, 100);

  frameRate(30);
}

void draw() {

  translate(mouseX, mouseY);

  if (mousePressed) {
    dibuixRodona();
  }
  else {
    int p = int(random(10));
    dibuixEstrella(p);
  }
}

void dibuixRodona() {
  noStroke();
  fill(255, 10);
  ellipse(0, 0, mida, mida);
}

void dibuixEstrella(int puntes) {
  stroke(map(mouseX, 0, width, 0, 360), 100, 100);
  for (int i = 0; i<puntes; i++) {
    rotate(PI*mouseY/height );
    line(0, 0, random(20,100), 0);
  }
}  

void keyPressed() {
  switch(key) {
  case '+':
    mida++;
    break;
  case '-':
    mida--;
    break;
  case ' ':
    background(0);
    break;
  }
}

