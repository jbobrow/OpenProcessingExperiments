
//Jessica Xiao Yang
//Feb 17, 2013
//Divided Screen

void setup() {
  size(900, 600);
  background(255);
}

void draw() {
  noStroke();

  //one
  if ((mouseX<300)&&(mouseY<300)) { 
    fill(180, 184, 209, 25);
    rect(0, 0, 300, 300);
    strokeWeight(2);
    fill(255);
    ellipse(150, 150, mouseX, mouseY);
  }
  //three
  fill(152, 144, 157);
  rect(600, 0, 300, 300);
  if ((mouseY<300)&&(mouseX>600)&&(mouseX<900)) {
    fill(255); 
    stroke(255);
    strokeWeight(4);
    line(750, 150, mouseX, mouseY);
  }
  //two
  noStroke();
  if ((mouseY<300)&&(mouseX>300)&&(mouseX<600)) {
    fill(0, random(255), random(255), 50);
    ellipse(mouseX, mouseY, 10, 10);
  }

  //five
  fill(46, 100, 126);
  rect(300, 300, 300, 300);
  if ((mouseY>300)&&(mouseX>300)&&(mouseX<600)) {
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(mouseX-25, mouseY-25, 50, 50);
  }
  //six
  if ((mouseY>300)&&(mouseX>600)&&(mouseX<900)) {
    fill(0, random(255), random(255), 3);
    ellipse(750, 450, mouseX-600, mouseY-600);
  }

  //four
  if ((mouseY>300)&&(mouseX<300)) {
    fill(203, 187, 198); 
    stroke(203, 187, 198);
    strokeWeight(1);
    line(100,450, mouseX, mouseY);
  }
}
