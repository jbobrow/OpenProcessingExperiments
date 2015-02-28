
void setup() {
  size(800, 400);
  smooth();
  noStroke();
  noLoop();
}
 
void draw() {
  background(248,185,188);
 
  for ( int i= 0; i<width; i+=80) {
 
    float rw = random(90, 2);
    float rs = random(0.8, 0.3);
    color c = color(random(255), random(255), random(1));
    color st = color(random(255), random(255), random(1));
 
    float flavor = random(90); //20
    float f1 = random(10); //50
 
 
      lollipop(i, 0, flavor, rs, rw, f1, st, c);
  }
}
void lollipop(float xpos, float ypos, float angle, float scaler, float flavor, float f1, color c, color sc) {
  pushMatrix();
 
  translate(xpos, ypos);
 
  rotate(angle);
  scale(scaler);
 
 
 
 
  //lollipop
  stroke(0);
  fill(255,134,15);
    ellipse(170, 170, 200, 200);
 fill(200,168,5);
  ellipse(170, 170, 120, 120);
  fill(224,91,94);
  strokeWeight(.5);
  ellipse(170, 170, 90, 90);
  fill(0,126,211);
    ellipse(170, 170, 50, 50);
      fill(1,141,52);
    ellipse(170, 170, 20, 20);

 //
stroke(255);
strokeWeight(3);
line(170,170,10,6);
popMatrix();
 
}
 
void mousePressed() {
  redraw();
}


