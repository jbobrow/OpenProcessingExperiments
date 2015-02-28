
void setup() {
  size(600, 600);
}

void draw() {
  if (mousePressed) {
    fill(192,231,250,50);
  }
  else {
    fill(255,216,241,50);
  }
  rect(0,0,width,height);

  if (mousePressed) {
    stroke(255, 255, 255,50);
    fill(240, 114, 162,50);

    ellipse(mouseX, mouseY, 520, 520);
  }
  else {
    fill(255,255,255,50);
    ellipse(mouseX, mouseY, 520, 520);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(250,250,172);

    ellipse(mouseX, mouseY, 440, 440);
  }
  else {
    fill(250, 236, 76,100);
    ellipse(mouseX, mouseY, 440, 440);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(123, 250, 96);

    ellipse(mouseX, mouseY, 360, 360);
  }
  else {
    fill(201,250,192);
    ellipse(mouseX, mouseY, 360, 360);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(192,231,250);

    ellipse(mouseX, mouseY, 280, 280);
  }
  else {
    fill(66,168,234);
    ellipse(mouseX, mouseY, 280, 280);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(234,159,66);

    ellipse(mouseX, mouseY, 200, 200);
  }
  else {
    fill(123,250,96);
    ellipse(mouseX, mouseY, 200,200);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(255,255,255);

    ellipse(mouseX, mouseY, 120, 120 );
  }
  else {
    fill(250, 236, 76);
    ellipse(mouseX, mouseY, 120,120);
  }
  if (mousePressed) {
    stroke(255, 255, 255);
    fill(240,150,241,50);

    ellipse(mouseX, mouseY, 40, 40);
  }
  else {
    fill(255,255,255);
    ellipse(mouseX, mouseY, 40,40);
  }
}
