


void setup () {
  size(500,500);
}


void draw () {
  //background(255);
  //println(mouseX + "," + mouseY);
  //ellipse(mouseX, mouseY, 10, 10);
  stroke(mouseX, mouseY, 0);
  //strokeWeight(abs(mouseX-pmouseY));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed () {
  fill(255);
  println("pressed mousey");
  ellipse(mouseX,mouseY, 50,50);
  fill(0);
  ellipse( mouseX-15, mouseY, 10, 30);
  ellipse( mouseX+15, mouseY, 10, 30);
}

void keyPressed() {
  println("key pressed");
  //background(255);
  fill(0,255,0,125);
  ellipse(mouseX, mouseY, 10, 10);
  noFill();
}

