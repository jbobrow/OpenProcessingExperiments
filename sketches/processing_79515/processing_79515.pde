
//Johnny alexander sepulveda restrepo
// Kaziuz8bits
//johnnyalexandersepulveda@gmail.com
//2012

Circulo1[] circuloA = new Circulo1[30];
Circulo2[] circuloF = new Circulo2[10];
Circulo1[] circuloB = new Circulo1[20];
Circulo2[] circuloC = new Circulo2[15];
Circulo1[] circuloZ = new Circulo1[50];
Circulo2[] circuloQ = new Circulo2[10];


int anchopy = 800; //pantalla y
int anchopx = 800; //pantalla x

void setup() {
  size( anchopy, anchopx);
  smooth();
  for (int i = 0; i < circuloA.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    float Z = i + 1;
    print(i);
    circuloA[i] = new Circulo1(10, X, Y, 0, 255, 14);
  }

  for (int i = 0; i < circuloF.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    circuloF[i] = new Circulo2(20, X, Y, 219, 64, 201 );
  }

  for (int i = 0; i < circuloB.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    circuloB[i] = new Circulo1(30, X, Y, 20, 223, 247 );
  }

  for (int i = 0; i < circuloC.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    circuloC[i] = new Circulo2(15, X, Y, 255, 0, 0 );
  }

  for (int i = 0; i < circuloZ.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    circuloZ[i] = new Circulo1(10, X, Y, 148, 0, 255 );
  }

  for (int i = 0; i < circuloQ.length; i++) {
    float X = random(anchopx);
    float Y = random(anchopy);
    circuloQ[i] = new Circulo2(50, X, Y, 255, 175, 0 );
  }
}

void draw() {
  background(#FFFFFF);


  for (int i = 0; i < circuloA.length; i++) {
    circuloA[i].animacion1();
    circuloA[i].cuerpo1();
    circuloA[i].cuerpo1a();
    circuloA[i].cuerpo1ab();
    circuloA[i].palpito1();
    circuloA[i].movimiento_palpito1();
  }

  for (int i = 0; i < circuloF.length; i++) {
    circuloF[i].animacion2();
    circuloF[i].cuerpo2();
    circuloF[i].cuerpo2a();
    circuloF[i].cuerpo2ab();
    circuloF[i].palpito2();
    circuloF[i].movimiento_palpito2();
  }


  for (int i = 0; i < circuloB.length; i++) {
    circuloB[i].animacion1();
    circuloB[i].cuerpo1();
    circuloB[i].cuerpo1a();
    circuloB[i].cuerpo1ab();
    circuloB[i].palpito1();
    circuloB[i].movimiento_palpito1();
  }

  for (int i = 0; i < circuloC.length; i++) {
    circuloC[i].animacion2();
    circuloC[i].cuerpo2();
    circuloC[i].cuerpo2a();
    circuloC[i].cuerpo2ab();
    circuloC[i].palpito2();
    circuloC[i].movimiento_palpito2();
  }


  for (int i = 0; i < circuloZ.length; i++) {
    circuloZ[i].animacion1();
    circuloZ[i].cuerpo1();
    circuloZ[i].cuerpo1a();
    circuloZ[i].cuerpo1ab();
    circuloZ[i].palpito1();
    circuloZ[i].movimiento_palpito1();
  }

  for (int i = 0; i < circuloQ.length; i++) {
    circuloQ[i].animacion2();
    circuloQ[i].cuerpo2();
    circuloQ[i].cuerpo2a();
    circuloQ[i].cuerpo2ab();
    circuloQ[i].palpito2();
    circuloQ[i].movimiento_palpito2();
  }
}

// Clase circulo creciente

class Circulo1 {   
  int ancho1;  
  float posicionx1; 
  float posiciony1;
  int color1;
  int color2;
  int color3;
  //variables globales
  float crece = 0;
  float decrece = ancho1;
  float xspeed = 2.5;
  float yspeed = 2.2;
  int xdirection = 1;
  int ydirection = 1;
  //variables globales circulos internos giratorios
  float angulo = 0.0;
  float escalar1 = 50;
  float escalar2 = 23;
  float velocidad1 = 0.05;
  float velocidad2 = 0.005;




  Circulo1 ( int tempancho1, float tempposicionx1, float tempposiciony1, 
  int tempcolor1, int tempcolor2, int tempcolor3) {

    posicionx1 = tempposicionx1;
    posiciony1 = tempposiciony1;
    ancho1 = tempancho1;
    color1 = tempcolor1;
    color2 = tempcolor2;
    color3 = tempcolor3;
  }

  void animacion1() {
    posicionx1 = posicionx1 + (xspeed * xdirection );
    posiciony1 = posiciony1 + (yspeed * ydirection );

    if (posicionx1 > width-ancho1 || posicionx1 < ancho1) {
      xdirection *= -1;
    }
    if (posiciony1 > height-ancho1 || posiciony1 < ancho1) {
      ydirection *= -1;
    }
  }


  void cuerpo1() {


    ellipseMode(RADIUS);
    fill(color1, color2, color3, 230);
    strokeWeight(2);
    stroke(#030001);
    ellipse (posicionx1, posiciony1, ancho1, ancho1);

    // circulo externo giratorio
    float X1 = posicionx1 + cos(angulo) * escalar1;
    float Y1 = posiciony1 + sin(angulo) * escalar1;
    fill(0, 3, 1, 220);
    stroke(#030001);
    strokeWeight(1);
    ellipse(X1, Y1, 5, 5);
    angulo += velocidad1;
  }

  void cuerpo1a() {
    ellipseMode(RADIUS);
    noStroke();
    strokeWeight(3);
    fill(color1 - 150, color2 - 134, color3, 30);
    ellipse (posicionx1, posiciony1, ancho1 - 25, ancho1 - 25);
  }

  void cuerpo1ab() {
    ellipseMode(RADIUS);
    noStroke();
    strokeWeight(3);
    fill(100 - color1, 4, color3, 30);
    ellipse (posicionx1, posiciony1, ancho1 - 50, ancho1 - 50);

    // circulo externo giratorio
    ellipseMode(CENTER);     
    float X2 = posicionx1 + sin(angulo) * escalar2;
    float Y2 = posiciony1 + cos(angulo) * escalar2;
    stroke(252, 255, 253);
    fill(255, color2 - 5, color3, 150);
    strokeWeight(2);
    ellipse(X2, Y2, 10, 10);
    angulo += velocidad2;
  }



  void palpito1() {

    //circulos de adentro
    ellipseMode(RADIUS);
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(posicionx1, posiciony1, crece, crece);
  }

  void movimiento_palpito1() {

    //movimiento
    crece = crece + 0.5;
    decrece = decrece - 0.5;
    if (crece >= ancho1) {

      ellipseMode(RADIUS);
      noStroke();
      strokeWeight(3);
      fill(#000000);
      ellipse (posicionx1, posiciony1, ancho1, ancho1);
      crece = 0.0;
    }
    if (decrece < 0 ) {
      decrece = ancho1;
    }
  }
}

// Clase circulo decreciente

class Circulo2 {   
  int ancho2;  
  float posicionx2; 
  float posiciony2;
  int color1;
  int color2;
  int color3;

  //variables globales
  float crece = 0;
  float decrece = ancho2;
  float xspeed2 = 3.5;
  float yspeed2 = 3.2;
  int xdirection2 = 1;
  int ydirection2 = 1;

  //variables globales circulos internos giratorios
  float angulo = 0.0;
  float escalar1 = 50;
  float escalar2 = 33;
  float velocidad1 = 0.05;
  float velocidad2 = 0.005;


  Circulo2 ( int tempancho2, float tempposicionx2, float tempposiciony2, 
  int tempcolor1, int tempcolor2, int tempcolor3) {

    posicionx2 = tempposicionx2;
    posiciony2 = tempposiciony2;
    ancho2 = tempancho2;
    color1 = tempcolor1;
    color2 = tempcolor2;
    color3 = tempcolor3;
  }

  void animacion2() {

    // Movimiento de los circulos
    posicionx2 = posicionx2 + (xspeed2 * xdirection2 );
    posiciony2 = posiciony2 + (yspeed2 * ydirection2 );

    if (posicionx2 > width-ancho2 || posicionx2 < ancho2) {
      xdirection2 *= -1;
    }
    if (posiciony2 > height-ancho2 || posiciony2 < ancho2) {
      ydirection2 *= -1;
    }
  }
  void cuerpo2() {


    ellipseMode(RADIUS);
    fill(color1, color2, color3, 200);
    strokeWeight(2);
    stroke(#030001);
    ellipse (posicionx2, posiciony2, ancho2, ancho2);

    // circulos externos
    float X1 = posicionx2 + cos(angulo) * escalar1;
    float Y1 = posiciony2 + sin(angulo) * escalar1;
    fill(0, 3, 1, 220);
    stroke(#030001);
    strokeWeight(1);
    ellipse(X1, Y1, 5, 5);
    angulo += velocidad1;
  }

  void cuerpo2a() {
    ellipseMode(RADIUS);
    noStroke();
    strokeWeight(3);
    fill(color1 - 150, color2 - 134, color3 + 98, 80);
    ellipse (posicionx2, posiciony2, ancho2 - 45, ancho2 - 45);
  }

  void cuerpo2ab() {
    ellipseMode(RADIUS);
    noStroke();
    strokeWeight(3);
    fill(100 - color1, 4, color3, 30);
    ellipse (posicionx2, posiciony2, ancho2 - 85, ancho2 - 85);

    // circulo externo 
    ellipseMode(CENTER);     
    float X2 = posicionx2 + sin(angulo) * escalar2;
    float Y2 = posiciony2 + cos(angulo) * escalar2;
    fill(129, 227, 255);
    stroke(0, 6, 8);
    strokeWeight(2);
    ellipse(X2, Y2, 10, 10);
    angulo += velocidad2;
  }

  void palpito2() {

    //circulos de adentro
    ellipseMode(RADIUS);
    stroke(color1 + 100, 30 + color1, 255);
    strokeWeight(3);
    noFill();
    ellipse(posicionx2, posiciony2, decrece, decrece);
  }

  void movimiento_palpito2() {

    //movimiento
    crece = crece + 0.5;
    decrece = decrece - 0.5;
    if (crece >= ancho2) {

      ellipseMode(RADIUS);
      noStroke();
      strokeWeight(3);
      fill(#000000);
      ellipse (posicionx2, posiciony2, ancho2, ancho2);
      crece = 0.0;
    }
    if (decrece < 0 ) {
      decrece = ancho2;
    }
  }
}




