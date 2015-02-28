
int num= 20;
float[] bacterias= new float[num];

void setup() {
  size(300, 300);
  smooth();
  colorMode(HSB, 100);
  frameRate(10);



  for (int a=0; a <bacterias.length; a++) { //seeds the bateria
    bacterias[a] = random(width);
  }
}

void draw() {
  background(15, 50, 80);
  fill(15, 15, 100);
  strokeWeight(5);
  ellipse(150, 150, 160, 160);
  for (int a=0; a <bacterias.length;a++) {
    bacteria(100, 100); //creates a boundary for movement
  }
  
  fill(15, 15, 100, 40);
  ellipse(mouseX, mouseY, 160, 160);
}


void bacteria(float x, float y) { //creates the bacteria
  pushMatrix();
  translate(x, y);
  strokeWeight(1);
  fill(40, 100, 50);
  ellipse(random(x), random(y), 20, 20);
  ellipse(random(x), random(y), 10, 10);
  popMatrix();
}


