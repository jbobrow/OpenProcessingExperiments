
float angle = 0.0;
float xpos1 = 0;
float xpos2 = 1000;

void setup() {
  size(1000, 600);
  background(255); 
  noStroke();
}

void draw() {

  frameRate(50);
  float mov1 = random(100, 200);
  float mov2 = random(10, 20);
  float opacity = random(10, 100);
  float valorSeno = sin(angle);
  float r = map(valorSeno, -1, 1, 80, 255);
  float b = map(valorSeno, -1, 1, 150, 255);
  float g = map(valorSeno, -1, 1, 100, 255);
  float gris = map(valorSeno, -1, 1, 200, 255);
  float rotato = random(0.00, 3.14);
  float diam = random(10, 150);
  float x = random(0, 1000);
  float y = random(0, 600);

  // circulos verde
  fill(r, b, b, opacity);
  ellipse(x, y, diam+30, diam+30);
  
  // triangulos
  fill(0, opacity);
  pushMatrix();
  translate(x+mov1, y+mov1);
  rotate(rotato);
  beginShape(TRIANGLES);
  vertex(2, 7);
  vertex(16, 15);
  vertex(3, 30);
  endShape();
  popMatrix();
  
  //circulos azules
  fill(0, 0, b, opacity);
  ellipse(x+mov1, y+mov1, diam, diam);
  
  //cuadrados
  fill(gris);
  pushMatrix();
  rotate(rotato);
  rect(x, y, mov2, mov2);
  popMatrix();
  
  fill(0, 0, b);
  //lineas izq a der
  xpos1 = xpos1 + 5;
  rect(xpos1, y, 2, diam);
  //lineas der a izq
  xpos2 = xpos2 - 10;
  rect(xpos2, y, 2, diam);
  angle += 1;
  }

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();  
}
