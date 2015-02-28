
int w1=75;
int l1=25;
int w2=50;
int l2=20;
float Line=0;
int Sun=50;
float Sun1=0;
int speed=1;

void setup() {
  size(800, 600);
  background(232, 210, 169);
}

void draw() {
  smooth();
  noStroke();
  fill(224, 163, 7);
  rect(0, 450, 800, 150);
  stroke(0);
  strokeWeight(2);
  fill(198, 130, 2);

  line(Line, 0, 0, 600);
  Line= Line + 1.3;

  fill(224, 163, 7);
  rect(0, 450, 800, 150);

  //Pyramid 2
  rect(350, 465, w2, l2);
  rect(400, 465, w2, l2);
  rect(450, 465, w2, l2);
  rect(380, 445, w2, l2);
  rect(430, 445, w2, l2);
  rect(480, 445, w2, l2);
  rect(410, 425, w2, l2);
  rect(460, 425, w2, l2);
  rect(510, 425, w2, l2);
  rect(440, 405, w2, l2);
  rect(490, 405, w2, l2);
  rect(530, 405, w2, l2);
  rect(470, 385, w2, l2);
  rect(520, 385, w2, l2);
  rect(500, 365, w2, l2);
  triangle(510, 365, 540, 365, 525, 345);



  //Pyramid 1
  fill(216, 143, 7);
  rect(450, 500, w1, l1);
  rect(525, 500, w1, l1);
  rect(600, 500, w1, l1);
  rect(675, 500, w1, l1);
  rect(750, 500, w1, l1);
  rect(475, 475, w1, l1);
  rect(550, 475, w1, l1);
  rect(625, 475, w1, l1);
  rect(700, 475, w1, l1);
  rect(775, 475, w1, l1);
  rect(500, 450, w1, l1);
  rect(575, 450, w1, l1);
  rect(650, 450, w1, l1);
  rect(725, 450, w1, l1);
  rect(525, 425, w1, l1);
  rect(600, 425, w1, l1);
  rect(675, 425, w1, l1);
  rect(750, 425, w1, l1);
  rect(550, 400, w1, l1);
  rect(625, 400, w1, l1);
  rect(700, 400, w1, l1);
  rect(775, 400, w1, l1);
  rect(575, 375, w1, l1);
  rect(650, 375, w1, l1);
  rect(725, 375, w1, l1);
  rect(600, 350, w1, l1);
  rect(675, 350, w1, l1);
  rect(750, 350, w1, l1);
  rect(625, 325, w1, l1);
  rect(700, 325, w1, l1);
  rect(775, 325, w1, l1);
  rect(650, 300, w1, l1);
  rect(725, 300, w1, l1);
  rect(675, 275, w1, l1);
  rect(750, 275, w1, l1);
  rect(700, 250, w1, l1);
  rect(775, 250, w1, l1);
  rect(725, 225, w1, l1);
  rect(750, 200, w1, l1);
  rect(775, 175, w1, l1);

  //Essfinge
  fill(247, 231, 5);
  quad(100, 345, 300, 345, 330, 450, 70, 450);
  //Knees
  quad(210, 400, 240, 400, 345, 500, 210, 500);
  quad(150, 400, 180, 400, 180, 500, 40, 500);
  //Fingers
  rect(22, 500, 40, 70);
  rect(60, 500, 40, 70);
  rect(140, 500, 40, 70);
  rect(100, 500, 40, 70);
  rect(210, 500, 40, 70);
  rect(250, 500, 40, 70);
  rect(290, 500, 40, 70);
  rect(330, 500, 38, 70);

  //Body
  rect(120, 320, 160, 100);
  triangle(170, 200, 170, 350, 50, mouseX);
  triangle(220, 200, 220, 350, 340, mouseX);
  //face
  quad(130, 230, 150, 320, 240, 320, 260, 230);
  line(145, 245, 182, 250);
  line(212, 250, 250, 245);
  fill(0);
  ellipse(230, 257, 6, 6);
  ellipse(165, 257, 6, 6);
  line(147, 260, 178, 260);
  line(216, 260, 246, 260);
  line(182, 250, 187, 290);
  line(212, 250, 207, 290);
  line(187, 290, 207, 290);
  line(180, 300, 214, 300);
  line(182, 305, 212, 305);

  //Sun
  fill(255, 255, Sun1);
  ellipse (Sun1, 50, 100, 100);
  if (Sun1 > width) {
    speed = speed* - 1;
  }
  else if (Sun1 < 0) {
    speed = speed* - 1;
  }
  Sun1 = Sun1 + speed;
}

void mouseDragged() {
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
  fill(245);
}
void keyPressed() {
  background(232, 210, 169);
} 




