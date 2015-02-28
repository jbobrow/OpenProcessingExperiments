
//Homework 3 - 60-257
// copyright Eric Mackie September 2011 Pittsburgh, PA 15221

void setup() {
  size (400, 400);
  frameRate(20);
  noCursor();
}

void draw() {
  noCursor();
  noStroke();
  fill(random(255), random(255), random(255));
  triangle(0, height, 0, 0, mouseX, mouseY);
  fill(random(255), random(255), random(255));
  triangle(0, 0, width, 0, mouseX, mouseY);
  fill(random(255), random(255), random(255));
  triangle(width, height, width, 0, mouseX, mouseY);
  fill(random(255), random(255), random(255));
  triangle(width, height, 0, height, mouseX, mouseY);
  strokeWeight(5);
  stroke(random(255), random(255), random(255));
  line(width/2, 0, mouseX, mouseY);
  stroke(random(255), random(255), random(255));
  line(0, height/2, mouseX, mouseY);
  stroke(random(255), random(255), random(255));
  line(width, height/2, mouseX, mouseY);
  stroke(random(255), random(255), random(255));
  line(width/2, height, mouseX, mouseY);
  stroke(random(255), random(255), random(255));


  if (mousePressed) {
    noCursor();
    noStroke();
    float col = map(mouseX, 0, 400, 0, 255);
    float coly = map (mouseY, 0, 400, 0, 255);
    fill(col, coly, 0);
    rect(0, 0, width, height);
    cursor();
    fill(0);
    ellipse(mouseX, mouseY, 30, 30);
    strokeWeight(3);
    stroke(100);
    line(mouseX, mouseY-15, mouseX-5, mouseY-30);


    fill(255, 140, 0);
    noStroke();
    triangle(mouseX-5, mouseY-30, mouseX-12, mouseY-23, mouseX-8.5, mouseY-30);
    triangle(mouseX-5, mouseY-30, mouseX+2, mouseY-23, mouseX-.5, mouseY-30);
    triangle(mouseX-5, mouseY-30, mouseX-8.5, mouseY-30, mouseX-12, mouseY-37);
    triangle(mouseX-5, mouseY-30, mouseX-.5, mouseY-30, mouseX+2, mouseY-37);
  }
  noCursor();
}

                
