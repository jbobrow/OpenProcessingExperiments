
float angulo = 0.0;
float centro = 250;
float radio = 1;
float radio1 = 1;

void setup() {
 size(500, 500);
 background(255);
 
}
void draw() {
 
 for (int i=0; i<20; i++) {

 float x = centro + cos(angulo) * radio;
 float y = centro + sin(angulo) * radio;
 

  int f=i==19 ? 255 : 0;
    fill(f);
    ellipse( x, y, 6, 6);
 angulo+=0.08;
 radio+=0.08;

 }
}
