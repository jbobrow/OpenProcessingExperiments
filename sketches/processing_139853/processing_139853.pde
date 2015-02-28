
float a;

void setup() {
  size(600, 600, P3D);
  a=0;
    background(0);
}
void draw() {

circleX();
circleY();
circleZ();
//circleA();
}

void circleX(){ 
  a = a+(random(0.003,0.008));
  pushMatrix();
  noFill();
  stroke(255,0,0,9);
  translate(width/2, height/2, 0);
  rotateX(cos(a)*2);
  ellipseMode(CENTER);
  ellipse(0, 0, 400, 400);
  popMatrix();
}

void circleY(){ 
  a = a+(random(0.0003,0.0008));
  pushMatrix();
  noFill();
  stroke(0,0,255,9);;
  translate(width/2, height/2, 0);
  rotateY(sin(a));
  rotateX(cos(a));
  ellipseMode(CENTER);
  ellipse(0, 0, 300, 300);
  popMatrix();
}

void circleZ(){ 
  a = a+(random(0.003,0.008));
  pushMatrix();
  noFill();
  translate(width/2, height/2, 0);
  rotateX(cos(a));
    rotateY(tan(a));
   stroke(255,255,255,6);
  ellipseMode(CENTER);
  ellipse(0, 0, 220, 220);
 
  popMatrix();
}

void circleA(){ 
  a = a+(random(0.003,0.008));
  pushMatrix();
  noFill();
  translate(width/2, height/2, 0);
  rotateX(sin(a)/2);
   stroke(255,255,255,4);
  ellipseMode(CENTER);
  ellipse(0, 0, 450, 450);
 
  popMatrix();
}



