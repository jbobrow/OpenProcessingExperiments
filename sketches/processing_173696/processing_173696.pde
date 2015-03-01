
int horas;
int minutos;
int segundos;
 
void setup() {
  size(500, 500);
  //colorMode(HSB, 360, 100, 100);
  //background(0);
  rotate(radians(90));
  smooth();
  noFill();
  frameRate(60);
}
 
void draw() {
  horas = hour();
  minutos = minute();
  segundos = second();
 
 
  if (horas > 12) {
    horas -= 12;
  }   
 
 // background(255,255,0);
  translate(250,250);
 // rect(0, 0, 50, 50);
 

  stroke(255);
  for (int i = 450; i<1200; i+= 100) {
    ellipse(0, 0, i, i);
  }
 
 // for (int i = 0; i<15; i++) {
   // line(0,-175,0,-225);
    //rotate(radians(30));
  //}

  circhoras();
  circminutos();
  circsegundos();
}
 
void circhoras() {
  strokeWeight(15);
  strokeCap(SQUARE);
  stroke(190,100,0);
  fill(125,0,0);
  pushMatrix();
  rotate(radians(30 * horas));
  ellipse(0, 0, 380, 380);
  line(0, -185, 0, -125);
  popMatrix();
}
 
void circminutos() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(190,100,0);
  fill(100,0,0);
  pushMatrix();
  rotate(radians(6 * minutos));
  ellipse(0, 0, 250, 250);
  line(0, -125, 0, 0);
  popMatrix();
}
 
void circsegundos() {
  strokeWeight(5);

  stroke(190,100,0);
  fill(75,0,0);
  pushMatrix();
  rotate(radians(6 * segundos));
  ellipse(0, 0, 120, 120);
  line(0, -60, 0, 0);
  popMatrix();

ellipse(0,0,20,20);
}

