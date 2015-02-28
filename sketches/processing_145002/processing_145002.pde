
//int cantidad= int (random (3,no));
int cont;
int tamano;
int tam;
int angulo;
int cantidad= 20;
int sz;
int contador;
int alpha;
void setup() {
  background(190);
  noCursor();
  background(255);
  size(800, 600);
  smooth();
}
void draw() {
  circulos();
  triangulo();
}
void circulos () {
  int tam=int (random (1, 2));
  fill(200, 0, 80);
  rectMode(CENTER);
  rect(200, height/2, 400, height);
  fill(60, 0, 72);
  rectMode(CENTER);
  rect(600, height/2, 400, height);  
  noStroke();
  fill(255, 255, 255);
  ellipse(random(width), random(height), tam, tam);
  alpha=1255;
  int tamano= int (random(200, 300));
  fill(105, 0, 60, alpha);
  ellipse(200, height/2, contador%tamano, contador%tamano);
  fill(105, 0, 60, alpha);
  ellipse(200, height/2, contador%400, contador%400);
  fill(237, 0, 119, alpha);
  ellipse(200, height/2, contador%300, contador%300);
  fill(156, 0, 214, alpha);
  ellipse(200, height/2, contador%tamano, contador%tamano);
  fill(255, 33, 13, alpha);
  ellipse(200, height/2, contador%100, contador%100);
  fill(160, 0, 112, alpha);
  ellipse(200, height/2, contador%70, contador%70);
  contador++;
  //lineafilm
  strokeWeight(random(5));
  stroke(255, random(10, 60));
  line(random(50, 80), 0, random(50, 60), height);
}
void triangulo () {
  pushMatrix();
  translate(600, height/2);
  rotate(radians(angulo));
  fill(255, random(50, 90));
  triangle(-30, 30, 30, 30, 0, -30); 
  rotate(radians(angulo*0.1));
  triangle(-80, 80, 80, 80, 0, -80); 
  rotate(radians(angulo*0.3));
  triangle(-110, 110, 110, 110, 0, -110);
  rotate(radians(angulo*0.55));
  triangle(-140, 140, 140, 140, 0, -140);
  popMatrix();
  angulo++;
}

