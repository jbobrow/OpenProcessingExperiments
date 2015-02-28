
void setup() {
  size(800,800);
  smooth();
  background(255);
}

void draw() {
  fill(255,13);
  rect(0,0, 800,800);
  int i = mouseX;
  int j = mouseY;

  if (i < 50 && j < 50) {
    fill(random(255),random(100));
    ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
    ellipse(mouseX - 10, mouseY - 10, 20,20);
  }  
  else if (i <100 && j < 100) {
    fill(random(230),random(90));
    ellipse(mouseX + 10, mouseY + 10, 20,20);
    ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <150 && j < 150) {
      fill(random(205),random(70));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <200 && j < 200) {
      fill(random(195),random(55));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <250 && j < 250) {
      fill(random(150),random(50));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <300 && j < 300) {
      fill(random(165),random(45));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <350 && j < 350) {
      fill(random(155),random(40));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <400 && j < 400) {
      fill(random(145),random(35));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <450 && j < 450) {
      fill(random(135),random(25));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <500 && j < 500) {
      fill(random(125),random(55));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <550 && j < 550) {
      fill(random(105),random(65));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <600 && j < 600) {
      fill(random(95),random(75));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <650 && j < 650) {
      fill(random(75),random(15));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <700 && j < 700) {
      fill(random(65),random(5));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
  else if (i <750 && j < 750) {
      fill(random(35),random(1));
      ellipse(mouseX + 10, mouseY + 10, random(60),random(60));
      ellipse(mouseX - 10, mouseY - 10, 20,20);
  }
  else if (i <800 && j < 800) {
      fill(random(100),random(55));
      ellipse(mouseX + 10, mouseY + 10, 20,20);
      ellipse(mouseX - 10, mouseY - 10, random(60),random(60));
  }
}

