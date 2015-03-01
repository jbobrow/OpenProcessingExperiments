
float angulo = 0.0;
float centro = 250;
float radio = 1;

void setup() {
 size(500, 500);
 background(0);
 
}
void draw() {
 
 
 float x = centro + cos(angulo) * radio;
 float y = centro + sin(angulo) * radio;
 fill(random(255),random(255), random(255));
 ellipse( x, y, 3, 3);
 angulo+=0.08;
 radio+=0.08;


}

