

float x=20;


void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(0, 50);
  fill(random(0, 25), random(25, 75), random(0, 75), 175);
  for (float i=x; i<=width; i+=60) {
    stroke(x,i);
    rect(random(0, i), mouseY, random(width/2, width), i, width/2, random(0, height/2), i, height/2);
    rect(random(-i, width), mouseY, random(width/2, width), i, width/2, random(0, height/2), i, height/2);
  }

  for (float j=x; j<=width; j+=20) {
    noStroke();
    fill(random(100, 200), random(100, 150), random(0, 20), 90);
    beginShape();
    vertex(j, j);
    vertex(200, j);
    vertex(400, 100);
    vertex(mouseX, mouseY);
    vertex(mouseX, mouseY);
    vertex(50, 100);
    vertex(j, j);
    endShape();
  }
}



