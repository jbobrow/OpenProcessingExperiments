
void setup() {
  size(500, 500);
  background(255);
  
}

void draw() {

  noStroke();
  fill(255,2);
  rect(0,0,width,height);
  if (mousePressed) {
    fill(255);
  } else {
  
    float r = random(255);
    fill(r,r*0.2,r*0.5);
  }
  
  float radius = mouseX/(mouseY*0.3);
  ellipse(mouseX, mouseY,  radius ,radius );
}
