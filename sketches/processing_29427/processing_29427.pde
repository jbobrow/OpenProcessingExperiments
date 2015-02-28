
int tamaniorect = 100;
int posicion = 80;
int posicion2 = 80;
int tamanio = 60;

void setup(){
  size(300,300);
}

void draw(){
  background(255);
  stroke(0);
  fill(172);
  ellipseMode(CENTER);
  ellipse(posicion,posicion,tamanio,tamanio);
  posicion = posicion-1;
  ellipse(posicion+150,posicion,tamanio,tamanio);
  ellipse(posicion2,posicion2+150,tamanio,tamanio);
  posicion2 = posicion2+1;
  ellipse(posicion2+150,posicion2+150,tamanio,tamanio);

}

