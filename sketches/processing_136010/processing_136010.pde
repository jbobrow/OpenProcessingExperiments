
//Rachel Hill. HW #5. feb. 24,2014 hill.1523@osu.edu
//text, translate, rotate, pop&pushmatrix

void setup() {
  size(600, 600);
  background(255);
  frameRate(45);
}

void draw() {
  fill(255, 5);
  rect(0, 0, -700, -700);

  translate(random(600), random(600));
  rotate(random(.02));
  text("B");
  stroke(0, 0, random(255), random(100));
  strokeWeight(10);
  line(0, random(600), 0, random(600));
  pushMatrix();

  translate(random(-300), random(300));
  rotate(random(.05));
  text("G");
  stroke(0, random(255), 0, random(100));
  strokeWeight(10);
  line(random(600), 0, random(600), 0);
  popMatrix();


  translate(random(-100), random(700));
  rotate(random(.07));
  text("R");
  stroke(random(255), 0, 0, random(100));
  strokeWeight(10);
  rect(30, 30, 30, 30);
}

void text(String x) {
  fill(255, 100);
  text(x, 10, 10);
  noFill();
}

