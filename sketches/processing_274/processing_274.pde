
float inc = 0.0;//incremento de angulo
float dim = 50;
void setup() {
  size(900, 450);
  background(0);
  smooth();
}
void draw() {
  background(0);
  inc += 0.01;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /5.0 ;
 
  translate(width/2,height/2);
 
  
  for (int i = 0; i < 8; i++) {
   
    tail(0,-dim/2, 40, angle);
    rotate(PI/4);
  }
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);

  for (int i = units; i > 0; i--) {
    strokeWeight(i/2);
    stroke(255);//color de borde
    line(0, 0, 0, -4);
     strokeWeight(1);
     line(0,0,4,0);
    translate(0, -4);

   
    rotate(angle);

  }
  //noStroke();
  fill(255,0,0);
  ellipse(0,0,10,10);
  popMatrix();
}

