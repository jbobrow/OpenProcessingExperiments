
int mida = 100;
 
void setup()
{
  size(600, 450);
  background(30);
 
  smooth();
  noCursor();
  colorMode(HSB, 360, 100, 100);
 
  frameRate(30);
}
 
void draw() {
  noStroke();
  colorMode(RGB,255);
  fill(0,8);
  rect(3,3,width,height);

  colorMode(HSB, 360, 100, 100);
 
  translate(mouseX, mouseY);
 
  if (mousePressed) {
    //dibuixRodona();
  }
  else {
    int p = int(random(2));
    dibuixEstrella(p);
  }
}
 
void dibuixRodona() {
  noStroke();
  //fill(250, 10);
 // ellipse(2, 0, mida, mida);
}
 
void dibuixEstrella(int puntes) {
  stroke(map(mouseX, 0, width, 0, 360), 150, 150);
  for (int i = 0; i<puntes; i++) {
    rotate(PI*mouseY/height );
  rect(50, 50, random(5,50), 10);
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

