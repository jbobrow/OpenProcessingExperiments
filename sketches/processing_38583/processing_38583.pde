
/* Demonstrating the use of mouseButtons*/

void setup() {
  size(200,200);
  smooth();
  strokeWeight(30);
}

void draw() {
  background(204);
  stroke(102);
  fill(14,12,255);
  ellipse(100, 40, 60,60);
  if (mousePressed){
    if (mouseButton == LEFT) {
      stroke(245,15,12);
    } else {
      stroke(0,12,14);
    }
    fill(25,0,100);
    rect(100,40,70,70);
  }
 
}

