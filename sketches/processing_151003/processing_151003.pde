
void setup() {
  size(600, 600);
  smooth();
}

void draw(){
  noStroke();
  background(0, 255, 0);
  fill(200, 255, 200);
  for(float a = 0; a<=width+60; a = a + 68){
    for(float b = 0; b<=height+60; b = b + 68){
      shape(a,b);
    }
  }
}

void shape(float x, float y){
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(0, -40);
  vertex(-34, -20);
  vertex(-34, 20);
  vertex(0, 40);
  vertex(34, 20);
  vertex(34, -20);
  endShape();
  popMatrix();
}
