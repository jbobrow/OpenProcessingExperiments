
//Aileena Gray
//Introduction to Digital Media Fall 2012
//Section A
//09/9/2012

int pop;

void setup() {
  size(1200, 600);
  background(36, 166, 234);
  pop=0;
  
  smooth();

  fill(205, 230, 245);
  quad(300, height/2, 450, height/2, 500, 280, 350, 280);
  strokeWeight(1.7);

  line(325, 500, 425, 500); 
  line(425, 500, 460, 486); 

  smooth();
  fill(255);
  beginShape();
  vertex(300, height/2);
  vertex(450, height/2);
  vertex(425, 500);
  vertex(325, 500);
  endShape(CLOSE);

  fill(255);
  beginShape();
  vertex(450, height/2);
  vertex(500, 280);
  vertex(460, 486);
  vertex(425, 500);
  endShape(CLOSE);

  fill(255, 0, 0);
  beginShape();
  vertex(300, height/2);
  vertex(330, 300);
  vertex(345, 500);
  vertex(325, 500);
  endShape(CLOSE);

  fill(255, 0, 0);
  beginShape();
  vertex(360, height/2);
  vertex(390, height/2);
  vertex(385, 500);
  vertex(365, 500);
  endShape(CLOSE);

  fill(255, 0, 0);
  beginShape();
  vertex(420, height/2);
  vertex(450, height/2);
  vertex(425, 500);
  vertex(405, 500);
  endShape(CLOSE);

  fill(255, 0, 0);
  beginShape();
  vertex(467, 293);
  vertex(483, 287);
  vertex(449, 491);
  vertex(436, 495);
  endShape(CLOSE);
}


void mouseClicked() {
  smooth();
  pop= pop+1;

  fill(245, 240, 94);
  ellipse(mouseX-13, mouseY+18, 55, 50);

  fill(252, 551, 201);
  ellipse(mouseX-9, mouseY+10, 42, 49);

  fill(255);
  ellipse(mouseX+13, mouseY, 35, 40);

  fill(237, 230, 53);
  ellipse(mouseX-13, mouseY-10, 35, 40);

  fill(255);
  ellipse(mouseX-14, mouseY-10, 20, 35);

  fill(229, 227, 120);
  ellipse (mouseX+10, mouseY-10, 35, 30);

  fill(0);
  ellipse (mouseX, mouseY, 18, 18);

  fill(229, 228, 197);
  ellipse(mouseX-10, mouseY+10, 30, 35);

  fill(255);
  ellipse(mouseX+7, mouseY-10, 15, 30);

  fill(28, 25, 24);
  rect(mouseX+5, mouseY+7, 3, 3);



  fill(0);
  beginShape();
  vertex(mouseX-3, mouseY);
  vertex(mouseX, mouseY-3);
  vertex(mouseX+3, mouseY);
  vertex(mouseX, mouseY+3);
  endShape(CLOSE);
}

void draw() {
//I did draw the popcorn in "draw", but because I wanted them
//to show up before the box I transfered them to "setup" so the box
//simply became part of the background.
}

void keyPressed() {
  if (key == 's') {
    save("gray/Omar.png");
  }
}

