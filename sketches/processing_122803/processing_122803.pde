
void setup() {
  size(500, 500);
}

void draw() {
  background(255, 255, 255);

  //buik
  stroke(0);
  strokeWeight(5);
  fill(255, 155, 0);
  ellipse(mouseX+250, mouseY+250, 200, 200);

  //buik licht
  stroke(0);
  strokeWeight(2);
  fill(255, 200, 80);
  ellipse(mouseX+250, mouseY+300, 100, 100);

  //hoofd
  stroke(0);
  strokeWeight(5);
  fill(255, 155, 0);
  ellipse(mouseX+250, mouseY+100, 150, 150);
  
  //mond
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(mouseX+250, mouseY+150, 25, 35);

  //oogwit
  stroke(0);
  strokeWeight(5);
  fill(255, 255, 255);
  ellipse(mouseX+250, mouseY+90, 50, 50);

  //oogzwart
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(mouseX+250, mouseY+90, 10, 10);
  //navel
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(mouseX+250, mouseY+320, 10, 10);

  //armlinks
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(mouseX+150, mouseY+150, mouseX+180, mouseY+180);

  //armrechts
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(mouseX+320, mouseY+180, mouseX+350, mouseY+150);

  //beenlinks
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(mouseX+190, mouseY+380, mouseX+220, mouseY+345);

  //beenlinks
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(mouseX+310, mouseY+380, mouseX+280, mouseY+345);

  println("x" + mouseX);
  println("y" + mouseY);
}

