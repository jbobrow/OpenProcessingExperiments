
float inc = -200.0;//incremento de angulo
float dim = 50;
void setup() {
  size(600, 700);
  background(20);
  smooth();
}
void draw() {
  background(20);
  inc += 0.15;
  float angle = sin(inc) /15.0 ;
  translate(width/2,height/2);
  for (int i = 0; i < 8; i++) {
    tail(0,-dim/2, 60, angle);
    rotate(PI/8);
  }
  ellipse(0,0,dim,dim);
   
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
 for (int i = units; i > 0; i--) {
    strokeWeight(0);
    stroke(230);//color de borde
    line(0, 0, 80, -10);
    strokeWeight(2);
    line(0,0,4,0);
    translate(0, -4);
    rotate(angle);
  }
 //noStroke();
  fill(200,200,200,70);
  triangle(40,80,40,0,-30,160);
  popMatrix();
}


