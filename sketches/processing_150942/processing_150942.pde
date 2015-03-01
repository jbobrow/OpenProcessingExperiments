
/*Ejercicio: Animar el movimiento de una particula a velocidad v sobre
las 2 funciones osciladoras.*/

float posXgeneral, posY1, posY2;
float velocidad = 10;
float delta_t = 0.01;
float amplitud = 40;


void setup() {
  size(438,350);
  smooth();
}

void draw() {
  background(255,222,173,0);
  
  posXgeneral += velocidad * delta_t;
  
  pushMatrix();
  posY1 = amplitud * sin(posXgeneral) * exp(-0.002*posXgeneral);
  
  translate(posXgeneral, posY1);
  fill(0,255,255,255);
  ellipse(2, 100, 10, 10);
  popMatrix();
  
  pushMatrix();
  posY2 =  amplitud * (sin(3*posXgeneral) + sin(3.5*posXgeneral));
  
  translate(posXgeneral, posY2);
  fill(160,32,240,255);
  ellipse(2, 250, 10, 10);
  popMatrix();
}

void keyPressed(){
 
 if(key == ' '){
  posXgeneral = 0;
 } 
  
}


