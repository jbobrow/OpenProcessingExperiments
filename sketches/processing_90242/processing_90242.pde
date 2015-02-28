
color[]engineer ={#BAC45E, #ADA344, #734A22, #4C2D22, #261B1D};
color[] palette=engineer ;

void setup() {
  size(400,200);
  frameRate(5);
  background(palette[0]);
}

void draw() {
  noStroke();
  fill(palette[1]);
  ellipse(mouseX, mouseY, 20, 10);
  fill(120);
  ellipse(pmouseX, pmouseY, 10, 10);
  stroke(120);
  line(mouseX,mouseY, pmouseX, pmouseY);
}

void mousePressed(){
  background(palette[0]);
}
