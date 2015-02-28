
float speed=10;
int diameter=600;
float x;
float y;

int [] xx=new int[100];
int [] yy=new int[100];

void setup() {
  size(1050, 700);

  noCursor();

  x=width/2;
  y=height/2;
}


void draw() {

  background(0);

  fill(x, y, 50);
  x+=random(-speed, speed);
  y+=random(-speed, speed);
  x=constrain(x, 200, width);
  y=constrain(y, 0, height);
  ellipse(x, y, diameter, diameter);



  for (int i=99; i>0; i--) {
    xx[i] =xx[i-1];
    yy[i] =yy[i-1];
  }

  xx[0]=mouseX;
  yy[0]=mouseY;

  for (int i=99; i>0; i-=7) {

    pushMatrix();

    translate(xx[i], yy[i]);

    fill(xx[i], yy[i], mouseX,80);

    ellipse(100, 100, 100, 100);

    popMatrix();
  }

  circleman();
  triangleman();
  squareman();
  circleman2();
  triangleman2();
  squareman2();
  circleman3();


  if (mousePressed) {

    background(255);

    fill(x, y,#FF0000);
    x+=random(-speed, speed);
    y+=random(-speed, speed);
    x=constrain(x, 200, width);
    y=constrain(y, 0, height);
    ellipse(x, y, diameter, diameter);

    circleman2();
    circlemanB();
    trianglemanB();
    squaremanB();
    triangleman2B();
    squareman2B();
    circleman3B();  

    fill(#FF0000);
    textSize(random(400, 400));
    textAlign(CENTER);
    text("Hello", random(width), random(height));
  }
}

//circle man2
void circleman2() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(525, 700, 525, 405);
  //head
  noStroke();
  fill(0);
  ellipse(525, 450, 100, 100);
  //body
  ellipse(525, 700, 130, 130);
  //button
  fill(#FF0000);
  ellipse(525,650,10,10);
  ellipse(525,665,10,10);
  ellipse(525,680,10,10);
  //mouth
  ellipse(525, 487, 20, 20);
  //mosaic
  fill(#0006FF);
  rect(460, 425, 10, 50);
  fill(#008EFF);
  rect(470, 425, 10, 50);
  fill(#00ECFF);
  rect(480, 425, 10, 50);
  fill(#00FFB0);
  rect(490, 425, 10, 50);
  fill(#00FF01);
  rect(500, 425, 10, 50);
  fill(#87FF00);
  rect(510, 425, 10, 50);
  fill(#F6FF00);
  rect(520, 425, 10, 50);
  fill(#FFBC00);
  rect(530, 425, 10, 50);
  fill(#FF6F00);
  rect(540, 425, 10, 50);
  fill(#FF0000);
  rect(550, 425, 10, 50);
  fill(#FF00A6);
  rect(560, 425, 10, 50);
  fill(#FF00FB);
  rect(570, 425, 10, 50);
  fill(#7600FF);
  rect(580, 425, 10, 50);

  popMatrix();
  
}

//circle man

void circleman() {

  pushMatrix();

  translate(0, 0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(75, 700, 75, 350);
  //head
  noStroke();
  fill(0);
  ellipse(75, mouseX+ 400, 80, 150);
  //body
  ellipse(75, 700, 130, 200);
  //ribbon
  fill(#FF0000);//red
  triangle(75, 635, 50, 615, 50, 655);
  triangle(75, 635, 100, 615, 100, 655);
  //mouth
  ellipse(75, 450, 10, 20);
  //mosaic
  fill(#008EFF);
  rect(20, 360, 10, 70);
  fill(#00ECFF);
  rect(30, 360, 10, 70);
  fill(#00FFB0);
  rect(40, 360, 10, 70);
  fill(#00FF01);
  rect(50, 360, 10, 70);
  fill(#87FF00);
  rect(60, 360, 10, 70);
  fill(#F6FF00);
  rect(70, 360, 10, 70);
  fill(#FFBC00);
  rect(80, 360, 10, 70);
  fill(#FF6F00);
  rect(90, 360, 10, 70);
  fill(#FF0000);
  rect(100, 360, 10, 70);
  fill(#FF00A6);
  rect(110, 360, 10, 70);
  fill(#FF00FB);
  rect(120, 360, 10, 70);


  popMatrix();
}

//circle man3

void circleman3() {

  pushMatrix();

  translate(0, 0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(975, 700, 975, 450);
  //head
  noStroke();
  fill(0);
  ellipse(975, mouseX+90, 140, 100);
  //body
  ellipse(975, 700, 145, 100);
  //collar
  fill(#FF0000);//red
  rect(960, 640, 30, 10);
  ellipse(975, 660, 20, 20);
  stroke(0);
  strokeWeight(3);
  line(975, 670, 975, 665);
  fill(0);
  ellipse(975, 662, 5, 5);
  //mouth
  noStroke();
  fill(#FF0000);//red
  ellipse(975, 530, 20, 10);
  //mosaic
  fill(#0006FF);
  rect(910, 470, 10, 40);
  fill(#008EFF);
  rect(920, 470, 10, 40);
  fill(#00ECFF);
  rect(930, 470, 10, 40);
  fill(#00FFB0);
  rect(940, 470, 10, 40);
  fill(#00FF01);
  rect(950, 470, 10, 40);
  fill(#87FF00);
  rect(960, 470, 10, 40);
  fill(#F6FF00);
  rect(970, 470, 10, 40);
  fill(#FFBC00);
  rect(980, 470, 10, 40);
  fill(#FF6F00);
  rect(990, 470, 10, 40);
  fill(#FF0000);
  rect(1000, 470, 10, 40);
  fill(#FF00A6);
  rect(1010, 470, 10, 40);
  fill(#FF00FB);
  rect(1020, 470, 10, 40);
  fill(#7600FF);
  rect(1030, 470, 10, 40);



  popMatrix();
}

//circleman3B

void circleman3B() {

  pushMatrix();

  translate(0, 0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(975, 700, 975, 450);
  //head
  noStroke();
  fill(0);
  ellipse(975,490, 140, 100);
  //body
  ellipse(975, 700, 145, 100);
  //collar
  fill(#FF0000);//red
  rect(960, 640, 30, 10);
  ellipse(975, 660, 20, 20);
  stroke(0);
  strokeWeight(3);
  line(975, 670, 975, 665);
  fill(0);
  ellipse(975, 662, 5, 5);
  //mouth
  noStroke();
  fill(#FF0000);//red
  ellipse(975, 530, 20, 10);
  //mosaic
  fill(#0006FF);
  rect(910, 470, 10, 40);
  fill(#008EFF);
  rect(920, 470, 10, 40);
  fill(#00ECFF);
  rect(930, 470, 10, 40);
  fill(#00FFB0);
  rect(940, 470, 10, 40);
  fill(#00FF01);
  rect(950, 470, 10, 40);
  fill(#87FF00);
  rect(960, 470, 10, 40);
  fill(#F6FF00);
  rect(970, 470, 10, 40);
  fill(#FFBC00);
  rect(980, 470, 10, 40);
  fill(#FF6F00);
  rect(990, 470, 10, 40);
  fill(#FF0000);
  rect(1000, 470, 10, 40);
  fill(#FF00A6);
  rect(1010, 470, 10, 40);
  fill(#FF00FB);
  rect(1020, 470, 10, 40);
  fill(#7600FF);
  rect(1030, 470, 10, 40);



  popMatrix();
}

//circlemanB

void circlemanB() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(75, 700, 75, 350);
  //head
  noStroke();
  fill(0);
  ellipse(75,400, 80, 150);
  //body
  ellipse(75, 700, 130, 200);
  //ribbon
  fill(#FF0000);//red
  triangle(75, 635, 50, 615, 50, 655);
  triangle(75, 635, 100, 615, 100, 655);
  //mouth
  ellipse(75, 450, 10, 20);
  //mosaic
  fill(#008EFF);
  rect(20, 360, 10, 70);
  fill(#00ECFF);
  rect(30, 360, 10, 70);
  fill(#00FFB0);
  rect(40, 360, 10, 70);
  fill(#00FF01);
  rect(50, 360, 10, 70);
  fill(#87FF00);
  rect(60, 360, 10, 70);
  fill(#F6FF00);
  rect(70, 360, 10, 70);
  fill(#FFBC00);
  rect(80, 360, 10, 70);
  fill(#FF6F00);
  rect(90, 360, 10, 70);
  fill(#FF0000);
  rect(100, 360, 10, 70);
  fill(#FF00A6);
  rect(110, 360, 10, 70);
  fill(#FF00FB);
  rect(120, 360, 10, 70);
  

  popMatrix();
}

//square man

void squareman() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(375, 700, 375, 360);
  //head
  noStroke();
  fill(0);
  rect(325, mouseY-200, 100, 100);
  //body
  rect(310, 620, 130, 130);
  //tie
  fill(#FF0000);//red
  rect(370, 620, 10, 10);
  quad(370, 635, 380, 635, 380, 700, 370, 700);
  //mouth
  rect(365, 430, 20, 20);
  //mosaic
  //1
  fill(0);
  rect(320,365,110,60);
  fill(#0006FF);
  rect(320, 365, 10, 10);
  fill(#008EFF);
  rect(320, 385, 10, 10);
  fill(#00ECFF);
  rect(320, 405, 10, 10);
  //2
  fill(#00FFB0);
  rect(330, 375, 10, 10);
  fill(#00FF01);
  rect(330, 395, 10, 10);
  fill(#87FF00);
  rect(330, 415, 10, 10);
  //3
  fill(#F6FF00);
  rect(340, 365, 10, 10);
  fill(#FFBC00);
  rect(340, 385, 10, 10);
  fill(#FF6F00);
  rect(340, 405, 10, 10);
  //4
  fill(#FF0000);
  rect(350, 375, 10, 10);
  fill(#FF00A6);
  rect(350, 395, 10, 10);
  fill(#FF00FB);
  rect(350, 415, 10, 10);
  fill(#7600FF);
  //5
  rect(360, 365, 10, 10);
  fill(#0006FF);
  rect(360, 385, 10, 10);
  fill(#008EFF);
  rect(360, 405, 10, 10);
  //6
  fill(#00ECFF);
  rect(370, 375, 10, 10);
  fill(#00FFB0);
  rect(370, 395, 10, 10);
  fill(#00FF01);
  rect(370, 415, 10, 10);
  //7
  fill(#87FF00);
  rect(380, 365, 10, 10);
  fill(#F6FF00);
  rect(380, 385, 10, 10);
  fill(#FFBC00);
  rect(380, 405, 10, 10);
  //8
  fill(#FF6F00);
  rect(390, 375, 10, 10);
  fill(#FF0000);
  rect(390, 395, 10, 10);
  fill(#FF00A6);
  rect(390, 415, 10, 10);
  //9
  fill(#FF00FB);
  rect(400, 365, 10, 10);
  fill(#7600FF);
  rect(400, 385, 10, 10);
  fill(#0006FF);
  rect(400, 405, 10, 10);
  //10
  fill(#008EFF);
  rect(410, 375, 10, 10);
  fill(#00ECFF);
  rect(410, 395, 10, 10);
  fill(#00FFB0);
  rect(410, 415, 10, 10);
  //11
  fill(#00FF01);
  rect(420, 365, 10, 10);
  fill(#87FF00);
  rect(420, 385, 10, 10);
  fill(#F6FF00);
  rect(420, 405, 10, 10);
  
  popMatrix();
}

//square man2

void squareman2() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(825, 700,825, 340);
  //head
  noStroke();
  fill(0);
  rect(780,mouseX-400, 90, 170);
  //body
  rect(760, 620, 130, 130);
  //handkrechief
  fill(#FF0000);//red
  triangle(875,640,845,640,875,670);
  triangle(875,640,845,640,845,660);
  //mouth
  rect(815, 440, 20, 40);
  //mosaic
  //1
  fill(0);
  rect(770,365,110,60);
  fill(#0006FF);
  rect(770, 365, 10, 10);
  fill(#008EFF);
  rect(770, 385, 10, 10);
  fill(#00ECFF);
  rect(770, 405, 10, 10);
  //2
  fill(#00FFB0);
  rect(780, 375, 10, 10);
  fill(#00FF01);
  rect(780, 395, 10, 10);
  fill(#87FF00);
  rect(780, 415, 10, 10);
  //3
  fill(#F6FF00);
  rect(790, 365, 10, 10);
  fill(#FFBC00);
  rect(790, 385, 10, 10);
  fill(#FF6F00);
  rect(790, 405, 10, 10);
  //4
  fill(#FF0000);
  rect(800, 375, 10, 10);
  fill(#FF00A6);
  rect(800, 395, 10, 10);
  fill(#FF00FB);
  rect(800, 415, 10, 10);
  fill(#7600FF);
  //5
  rect(810, 365, 10, 10);
  fill(#0006FF);
  rect(810, 385, 10, 10);
  fill(#008EFF);
  rect(810, 405, 10, 10);
  //6
  fill(#00ECFF);
  rect(820, 375, 10, 10);
  fill(#00FFB0);
  rect(820, 395, 10, 10);
  fill(#00FF01);
  rect(820, 415, 10, 10);
  //7
  fill(#87FF00);
  rect(830, 365, 10, 10);
  fill(#F6FF00);
  rect(830, 385, 10, 10);
  fill(#FFBC00);
  rect(830, 405, 10, 10);
  //8
  fill(#FF6F00);
  rect(840, 375, 10, 10);
  fill(#FF0000);
  rect(840, 395, 10, 10);
  fill(#FF00A6);
  rect(840, 415, 10, 10);
  //9
  fill(#FF00FB);
  rect(850, 365, 10, 10);
  fill(#7600FF);
  rect(850, 385, 10, 10);
  fill(#0006FF);
  rect(850, 405, 10, 10);
  //10
  fill(#008EFF);
  rect(860, 375, 10, 10);
  fill(#00ECFF);
  rect(860, 395, 10, 10);
  fill(#00FFB0);
  rect(860, 415, 10, 10);
  //11
  fill(#00FF01);
  rect(870, 365, 10, 10);
  fill(#87FF00);
  rect(870, 385, 10, 10);
  fill(#F6FF00);
  rect(870, 405, 10, 10);
  
  popMatrix();
}

//squareman2B

void squareman2B() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(825, 700,825, 340);
  //head
  noStroke();
  fill(0);
  rect(780,320, 90, 170);
  //body
  rect(760, 620, 130, 130);
  //handkrechief
  fill(#FF0000);//red
  triangle(875,640,845,640,875,670);
  triangle(875,640,845,640,845,660);
  //mouth
  rect(815, 440, 20, 40);
  //mosaic
  //1
  fill(0);
  rect(770,365,110,60);
  fill(#0006FF);
  rect(770, 365, 10, 10);
  fill(#008EFF);
  rect(770, 385, 10, 10);
  fill(#00ECFF);
  rect(770, 405, 10, 10);
  //2
  fill(#00FFB0);
  rect(780, 375, 10, 10);
  fill(#00FF01);
  rect(780, 395, 10, 10);
  fill(#87FF00);
  rect(780, 415, 10, 10);
  //3
  fill(#F6FF00);
  rect(790, 365, 10, 10);
  fill(#FFBC00);
  rect(790, 385, 10, 10);
  fill(#FF6F00);
  rect(790, 405, 10, 10);
  //4
  fill(#FF0000);
  rect(800, 375, 10, 10);
  fill(#FF00A6);
  rect(800, 395, 10, 10);
  fill(#FF00FB);
  rect(800, 415, 10, 10);
  fill(#7600FF);
  //5
  rect(810, 365, 10, 10);
  fill(#0006FF);
  rect(810, 385, 10, 10);
  fill(#008EFF);
  rect(810, 405, 10, 10);
  //6
  fill(#00ECFF);
  rect(820, 375, 10, 10);
  fill(#00FFB0);
  rect(820, 395, 10, 10);
  fill(#00FF01);
  rect(820, 415, 10, 10);
  //7
  fill(#87FF00);
  rect(830, 365, 10, 10);
  fill(#F6FF00);
  rect(830, 385, 10, 10);
  fill(#FFBC00);
  rect(830, 405, 10, 10);
  //8
  fill(#FF6F00);
  rect(840, 375, 10, 10);
  fill(#FF0000);
  rect(840, 395, 10, 10);
  fill(#FF00A6);
  rect(840, 415, 10, 10);
  //9
  fill(#FF00FB);
  rect(850, 365, 10, 10);
  fill(#7600FF);
  rect(850, 385, 10, 10);
  fill(#0006FF);
  rect(850, 405, 10, 10);
  //10
  fill(#008EFF);
  rect(860, 375, 10, 10);
  fill(#00ECFF);
  rect(860, 395, 10, 10);
  fill(#00FFB0);
  rect(860, 415, 10, 10);
  //11
  fill(#00FF01);
  rect(870, 365, 10, 10);
  fill(#87FF00);
  rect(870, 385, 10, 10);
  fill(#F6FF00);
  rect(870, 405, 10, 10);
  
  popMatrix();
}

//squaremanB

void squaremanB() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(375, 700, 375, 360);
  //head
  noStroke();
  fill(0);
  rect(325, 350, 100, 100);
  //body
  rect(310, 620, 130, 130);
  //tie
  fill(#FF0000);//red
  rect(370, 620, 10, 10);
  quad(370, 635, 380, 635, 380, 700, 370, 700);
  //mouth
  rect(365, 430, 20, 20);
  //mosaic
  //1
  fill(0);
  rect(320,365,110,60);
  fill(#0006FF);
  rect(320, 365, 10, 10);
  fill(#008EFF);
  rect(320, 385, 10, 10);
  fill(#00ECFF);
  rect(320, 405, 10, 10);
  //2
  fill(#00FFB0);
  rect(330, 375, 10, 10);
  fill(#00FF01);
  rect(330, 395, 10, 10);
  fill(#87FF00);
  rect(330, 415, 10, 10);
  //3
  fill(#F6FF00);
  rect(340, 365, 10, 10);
  fill(#FFBC00);
  rect(340, 385, 10, 10);
  fill(#FF6F00);
  rect(340, 405, 10, 10);
  //4
  fill(#FF0000);
  rect(350, 375, 10, 10);
  fill(#FF00A6);
  rect(350, 395, 10, 10);
  fill(#FF00FB);
  rect(350, 415, 10, 10);
  fill(#7600FF);
  //5
  rect(360, 365, 10, 10);
  fill(#0006FF);
  rect(360, 385, 10, 10);
  fill(#008EFF);
  rect(360, 405, 10, 10);
  //6
  fill(#00ECFF);
  rect(370, 375, 10, 10);
  fill(#00FFB0);
  rect(370, 395, 10, 10);
  fill(#00FF01);
  rect(370, 415, 10, 10);
  //7
  fill(#87FF00);
  rect(380, 365, 10, 10);
  fill(#F6FF00);
  rect(380, 385, 10, 10);
  fill(#FFBC00);
  rect(380, 405, 10, 10);
  //8
  fill(#FF6F00);
  rect(390, 375, 10, 10);
  fill(#FF0000);
  rect(390, 395, 10, 10);
  fill(#FF00A6);
  rect(390, 415, 10, 10);
  //9
  fill(#FF00FB);
  rect(400, 365, 10, 10);
  fill(#7600FF);
  rect(400, 385, 10, 10);
  fill(#0006FF);
  rect(400, 405, 10, 10);
  //10
  fill(#008EFF);
  rect(410, 375, 10, 10);
  fill(#00ECFF);
  rect(410, 395, 10, 10);
  fill(#00FFB0);
  rect(410, 415, 10, 10);
  //11
  fill(#00FF01);
  rect(420, 365, 10, 10);
  fill(#87FF00);
  rect(420, 385, 10, 10);
  fill(#F6FF00);
  rect(420, 405, 10, 10);
  
  popMatrix();
}

//triangle man2

void triangleman2() {

  pushMatrix();

  translate(0, 0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(675, 700, 675, 410);
  //head
  noStroke();
  fill(0);
  triangle(620, mouseX-340, 730, mouseX-340, 675, mouseX-450);
  //body
  triangle(605, 720, 745, 720, 675, 635);
  //bead
  fill(#FF0000);//red
  triangle(675, 700, 665, 680, 685, 680);
  triangle(655, 660, 645, 680, 665, 680);
  triangle(695, 660, 685, 680, 705, 680);
  //mouth
  triangle(675, 490, 685, 470, 665, 470);
  //mosaic
  fill(#FF0000);
  rect(625, 415, 100, 20);
  fill(#FF6F00);
  rect(625, 435, 100, 10);
  fill(#FFBC00);
  rect(625, 445, 100, 10);
  fill(#F6FF00);
  rect(625, 455, 100, 10);

  popMatrix();
}
  
//triangle man

void triangleman() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(225, 700, 225, 410);
  //head
  noStroke();
  fill(0);
  triangle(170,mouseY+205, 280,mouseY+ 205, 225,mouseY+ 95);
  //body
  triangle(155, 635, 295, 635, 225, 800);
  //tie
  fill(#FF0000);//red
  triangle(218, 635, 232, 635, 225, 649);
  quad(215, 690, 225, 700, 235, 690, 225, 649);
  //mouth
  triangle(225, 480, 235, 500, 215, 500);
  //mosaic
  fill(#0006FF);
  rect(175, 425, 100, 20);
  fill(#008EFF);
  rect(175, 445, 100, 10);
  fill(#00ECFF);
  rect(175, 455, 100, 10);
  fill(#00FF01);
  rect(175, 465, 100, 10);

  popMatrix();
}

//triangleman2B

void triangleman2B() {

  pushMatrix();

  translate(0, 0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(675, 700, 675, 410);
  //head
  noStroke();
  fill(0);
  triangle(620, 395, 730, 395, 675, 505);
  //body
  triangle(605, 720, 745, 720, 675, 635);
  //bead
  fill(#FF0000);//red
  triangle(675, 700, 665, 680, 685, 680);
  triangle(655, 660, 645, 680, 665, 680);
  triangle(695, 660, 685, 680, 705, 680);
  //mouth
  triangle(675, 490, 685, 470, 665, 470);
  //mosaic
  fill(#FF0000);
  rect(625, 415, 100, 20);
  fill(#FF6F00);
  rect(625, 435, 100, 10);
  fill(#FFBC00);
  rect(625, 445, 100, 10);
  fill(#F6FF00);
  rect(625, 455, 100, 10);

  popMatrix();
}
  
// trianglemanB

void trianglemanB() {

  pushMatrix();
  
  translate(0,0);

  //neck
  stroke(0);
  strokeWeight(10);
  line(225, 700, 225, 410);
  //head
  noStroke();
  fill(0);
  triangle(170,510, 280, 510, 225,400);
  //body
  triangle(155, 635, 295, 635, 225, 800);
  //tie
  fill(#FF0000);//red
  triangle(218, 635, 232, 635, 225, 649);
  quad(215, 690, 225, 700, 235, 690, 225, 649);
  //mouth
  triangle(225, 480, 235, 500, 215, 500);
  //mosaic
  fill(#0006FF);
  rect(175, 425, 100, 20);
  fill(#008EFF);
  rect(175, 445, 100, 10);
  fill(#00ECFF);
  rect(175, 455, 100, 10);
  fill(#00FF01);
  rect(175, 465, 100, 10);

  popMatrix();
}

