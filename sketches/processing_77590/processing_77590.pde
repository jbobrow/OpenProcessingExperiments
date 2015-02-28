
float angle = 0.2;
float xpos;

void setup() {
  size(800, 600);
  background(0);
  noStroke();
}
 
void draw() {

  frameRate(20);
  float mov1 = random(5, 250);
  float mov2 = random(5, 20);
  float mov3 = random(2,300);
  float mov4 = random(1,15);
  float mov5 = random(5,200);
  float mov6 = random(10,150);
  float opacity = random(10, 30);
  float valorSeno = sin(angle);
  float valorCoseno = cos(angle);
  float r = map(valorSeno, -1, 1, 120, 255);
  float b = map(valorSeno, -1, 1, 250, 255);
  float g = map(valorSeno, -1, 1, 0, 255);
  float gris = map(valorSeno, -1, 1, 100, 255);
  float rotato = random(0.00, 3.14);
  float diam = random(10, 250);
  float x = random(0, 1000);
  float y = random(0, 600);
  ellipseMode(RADIUS);
  int radius = 40;
  float h = - radius;
  float speed = 0.5;


// circulos 
    fill(r,0, 0, opacity);
  ellipse(x, y, diam/2, diam/2);
  fill(r ,r, b, 80);
  ellipse(x, y, mov4, mov4);
  fill(0,0, b, 45);
  ellipse(x/2.5, y, mov6/1.5, diam/3);
  
    //cuadraditos verdes y amarillos
  fill(0, g, 0, 35);
  rotate(rotato);
  rect(x, y/2, mov1, mov1,25);
  fill(r, g, 0, 65);
  rotate(rotato);
  rect(2*x, y/2, mov5, mov3,55);
  
  //cuadraditos blancos
  fill(gris);
  pushMatrix();
  rotate(rotato);
  rect(x, y, mov2, mov2);
  popMatrix();
 
}

  
void mousePressed() {
  loop();
}
 
void mouseReleased() {
  noLoop(); 
}
