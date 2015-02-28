
int s, m, h;
float valor;
float tono;

void setup() {
  size(400, 400);
  colorMode(HSB, 255);
  smooth();
  noStroke();
  frameRate(6);
  tono=204;
}

void draw() {
  //caratula del reloj
  translate (width/2, height/2);

  valor=random(255);
  fill(valor, 255, 255);
  stroke(valor, 255, 255);
  ellipse(0, 0, 250, 250);
  fill(tono, 204, 204);
  rect(-100, -100, 200, 200);
  fill(tono, 255, 100);
  rect(-100, -100, 200, 200);


  s=second();
  m=minute();
  h=hour();
  if (h>=12) {
    h=h-12;
  }
  println(s);
  // para que rotate, translate, scale seolo afecten a ciertos 
  //objetos, se ponen dentro de: pushMatrix(para inicar una funcion); 
  //y popMatrix(esta matris descarta la funcion y empieza la otra);.
  //segundos
  pushMatrix();
  valor=random(255);
  stroke(valor, 255, 255);
  fill(valor, 255, 255);
  rotate(radians(6*s));
  strokeWeight(1);
  line(0, 0, 0, -120);
  ellipse(0, -90, 5, 5);
  rotate(radians(45));
  fill(tono, 255, 110, 60);
  ellipse(0, 0, 200, 50);
  fill(tono, 250, 120, 60);
  ellipse(0, 0, 50, 200);

  popMatrix();
  //minutos
  pushMatrix();
  rotate(radians(6*m));
  strokeWeight(3);
  line(0, 0, 0, -90);
  ellipse(0, -50, 7, 7);
  popMatrix();
  //horas
  pushMatrix();
  rotate(radians(30*h));
  strokeWeight(6);
  line(0, 0, 0, -105);
  ellipse(0, -40, 10, 10);
  popMatrix();
}
