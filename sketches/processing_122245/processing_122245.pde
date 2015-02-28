
float centroX, centroY;
float pX, pY;
float pXtxtSeno, pYtxtSeno;
float pXtxtCos, pYtxtCos;
float pXtxtAng, pYtxtAng;
float diametro= 300;
float radio= diametro/2;
float angulo=0, incAng= 0.00, factorInc=30;
int numP= 240;
float[] lcons1= new float[numP];
float[] lcons2= new float[numP];
float[] lSeno= new float[numP];
float[] lCos= new float[numP];


void setup() {
  size(600, 600);
  frameRate(30);
  //  smooth();
  centroX= 200;
  centroY= 200;
  float pos1= 600;
  float pos2= 599;
  for (int i=0; i<lcons1.length;i++) {
    lcons1[i]= pos1;
    pos1--;
    lcons2[i]= pos2;
    pos2--;
  }
  for (int i=0; i<lSeno.length;i++) {
    lSeno[i]= pY-20;
    lCos[i]= pX-20;
  }
}

void draw() {
  background(#0054BF);
  pX= centroX+cos(angulo)*radio;
  pY= centroY+sin(angulo)*radio;
  pXtxtSeno= centroX+cos(angulo)*radio;
  pYtxtSeno= centroY+sin(angulo)*radio/3;
  pXtxtCos= centroX+cos(angulo)*radio/2;
  pYtxtCos= centroY+sin(angulo)*radio;
  pXtxtAng= centroX+cos(angulo-PI/15)*radio*.25;
  pYtxtAng= centroY+sin(angulo-PI/15)*radio*.25;
  incAng= TWO_PI/factorInc;
  factorInc=constrain(factorInc, .5, 200);
  float Freq= 1/(factorInc/30);
  if (angulo>TWO_PI) angulo=0;
  if (angulo<0) angulo=TWO_PI;
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==RIGHT) angulo= angulo+incAng;
      if (keyCode==LEFT) angulo= angulo-incAng;
      if (keyCode==UP) factorInc-=.1;
      if (keyCode==DOWN) factorInc+=.1;
    }
  }
//  println(factorInc);

  pushMatrix();
  //
  translate(-20, -20);
  noFill();
  strokeWeight(.35);
  stroke(150);
  for (float i=centroX-radio; i<centroX+radio+1; i=i+diametro/20) {
    line(i, centroY-radio*1.1, i, centroY+radio*1.1);
    line(centroX-radio*1.1, i, centroX+radio*1.1, i);
  }
  fill(150, 180);
  textSize(10);
  text(-1, centroX-radio+3, centroY-3);
  text(-1, centroX+3, centroY-radio-3);
  text(0, centroX+3, centroY-3);
  text(1, centroX+radio+3, centroY-3);
  text(1, centroX+3, centroY+radio-3);
  noFill();
  stroke(255);
  strokeWeight(.3);
  line(centroX-radio*1.1, centroY, centroX+radio*1.1, centroY);
  line(centroX, centroY-radio*1.1, centroX, centroY+radio*1.1);
  stroke(255, 150);
  strokeWeight(2);
  arc(centroX, centroY, diametro, diametro, 0, TWO_PI);
  stroke(255, 150);
  strokeWeight(6);
  point(centroX-radio, centroY);
  point(centroX+radio, centroY);
  point(centroX, centroY-radio);
  point(centroX, centroY+radio);
  //
  fill(#00CEFF, 70);
  strokeWeight(2);
  stroke(#00CEFF);
  arc(centroX, centroY, diametro*.3, diametro*.3, 0, angulo);
  //
  fill(255, 200);
  strokeWeight(1);
  stroke(#D6FF36);
  if (keyPressed) { 
    if (key=='s') {
      line(pX, pY, pX, centroY);
      textSize(13);
      text(sin(angulo), pXtxtSeno, pYtxtSeno);
    }
    if (key=='c') {
      line(pX, pY, centroX, pY);
      textSize(13);
      text(cos(angulo), pXtxtCos, pYtxtCos);
    }
  }
  //
  strokeWeight(1.5);
  stroke(#FF0077);
  line(centroX, centroY, pX, pY);
  strokeWeight(5);
  point(centroX, centroY);
  point(pX, pY);
  textSize(10);
  text(angulo, pXtxtAng, pYtxtAng);
  //
  popMatrix();
  //
  strokeWeight(3);
  line(360, 30, 360, 330);
  line(30, 360, 330, 360);
  strokeWeight(1);

  stroke(#D6FF36);
  for (int i=0; i<lSeno.length-1;i++) {
    lSeno[i]= lSeno[i+1];
    lCos[i]= lCos[i+1];
  }
  lSeno[lSeno.length-1]= pY-20;
  lCos[lCos.length-1]= pX-20;
  for (int i=0; i<lSeno.length-1;i++) {
    line(lcons1[i], lSeno[i], lcons2[i], lSeno[i+1]);
    line(lCos[i], lcons1[i], lCos[i+1], lcons2[i]);
  }
  strokeWeight(8);
  stroke(#FF0077);
  point(360, pY-20);
  point(pX-20, 360);
  textSize(13);
  float angPI= map(angulo, 0, 6.28, 0, 2);
  float gradosC= degrees(angulo);
  float grados= map(gradosC, 0, 360, 360, 0);
  text("Tecla S para mostrar Seno", 380, 380);
  text("Tecla C para mostrar Coseno", 380, 400);
  textSize(12);
  text("Angulo en radianes:  "+angPI+"π", 380, 420);
  text("Angulo en grados:  "+grados, 380, 435);
  text("Seno:    "+sin(angulo), 380, 450);
  text("Coseno:  "+cos(angulo), 380, 465);
  text("Frecuencia:    "+Freq+"   hertz", 380, 480);
  textSize(13);
  text("    <      Dirección      >", 380, 500);
  text("    ^      Frecuencia     v", 380, 520);
}

