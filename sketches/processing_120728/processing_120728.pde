
/* MIDTERM - Carme Gomila 
 Programació: conceptes - MUAD3 
Variació de l'skecth 'Motion' d' Alba G. Corral <http://www.openprocessing.org/sketch/1225>
EN PROCÉS!!!!!
*/

// http://processing.org/tutorials/trig/

float angle = 0.0; 
float vel = 0.01; // Velocitat de l'animació
float radi = 50.0; // Límits de l'animació
float velX ;
float velY ;
String [] paraules = {
  "ARRAY", "ERRAR", "ERROR", ""
}; // array
PFont tipografia;
int contador=0; 

void setup() {
  size(800, 400);
  noStroke();
  smooth();
  reset (random(10.0), random(10.0)); // random X, random Y
  tipografia = loadFont ("53Seed-8.vlw");
  fill (255); //només es veurà a keyPressed '1'
}

void draw() {

  angle += vel; // 

  float sinval = sin(angle/velY); //sinus
  float cosval = cos(angle); //cosinus

  // Determino la posició de la circumferència petita
  float x = width/2 + (cosval * radi);
  float y = height/2 + (sinval * radi);
  fill(255);


  // Determino la posició de les circumferències grans basades amb la posició 
  // de la circumferència petita
  float x2 = x + cos(angle * velX) *radi ;
  float y2 = y + sin(angle * velY) * radi ;
  stroke(0, random(10, 100));
  line(x, y, x2, y2); // de circum petita a circum gran

  if (keyPressed) {
    if (key == '1') {
      stroke(0); //línia negra
      line(x, y, x2, y2);
    }
    if (key == '2') {
      stroke(0, 255, 151); //línia verda
      line(x, y, x2, y2);
      radi = 200.0; //variació de radi
    }

    if (key == '3') {
      background(255);
      reset (random(2.0), random(6.0));
    }
  }
}

void reset(float _velX, float _velY ) { 
  background(255);
  velX= _velX;
  velY= _velY;
}
// convertir a mousePressed
/*keyPressed(){ 
 if(key == '4') {
 text(paraules[contador]); //?);
 if(contador<palabras.length-1){
 contador++;
 } */
