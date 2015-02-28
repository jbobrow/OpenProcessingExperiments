

float x=5;
float y=100;


void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  fill(0);
  rect(0, 0, width, height);

  for (float j=x; j>=0 && j<=mouseX; j+=5) {
    background(random(x, j), 0,0, 50);
  }

  for (float i=x; i>=0 && i<=width; i+=5) {
    stroke(255);
    noFill();
    triangle(i, 0, mouseX, mouseY, i, height);
  }


 for (float h=y; h>=50 && h<=width; h+=25) {
    fill(0,200);
    ellipse(mouseX, h, x,x);
    ellipse(h, mouseY, x,x);
  }
}



