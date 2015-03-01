
/* Trabajo practico 5 / Mariana Lombard
 Inspirado en "The Alphabet" de David Lynch (1968) // enlace Youtube: https://www.youtube.com/watch?v=Zr6TZSXTzgI
 */

//import ddf.minim.*; // cargar libreria de audio
import  "http://github.com/Pomax/Pjs-2D-Game-Engine/blob/master/minim.js";
Minim abecedario; 
AudioPlayer sonarA;
AudioPlayer sonarB;
AudioPlayer sonarC;
int frame = 0; // frame de inicio
color bordeA = (255); //variables de color del borde de las letras
color bordeB = (255);
color bordeC = (255);


void setup() {
  size(600, 600);  
  fondo(); //llama funcion dibujo de fondo
  abecedario = new Minim (this); //carga los audios que luego son usados por las funciones que dibujan las letras
  sonarA = abecedario.loadFile ("a.wav");
  sonarB = abecedario.loadFile ("b.wav");
  sonarC = abecedario.loadFile ("c.wav");
  frameRate(5); // frames por segundo : 5
}

void draw() {
  fondo();  // redibuja el fondo
  int x = int (random(0, width/2)); // variables de la posicion de las funciones de las letras
  int y = int (random(0, height/2));
  float s = random(0.15, 0.5); // variable de escala de las funciones de las letras

  frame++; // crecimiento de los frames 

  if (frame == 2) { // al frame 2 dibuja la A
    dibujarA(x, y, s);
  } 

  if (frame == 4) { // al frame 4 dibuja B
    dibujarB(x, y, s);
  }

  if (frame == 6) { // al frame 6 dibuja la C
    dibujarC(x, y, s);
  }
  if (frame == 8) { // al llegar al frame 8 regresa los frames a 0
    frame = 0;

    noLoop(); //no repite el draw
  }
}
void keyPressed () {
  loop(); //si se presiona una tecla se repite nuevamente el draw
  if ((keyPressed == true) && (key == 'a' || key == 'A') ) {

    bordeA = color (255, 0, 0); // si se presiona la tecla "a" o "A" cambia el color del borde de la letra A
  }
  else {
    bordeA = color (255); //sino queda blanco
  }
  if ((keyPressed == true) && (key == 'b' || key == 'B') ) { 

    bordeB = color (255, 0, 0); // si se presiona la tecla "b" o "B" cambia el color del borde de la letra B
  }
  else {
    bordeB = color (255); //sino queda blanco
  }
  if ((keyPressed == true) && (key == 'c' || key == 'C') ) {

    bordeC = color (255, 0, 0); // si se presiona la tecla "c" o "C" cambia el color del borde de la letra C
  }
  else {
    bordeC = color (255); //sino queda blanco
  }
}

void fondo() { //funcion que dibuja el fondo
  colorMode(HSB);
  for (int i=0; i<450 ; i++) {
    stroke(0, 0, i*0.5); 
    line(i, 0, i, 450);
  }
  for (int i=0; i<350 ; i++) {
    stroke(0, 0, i*0.2); 
    line(350, i, 600, i);
  }
  for (int i=0;i<600;i= i+40) {
    noStroke();
    fill(0);
    rect(i, 200, 20, 20);
  }
  for (int i=20;i<600;i= i+40) {
    noStroke();
    fill(255);
    rect(i, 220, 20, 20);
  }
  colorMode(RGB);
  noStroke();
  fill(0);
  beginShape();
  vertex(0, 600);
  vertex(0, 350);
  vertex(350, 300);
  vertex(600, 350);
  vertex(600, 600);
  endShape();
  beginShape();
  vertex(0, 0);
  vertex(350, 30);
  vertex(600, 0);
  endShape();
}

void dibujarA(int x, int y, float s) { //funcion que dibuja la letra A
  pushMatrix();
  translate(x, y);
  scale(s);
  strokeWeight(15);
  stroke(bordeA);
  strokeCap(SQUARE);
  noFill();
  beginShape();
  vertex(100, 500);
  vertex(300, 100);
  vertex(500, 500);
  vertex(395, 290);
  vertex(210, 290);
  endShape();
  popMatrix();
  sonarA.play();
  sonarA.rewind();
}

void dibujarB(int x, int y, float s) { //funcion que dibuja la letra B
  pushMatrix();
  translate(x, y);
  scale(s);
  strokeWeight(15);
  stroke(bordeB);
  strokeCap(SQUARE);
  noFill();
  beginShape();
  vertex(100, 500);
  vertex(100, 100);
  vertex(200, 100);
  bezierVertex(200, 100, 400, 200, 200, 300);
  vertex(100, 300);
  vertex(200, 300);
  bezierVertex(200, 300, 400, 350, 250, 495);
  vertex(93, 495);
  endShape();
  popMatrix();
  sonarB.play();
  sonarB.rewind();
}

void dibujarC(int x, int y, float s) { //funcion que dibuja la letra C
  pushMatrix();
  translate(x, y);
  scale(s);
  strokeWeight(15);
  stroke(bordeC);
  strokeCap(SQUARE);
  noFill();
  arc(300, 300, 400, 400, radians(60), radians(300));
  popMatrix();
  sonarC.play();
  sonarC.rewind();
}

