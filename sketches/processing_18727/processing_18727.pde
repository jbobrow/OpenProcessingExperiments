
float G = +50;
float R = -50;

void setup() {
  size(250,250);
  background (0);
  smooth();
}

void draw () {
  if (mousePressed) {
    stroke(200,200,0);
    strokeWeight(2);
    line(mouseX,250,mouseX,mouseY-50);
    stroke(0,100,150);
    strokeWeight(2);
    line(mouseX,0,mouseX,mouseY+50);
     stroke(255,0,0);
    strokeWeight(5);
    point(mouseX,mouseY+R++);
    stroke(0,200,0);
    strokeWeight(5);
    point(mouseX,mouseY+G--);
  }
  fill(0,5);
  noStroke();
  rect(0,0,250,250);
}


