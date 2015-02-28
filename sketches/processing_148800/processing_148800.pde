
//projecto, lição 1, revisitado

float espessura;

float d;

void setup() {
  size(600, 600);
  background(150);
  smooth();
}

void draw() {
  strokeWeight(0.5);
  stroke(0, 50);
  line(mouseX,mouseY,pmouseX,pmouseY);
}

void mousePressed() {
  
  espessura = random(1,10);
  d = random(5,50);
  

 
  strokeWeight(espessura);
  stroke(0);
  noFill();
  ellipse(mouseX,mouseY,d,d);
}

void keyPressed() {
  background(150);
}


