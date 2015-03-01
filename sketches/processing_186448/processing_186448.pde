

float contador = 0;
float qh=75; 

void setup() {
  size(500, 650);
  noSmooth();
  frameRate(30);
}

void draw() {
stroke(0);
noFill();
  rect(25,25,450, 600);
  reloj();
}

void reloj() {


  translate(width / 2, height / 2 );

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 360/60* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#D61E1E);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  360/30 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#671717);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
  resetMatrix();

  ///////
  if (contador < 0) {
    reloj1();
  } else if (contador < 1000) {
    reloj2 ();
  } else if (contador < 2000) {
    reloj3();
  } else if (contador <3000) {
    reloj4();
  } else if (contador <4000) {
    reloj5();
  } else if (contador <5000) {
    reloj6();
  } else {
    contador =0;
  }

  contador++;
}


void reloj1 () {
}


void reloj2() {


  translate(width / 2, height / 2 );

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 360/60* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#D61E1E);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  360/30 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#671717);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
  resetMatrix();
}
void reloj3() {


  translate(width / 2 -qh, height / 2 -qh);

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 10* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#E1E881);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  10 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#848B20);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
}
void reloj4() {

  translate(width / 2 +qh, height / 2 +qh);

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 50* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#839DE0);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  50 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#293E76);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
}

void reloj5 () {


  translate(width / 2 -qh, height / 2 +qh);

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 2* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#CD65E3);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  2 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#4A1655);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
}

void reloj6() {


  translate(width / 2 +qh, height / 2 -qh);

  // reloj
  strokeWeight(2);


  // segundos
  strokeWeight(2);

  float radSec = 80* second();
  pushMatrix();
  rotate(radians(radSec));
  stroke(#E3B090);
  line(0, 0, 0, -95);
  popMatrix();

  // minutos/horas
  strokeWeight(5);
  float radMin =  80 * minute();
  pushMatrix();
  rotate(radians(radMin));
  stroke(#9B5429);
  line(0, 0, 0, -70);
  popMatrix();

  int h = minute();
}
