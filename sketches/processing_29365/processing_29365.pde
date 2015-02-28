
import geomerative.*;

RShape texto;
int numTri = 25;
int numCir = 30;
int val;
float salida = 20;

//creamos array de posiciones
PVector[] posiciones = new PVector[numTri];

//variable para el tamaño ir
float med = random(2,15);

void setup() {
  size(900,600);
  frameRate(200);
  smooth();
  background(0);

  RG.init(this);
  texto = RG.getText("C A C E R O L A","SmartFrocksNF.ttf",80,CENTER);

  //inicializamos PVectors:
  for (int i = 0; i<numTri; i++) {
    posiciones[i] = new PVector(width/2,height/2);
  }
}

void draw() {
  noStroke();
  fill(0);
  translate(width/2, height/2); 
  float step = map(mouseX,0,width,0.00002,0.005);

  if (mousePressed) {
    salida = salida + 2;
  }

  if (keyPressed) {
    if ((key == '1')||(key == '5')||(key == 'm')||(key == 'M')) {
      background(0);
      salida = 0;
    }
  }

  for (float t = 0; t<0.99; t+=step) {
    RPoint punto = texto.getPoint(t);
    RPoint tang = texto.getTangent(t);
    float ang = atan2(tang.y,tang.x);
    fill(255);
    noStroke();

    pushMatrix();
    translate(punto.x,punto.y);
    rotate(ang-PI/2);
    strokeWeight(1);
    stroke(255);
    float X = random(-20,20);
    float Y = random(-20,20);
    float Z = noise(20,20);

    //dibujo
    //translate(500,400);
    //rotate(random(HALF_PI/2,(PI/4)*3));
    stroke(random(255),random(255),random(255));
    strokeWeight(random(0.2,0.5));
    fill(noise(255),noise(255),noise(255),70);
    triangle(0,0,X,Y,X,Y-Z);
    if (mousePressed == true) {
      noStroke();
      fill(random(255),random(255),random(255),10);
      rect(0,0,salida,salida);
      rect(-salida,-salida,salida,salida);
    }
    popMatrix();
  }
}


