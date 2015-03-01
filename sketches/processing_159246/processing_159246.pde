
int counter;

int perro=600;
void setup(){
  size(600,600);
  background(255,0,0);
}
void draw(){
  perro=perro-8;
  ellipse(perro,300,width,perro);
}



