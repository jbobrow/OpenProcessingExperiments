
float b =200;
float h = 30;
float w = 30;

void setup() {
  background(30, 80, 90);
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {
 
  stroke(255);
  
  fill(120, 30, b);
  ellipse(mouseX, mouseY, h, w);
  rectMode(CENTER);

  if (mousePressed) {
    b-=5;
    h+=2;
    w+=2;
  }
  else {


    if (h>30) {
      h-=2;
      w-=2;
      b+=15;
      if (b>240) {
        b=240;
      }
    }
  }
}
