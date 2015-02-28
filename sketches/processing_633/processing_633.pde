
float inc = 0.0;//incremento de angulo
float dim = 50;
void setup() {
  size(900, 900);
  background(0,0,255);
  smooth();
}
void draw() {
  background(0);
  inc += 0.004;
  float angle = sin(inc) /5.0 ;
  translate(width/2,height/2);
  for (int i = 0; i < 8; i++) {
    tail(0,-dim/2, 40, angle);
    rotate(PI/2);
  }

}
void tail(float x,float y, int units, float angle) {
  
  translate(x/100, y/10);
 for (int i = units; i > 10; i--) {
    
    stroke(255,0,0);//color de lineas
    line(width/50, height/25, 100, -4);
    translate(0, -3);
    rotate(angle);
    
 }

}


