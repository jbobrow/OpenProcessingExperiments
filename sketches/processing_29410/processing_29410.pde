
int posicion = 80;
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
  ellipse(posicion+150,posicion,tamanio,tamanio);
  ellipse(posicion,posicion+150,tamanio,tamanio);
  ellipse(posicion+150,posicion+150,tamanio,tamanio);

}

