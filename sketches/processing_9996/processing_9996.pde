
float x = 200;
float y = 200;
float ang;

void setup() {
  size (400,400);
  smooth(); 
  noStroke();
  fill(255,0,0);
}

void draw() {
  background(255);
  
  float ang = atan2(mouseY-y, mouseX-x);
  translate(200,200);
  rotate(ang);
  dibujaFlecha();

}

void dibujaFlecha() {
  beginShape();
  rotate(radians(-90));
  vertex(30,0);
  vertex(30,50);
  vertex (50,50);
  vertex(0,100);
  vertex(-50,50);
  vertex(-30,50);
  vertex(-30,0);
  endShape(CLOSE);
  
}


