
// Definimos la variable fuera
// porque se va a utilizar dentro del draw
// y queremos que guarde su valor de un frame al siguiente
float minTonoBola = random(255);
float maxTonoBola = minTonoBola + 100;

float minTallaBola, maxTallaBola;

// Angulos y tallas de los brazos
float anguloPrimero, tallaPrimero, anguloSegundo, tallaSegundo, anguloTercero, tallaTercero;

void setup(){
  size(400, 400);
  smooth();

  colorMode(HSB, 255);

  // Como el stroke no cambia durante la animacion
  // la podemos llamar en el setup
  stroke(255); 
  strokeWeight(5);

  minTallaBola = height / 5;
  maxTallaBola = height / 4;

  anguloPrimero = 0;
  tallaPrimero = height / 7;
  anguloSegundo = 0;
  tallaSegundo = height / 9;
  anguloTercero = 0;
  tallaTercero = height / 12;
}

void draw(){
  // Borramos el frame con el color negro
  background(0);
  translate(width/2, height/2);

  noFill();

  // ---------- cuerpo ---
  pushMatrix();
  strokeWeight(20);
  stroke(255, 200);
  line(0, -height/4, 0, height/4);
  popMatrix();


  // ---------- cabeza ---
  pushMatrix();
  translate(0, -height/4);

  float oscila = sin(TWO_PI/4 * millis() / 1000);
  float tallaAhora = map(oscila, -1, 1, minTallaBola, maxTallaBola);
  float tonoAhora = map(oscila, -1, 1, minTonoBola, maxTonoBola);

  stroke(255, 200);
  strokeWeight(10);
  fill(tonoAhora, 255, 255, 250);
  ellipse(0, 0, tallaAhora, tallaAhora);

  // ojo
  translate(-height / 20, -height / 40);
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(0, 0, 15, 15);

  noStroke();
  fill(0);
  ellipse(0, 0, 5, 5);
  popMatrix();

  // ---------- patas ---------
  pushMatrix();
  noFill();
  strokeWeight(20);
  stroke(255, 200);
  
  translate(0, height / 2);
  ellipse(0, 0, height/2, height / 2);
  
  popMatrix();

  // ---------- brazo ----------
  pushMatrix();
  anguloPrimero += 5;
  anguloSegundo += 15;
  anguloTercero += 10;

  anguloPrimero = anguloPrimero % 360;
  anguloSegundo = anguloSegundo % 360;
  anguloTercero = anguloTercero % 360;

  strokeWeight(20);
  strokeCap(ROUND);

  rotate(radians(anguloPrimero));

  stroke(255, 200);
  line(0, 0, 0, tallaPrimero);

  // junta
  noStroke();
  fill(0, 220);
  ellipse(0, 0, 5, 5);

  translate(0, tallaPrimero);
  rotate(radians(anguloSegundo));

  stroke(255, 200);
  line(0, 0, 0, tallaSegundo);

  // junta
  noStroke();
  fill(0, 220);
  ellipse(0, 0, 5, 5);

  translate(0, tallaSegundo);
  rotate(radians(anguloTercero));

  stroke(255, 200);
  line(0, 0, 0, tallaTercero);

  // junta
  noStroke();
  fill(0, 220);
  ellipse(0, 0, 5, 5);

  popMatrix();
  

  pushMatrix();
  translate(0, height / 4);  
  // junta
  noStroke();
  fill(0, 220);
  ellipse(0, 0, 5, 5);
  popMatrix();
}

void keyPressed(){
  saveFrame("screen.png");
}

