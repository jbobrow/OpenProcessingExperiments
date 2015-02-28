
int radius = 40;
float x = -radius;
float speed = 8;
float inicio1 = 0.0;
float final1 = TWO_PI;
float inicio2 = 0.52;
float final2 = 5.76;
float espacio = 0.0;

void setup(){
  size(240, 120);
  ellipseMode(RADIUS);
  frameRate(8);
}

void draw(){
  background(0);
  x = x + speed;  
  fill(255,255,0);
  arc(x, 60, radius, radius, inicio1, final1);

espacio = inicio1;
inicio1 = inicio2;
inicio2 = espacio;
espacio = final1;
final1 = final2;
final2 = espacio;

}
