
float inc = 0.0;//incremento de angulo
float dim = 50;//Diametro
void setup() {
  size(900, 450);
  background(0);
  smooth();
}
void draw() {
  background(0);
  inc += 0.01;
  frameRate(30);
  float angle = tan(inc) /10.0 ;
  translate(width/2,height/2);
  for (int i = 0; i < 10; i++) {
    tail(50,-dim/2, 40, angle);
    rotate(PI/5);
  }
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
 for (int i = units; i > 0; i--) {
    strokeWeight(i/2);
    stroke(255,0,0);//color de borde
    line(0, 100, 0, 100);
    strokeWeight(1);
    line(50,60,25,20);
    translate(0, 3);
    rotate(angle);
  }
  //noStroke();
  fill(220,126,0);
  ellipse(100,50,10,10);
  popMatrix();
}


