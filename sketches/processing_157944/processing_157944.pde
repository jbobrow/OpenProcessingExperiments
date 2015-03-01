
int perro=10;
void setup(){
  size(1000,800);
  background(140,40,155);
}
void draw(){
  perro=perro-10;
  noStroke();
  ellipse(perro, 300,width,perro);
}
