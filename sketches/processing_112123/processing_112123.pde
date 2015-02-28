
float x1 = 90;
float y1 = 90;
float area = 63;

void setup() {
  size(300, 500);
}

void draw() {
  background(255);
  if ((mouseY > height*.25-area) && (mouseY < height*.25+area)) {
    fill (255, 53, 103);
    noStroke();
    ellipse(width / 2, height*.25, x1, y1);
  }

  if ((mouseY > height*.50-area) && (mouseY < height*.50+area) && (mouseX < 200) && (mouseX > 100)) {
    fill (255, 230, 50);
    noStroke();
    ellipse(width / 2, height / 2, x1, y1);
  }
  
  if ((mouseY > height*.50-area) && (mouseY < height*.50+area) && (mouseX < 100)) {
    fill (255, 180, 50);
    noStroke();
    ellipse(width*.15, height / 2, 70, 70);
  }
  
  if ((mouseY > height*.50-area) && (mouseY < height*.50+area) && (mouseX > 200)) {
    fill (220, 250, 50);
    noStroke();
    ellipse(width*.85, height / 2, 70, 70);
  }

  if ((mouseY > height*.75-area) && (mouseY < height*.75+area)) {
    fill (220, 215, 0);
    noStroke();
    ellipse(width / 2, height*.75, x1, y1);
  }
  
}
