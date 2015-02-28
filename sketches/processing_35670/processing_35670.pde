
//Botticelli's Birth of Venus, in Processing

void setup() {
  smooth();
  size(800, 350);
}

void draw() {

  fill(118, 167, 182);
  rect(0, 0, width, 150); //sky and background

  fill(120, 152, 141);
  stroke(120, 152, 141);
  rect(0, 150, 600, 200); //sea

  fill(90, 104, 43);
  stroke(90, 104, 43);
  rect(600, 150, 200, 200);
  triangle(400, 150, 600, 150, 600, 200);
  triangle(500, 350, 600, 350, 600, 300); //ground

  strokeWeight(10);
  stroke(90, 69, 14);
  line(775, 0, 775, 275); //first tree trunk

  strokeWeight(1);
  fill(50, 65, 42);
  stroke(50, 65, 42);
  rect(650, 0, 150, 75);
  triangle(500, 0, 650, 0, 650, 75); //treecover

  strokeWeight(10);
  stroke(90, 69, 14);
  line(725, 55, 725, 265);
  line(750, 65, 750, 250); //tree trunks

  strokeWeight(1);
  stroke(0);
  fill(241, 143, 72);
  quad(575, 40, 625, 70, 775, 125, 650, 300); //cloth

  fill(226, 224, 203);
  ellipse(650, 75, 50, 50); //face

  fill(255);
  quad(625, 120, 690, 80, 735, 250, 670, 290);
  triangle(575, 40, 625, 125, 650, 125);
  triangle(585, 165, 690, 150, 690, 165); //body

  fill(105, 99, 65);
  quad(0, 25, 175, 0, 150, 100, 0, 100); //wings

  fill(207, 170, 118);
  ellipse(75, 75, 50, 50);
  rect(50, 100, 50, 100); //wind a

  fill(226, 219, 200);
  ellipse(125, 75, 50, 50);
  rect(100, 100, 50, 100); //wind b

  fill(111, 123, 111);
  triangle(50, 200, 150, 200, 75, 300); //winds' cloth

  //these are the object that move
  //original mouseX value was 300, mouse Y was 75

  stroke(184, 152, 67);
  fill(215, 213, 198);
  strokeWeight(4);
  ellipse(mouseX, 275, 300, 125); //shell

  strokeWeight(1);
  stroke(0);
  fill(184, 152, 67);
  triangle(mouseX, 315, mouseX-75, 340, mouseX+75, 340); //shell curl

  fill(230, 191, 100);
  quad(275, mouseY-30, 325, mouseY-30, 340, mouseY+40, 270, mouseY+30);
  rect(270, mouseY+30, 70, 100); //Venus's hair

  fill(222, 208, 182);
  ellipse(300, mouseY, 40, 60);
  rect(270, mouseY+30, 60, 100);
  triangle(270, mouseY+130, 330, mouseY+130, 300, mouseY+240); //Venus's body
}


