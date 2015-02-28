
//unam, mexico
//alejandro R.
//azulprofundo2.1
//---------------
int angulo;
float contador;
PFont miFuente;
void setup() {
  size(1260,600,P3D);
  smooth();
  miFuente= loadFont("CharlieBrownM54-48.vlw");
}
//dibujos
void draw() {
  texto();
  torre();
  cielo();
  girar();
}
//cielo
void cielo() {
  fill(83,134,168,10);
  noStroke();
  rectMode(CORNERS);
  rect(0,0,random(width),random(height));
  fill(255,250,250,10);
  noStroke();
  rectMode(CORNERS);
  rect(600,600,random(width),random(height));
  fill(3,53,93,10);
  noStroke();
  rectMode(CORNERS);
  rect(0,0,random(width/2),random(height/2));
}
//gira
void girar() {
  translate(width/1.5,height/2);
  rotate(radians(angulo));
  rotateX(radians(contador));
  rotateY(radians(contador));
}
//texto 
void texto() {
  girar();
  textFont(miFuente,random(75));
  fill(32,74,180);
  if(angulo%25==0) {
    text ("cieloazul",random(40,100),55,0);
  }
  if(angulo%25==0) {
    fill(6,40,72);
    text ( "deepblue",random(75,350),random(25,200),0);
  }
  stroke(random(5));
  rect(0,0,random(500),random(10));
  if (angulo%50==0) {
    angulo++;
  }
  else {
    angulo++;
  }
}
//torre
void torre() {
  noFill(); // Color de relleno
  stroke(random(255)); // Color de contorno
  box (random(100),-random(150),-random(700));
  stroke(255);
  box(angulo%100, contador%45, contador%50);
}
//presiona t
void keyPressed() {
  if(key == 't') {
    save(random(10)+".jpg");
  }
}
///elfinal..........................?


