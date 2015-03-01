
int globalX = 6;
int globalY = 100;
int velocidad = 4;
PImage imagen;
void setup(){
  size(550, 800);
  smooth();
    strokeWeight(8);
    imagen = loadImage("sangre.jpg");
}

void draw(){
  background(200, 0, 0, 100);
  image (imagen, 0, 0, width+(random(10)), height+random(10));
  noFill();
  stroke(255, 0, 20);
noCursor();
  viaja();
  rebote();
  dibujarForma(globalX, globalY*5, 60, 200);
  dibujarForma(globalX, globalY, 60,200);
  dibujarForma(mouseX,  mouseY, 60, 200);
}

void viaja(){
  globalX = globalX + velocidad;
}

void rebote(){
  if((globalX>width)||(globalX<0)){
    velocidad = velocidad*-1;
  }
}

void dibujarForma(int x, int y, int tamano, color c){
  int offset = tamano/4;
  rectMode(CENTER);
  noStroke();
  fill(c);
  for(int i=0; i<200; i++){
    rotate(i/1.5);
  ellipse(x-offset, y-offset, offset, offset/1.2);
  ellipse(x-offset, y+offset, offset, offset/1.2);
  }
}


