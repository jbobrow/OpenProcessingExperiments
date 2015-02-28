
float B;
void setup() {
  size(550,450);
  //size(screen.width,screen.height,P2D);
  noFill();
  smooth();
}
void draw() {
  B += 1*(mouseX/(screen.width/TWO_PI)*-1);  
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  float A = 2;
  for(int i = 0;i<500;i++) {
    A += A/1000.0;
    stroke(255);
    translate(tan(A)*exp(A),0);
    rotate(radians(B)*exp(tan(A)));  
    beginShape(POLYGON);
    curveVertex(exp(0.1*A)*sin(A),exp(0.1*A)*cos(A));
    endShape()
    point(3,3);
  }
  popMatrix();
  //print("(B+=" + B + ") ");
  //print("(A+=" + A + ") ");
}



