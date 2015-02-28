

float a;

void setup() {

  size(600, 600, P3D);
  
  a=0;
    background(0);
     frameRate(10);
}
void draw() {

circleX();
circleY();
circleZ();
}

void circleX(){ 
  a = a+(random(0.0003,0.0008));
  pushMatrix();
  noFill();
  stroke(0,0,255);
  translate(width/2, height/2, 0);
  rotateX(cos(a));
  ellipseMode(CENTER);
  ellipse(0, 0, 350, 350);
  popMatrix();
}

void circleY(){ 
  a = a+(random(0.003,0.008));
  pushMatrix();
  noFill();
  stroke(0,0,0);
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
   stroke(0,0,0);
  ellipseMode(CENTER);
  ellipse(0, 0, 200, 200);
 
  popMatrix();

}

