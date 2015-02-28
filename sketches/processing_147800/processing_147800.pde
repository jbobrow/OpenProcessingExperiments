
void setup() {  //This is a function of type "void" setup once
  size(500, 500);
  size(500, 500);

  //Form des Gesichts//

  fill(252, 235, 214);
  ellipse(250, 250, 400, 500);

  //nase//

  line(250, 250, 250, 300);
}

void draw() {
  //linkes Auge//
  stroke(0);
  fill(255);
  ellipse(155, 250, 100, 50);
  fill(149, 217, 250);
  stroke(12, 15, 62);
  ellipse(map(mouseX, 0, 500, 140, 165), map(mouseY, 0, 500, 245, 255), 40, 40);
  noStroke();
  fill(0);
  ellipse(map(mouseX, 0, 500, 140, 165), map(mouseY, 0, 500, 245, 255), 15, 15);
  fill(255);
  ellipse(150, 245, 10, 10);


  //rechtes Auge//
  stroke(0);
  fill(255);
  ellipse(345, 250, 100, 50);
  fill(149, 217, 250);
  stroke(12, 15, 62);
  ellipse(map(mouseX, 0, 500, 330, 360), map(mouseY, 0, 500, 245, 255), 40, 40);
  noStroke();
  fill(0);
  ellipse(map(mouseX, 0, 500, 330, 360), map(mouseY, 0, 500, 245, 255), 15, 15);
  fill(255);
  ellipse(340, 245, 10, 10);

  //Mund//
  if (mousePressed == true) {
    stroke(252, 235, 214);
    fill(252, 235, 214);
    bezier(200, 390, 250, 400, 250, 400, 300, 390);
    stroke(0);
    fill(242, 152, 173);
    ellipse(250, 400, 100, 40);
  } 
  else {
    stroke(252, 235, 214);
    fill(252, 235, 214);
    ellipse(250, 400, 100, 40);
    stroke(0);
    noFill();
    bezier(200, 390, 250, 400, 250, 400, 300, 390);
  }
}

