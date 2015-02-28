

float R= random(0,255);
float G= random(0,255);
float B= random(0,150);
int posX= 0;
int posY= 0;
int petalos=20;
float largo=random(40,70);
int alfa=0;


void setup(){
  //tamaño
  size(400,400);
  //un fondo
  background(100,100,255);

}


void draw(){
  translate(width/2,150);
  
  flor();




}

void flor(){
//stroke del mismo color del rello
  stroke(100,100,255);
  strokeWeight(5);
  //dibujo el tallo rojo
  strokeWeight(15);
  stroke(R,G,200);
  line(posX,posY,posX,150);
  //dibujo y rello la tierra con colores aleatorios
  fill(R,G,B,100);
  rectMode(CENTER);
  rect(posX-width/2,posY+height/2,width*2,100);
  
  //dibujo el centro de la flor utilizando tambien color aleatorio
  stroke(G+20);
  strokeWeight(3);
  fill(220,150,100);
  ellipse(posX,posY,50,50);
  //petalos se dibujan con un bucle
  stroke(R,G,B);
  fill(255,G+70,0);
  for(int i=0; i<petalos; i++){

    rotate(TWO_PI/petalos);
    ellipse(posX,posY+47,20,largo);




  }


}
/*
void fondo(){
rect();
fill(R,G,B,alfa);
noStroke();




}
*/

