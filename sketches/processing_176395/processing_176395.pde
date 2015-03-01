

int posx, posx2;
float distancia, tamanio,colour;

void setup() {
  size(400, 400);
  posx=0;
  posx2=400;
  tamanio=0;
  frameRate(20);
}

void draw() {
  noStroke();
  background(255);
  fill(0, colour, 0);
  ellipse(posx, posx, tamanio, tamanio); 
  fill(0, 0, colour);
  ellipse(posx2, posx, tamanio, tamanio);
  posx++;
  posx2--;
  distancia=dist(posx, posx, posx2, posx);
  tamanio=400-dist(posx, posx, posx2, posx);
  colour=map(distancia,400,0,255,0);
  println("la distancia es "+distancia);
}


