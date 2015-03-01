

float angle = 1;
float speed = 0.005;

void setup() {
  size(640, 640);
  noStroke();
  fill(255, 250, 0);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(0, 0, 255);

  
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle);
  
  rect(0,0,360,360);
  popMatrix();
  
  if (mousePressed) {
  
  speed = speed + 0.05;
  }
  
  angle = angle + speed;

}
