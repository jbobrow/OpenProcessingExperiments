

int globalX = 0;
int globalY = 0;
int velocidad = 0;
PImage imagen;
PFont font;
void setup(){
  size(600, 600);
  smooth();
    strokeWeight(0);
    imagen = loadImage("666.jpg");
    font = loadFont ("Geneva-8.vlw");
  textFont (font);
}

void draw(){
  background(200, 0, 0, 100);
  image (imagen, 0, 0, width+(random(40)), height+random(80));
  noFill();
  stroke(255, 0, 20);
  cursor();
  viaja();
  rebote();
  dibujarForma(mouseX,  mouseY, 0,100);
  dibujarForma(mouseX,  mouseY, 100, 200);
  dibujarForma(mouseX,  mouseY, 400, 300);
  dibujarForma(mouseX,  mouseY, 600, 400);
  dibujarForma(mouseX,  mouseY, 400, 500);
  dibujarForma(mouseX,  mouseY, 500, 600);
}

void viaja(){
  globalX = globalX + velocidad;
  globalY = globalY + velocidad;
}

void rebote(){
  if((globalX>width)||(globalX<height)){
    velocidad = velocidad*-12;
  }
}

void dibujarForma(int x, int y, int tamano, color c){
  int offset = tamano/1;
  rectMode(CENTER);
  noStroke();
  fill(#A92FB2);
  for(int i=0; i<20; i++){
    rotate(i/4.5);
   
   
  fill( random(255), random(255), random(255), random(255));
  text("Homosexual", 0, 150, mouseX, 100);
  fill( random(255), random(255), random(255), random(255));
  text("Transexual", 60, 250, mouseY, 200);
  fill( random(255), random(255), random(255), random(255));
  text("Bisexual", 180, 350, mouseX, 300);
  fill(random(255), random(255), random(255), random(255));
  text("Hombre", 260, 450, mouseY, 500);
  fill( random(255), random(255), random(255), random(255));
  text("Mujer", 110, 500, mouseY, 500);
  fill( random(255), random(255), random(255), random(255));
  text("Cisgénero", 280, 600, mouseX, 500);
  fill(random(255), random(255), random(255), random(255));
  text("Transgénero", 240, 560, mouseY, 500);
  fill(random(255), random(255), random(255), random(255));
  text("Intersexual", 400, 400, mouseY, 500);
  text("Humano", 340, 200, mouseY, 500);
  text("Soy Yo", 540, 50, mouseY, 500);
}
}



