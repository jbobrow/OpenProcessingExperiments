
void setup() {
  smooth();
  size(600, 400);
  background(255);
}
void draw() {
  background(255);
  smooth();
  for (int i=0; i<800; i++) {
    pushMatrix();
    translate(random(-150, width), random(-150, height));
    noStroke();
    fill(int(random(242, 255)), int(random(100, 255)), int(random(100, 250)), 100);
    float x1= random(0, 150);
    float y1=random(0, 150);
    float x2= random(x1, 200);
    float y2=random(y1, 200);
    float x3=random(x2, 200);
    float y3=random(y2, 200);
    float x4=random(0, x2);
    float y4=random(0, y3-60);
    float x5=random(0, x4);
    float y5= random(0, y4);
    float x6=random(0, 150);
    float y6=random(0, 150);
    beginShape();
    curveVertex (x1, y1);
    curveVertex (x2, y2 );
    curveVertex (x3, y3 );    
    curveVertex (x4, y4 );    
    curveVertex (x5, y5 );    
    curveVertex (x6, y6 );    
    curveVertex (x1, y1);
    endShape(CLOSE);
    noLoop();
    popMatrix();
  }

}


