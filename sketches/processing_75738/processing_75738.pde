
void setup () {
  //smooth();
  size(800, 600);
}
void draw () {
  background (255);
  stroke(255);
  fill(mouseY, 20, 150, 200);
  ellipse(width/3, height/3, mouseX, mouseY);
  fill (14, 146, mouseY*2);
  ellipse(mouseX, mouseY, 90, 110);
  fill (30, 50, mouseX*2);
  ellipse(600, 400, mouseY/2, mouseX/2);
  fill (mouseY*2, 245, 20);
  ellipse(400, 200, mouseY/3, mouseX/3);
  ellipse(200, 100, mouseY, mouseX);
  //ellipse(200, 400, 30, 20);
  //saveFrame("bild.png");
}



