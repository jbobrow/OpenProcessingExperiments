
int w1=75;
int l1=25;
int w2=50;
int l2=20;

int x=100;
int y=50;
int x2=110;
int y2=60;
int tx=220;
int ty=300;
int tx2=150;
int ty2=450;
int tx3=300;
int ty3=450;
int w3=80;
int h3=30;
int space=200;
int space2=200;



void setup() {
  size(800, 600);
  background(13,149,259);
}

void draw() {
  noStroke();
  fill(224, 163, 7);
  rect(0, 450, 800, 150);
  stroke(0);
  strokeWeight(2);
  fill(198, 130, 2);
  noStroke();
  while(x < 800){
  fill(255,255,255,200);
  ellipse(x,y,w3,h3);
  x=x+space;
  }
  while(x2 < 800){
  fill(255,255,255,200);
  ellipse(x2,y2,w3,h3);
  x2=x2+space;
  }
  
  stroke(0);
  while(tx < 800){
  fill(232,153,5);
  triangle(tx,ty,tx2,ty2,tx3,ty3);
  tx=tx+space2;
  tx2=tx2+space2;
  tx3=tx3+space2;
  }

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
  triangle(170, 200, 170, 350, 50, 250);
  triangle(220, 200, 220, 350, 340, 250);
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
  noStroke();
  fill(255, 255, 50,240);
  ellipse (50, 50, 100, 100);
}



