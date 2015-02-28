
//por Eduardo H Obieta 26 Octubre 2011
//ejercicio para la página de arte generativo
//http://artegenerativo.laad.com.mx
//import processing.opengl.*;

float rotacActual=0;
float perlinPos=0;
float perlinVel=0.1;

void setup() {
  size(800, 400, P3D);
  frameRate(10);
  background(0);
}

void draw() {
  //background(0);
  fill(0, 0.1);
  //noStroke();
  box(150,150,150);
 // rect(0, 0, width, height);
  translate(width/2, height/2, -200);

  float modifica=noise(perlinPos)*50;
  translate(0, -100);
  float transporta=noise(perlinPos*perlinVel)*400;
  float escala=noise(transporta)*150;

  pushMatrix();
  // rotateX(noise(rotacActual)*3);
  rotateY(rotacActual*0.6);
  rotateZ(rotacActual);
  translate(0, transporta);
  stroke(255, 100);

  float val1=-400+escala;
  float val2=400-escala+modifica;
  line(val1, 0, val2, 0);
  
  noStroke();
  fill(255);
  pushMatrix();
  translate(val1, 0);
  sphere(2.5);
  popMatrix();

  pushMatrix();
  translate(val2, 0);
  box(5,5,5);
  popMatrix();


  popMatrix();

  perlinPos +=perlinVel;
  rotacActual +=0.025;
}


