
void setup() {
  size(250, 250);
  background(0);
  noStroke();
  frameRate(50);	
  smooth();
}

int a = 0;


void draw() {
      stroke(28, 49, 32);
      rect(a++%width, -10, 0, 1); 
      stroke(37, 64, 42);
      rect(a++%width, 0, 0, 1);
      stroke(54, 95, 62);
      rect(a++%width, 10, 0, 1);
      stroke(73, 131, 84);
      rect(a++%width, 20, 0, 1);
      stroke(108, 165, 119);
      rect(a++%width, 30, 0, 1);
  stroke(159, 242, 175);
  rect(a++%width, 40, 0, 1);
  stroke(108, 165, 119);
  rect(a++%width, 50, 0, 1); 
  stroke(73, 131, 84);
  rect(a++%width, 60, 0, 1);
  stroke(54, 95, 62);
  rect(a++%width, 70, 0, 1);
  stroke(37, 64, 42);
  rect(a++%width, 80, 0, 1);
  stroke(28, 49, 32);
  rect(a++%width, 90, 0, 1);
  stroke(95, 91, 55);
  rect(a++%width, 100, 0, 1);
  stroke(144, 138, 85);
  rect(a++%width, 110, 0, 1);
  stroke(201, 192, 110);
  rect(a++%width, 120, 0, 1);
  stroke(219, 206, 82);
  rect(a++%width, 130, 0, 1);
  stroke(240, 220, 39);
  rect(a++%width, 140, 0, 1);
  stroke(255, 230, 0);
  rect(a++%width, 150, 0, 1);
    stroke(240, 220, 39);
    rect(a++%width, 160, 0, 1);
    stroke(219, 206, 82);
    rect(a++%width, 170, 0, 1);
    stroke(201, 192, 110);
    rect(a++%width, 180, 0, 1);
    stroke(144, 138, 85);
    rect(a++%width, 190, 0, 1);
    stroke(95, 91, 55);
    rect(a++%width, 200, 0, 1);
    stroke(65, 2, 90);
    rect(a++%width, 210, 0, 1);
    stroke(106, 4, 147);
    rect(a++%width, 220, 0, 1);
    stroke(152, 4, 211);
    rect(a++%width, 230, 0, 1);
    stroke(182, 0, 255);
    rect(a++%width, 240, 0, 1);
}

