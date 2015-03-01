
void setup(){
  size(500,500);
  background(255);
  noFill();
}

void draw(){
  pushMatrix();
    stroke(0,50);
    strokeWeight(0.50);
    fill(255,5);
    rect(0,0,width,height);
    for (float i=0; i<=200; i+=5){
    translate(i*cos(i+80), +i*tan(i/20));
    stroke(10, random(10,255));
    rotate(3);
    fill(0,50);
    polygon(width/4, height/4, mouseX/3, 6);
  }
  popMatrix();

}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
