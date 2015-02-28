
void setup() {
  size(280, 280);
}

void draw() {
  background(255, 255, 255);
  
  //Oren
  strokeWeight(2);
  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(mouseX-80, mouseY-80, 100, 100);

  stroke(0);
  noFill();
  fill(0, 125, 40);
  ellipseMode(CENTER);
  ellipse(mouseX+80, mouseY-80, 100, 100);

  //Lichaam
  stroke(0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 200, 200);

  //Oog
  strokeWeight(1);
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-45, 150, 50);

  //Kleur oog
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-45, 45, 45);

  //Pupil oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-45, 15, 15);

  //Neusgaten
  noStroke();
  fill(0, 100, 40);
  ellipseMode(CENTER);
  ellipse(mouseX-10, mouseY+10, 10, 10);
  ellipseMode(CENTER);
  ellipse(mouseX+10, mouseY+10, 10, 10);

  //Mond
  stroke(0);
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY+60, 80, 45);

  //Tanden
  noStroke();
  fill(255, 255, 255);
  rect(mouseX-9, mouseY+37, 8, 15);
  rect(mouseX+1, mouseY+37, 8, 15);
  println("Test");
  
}

