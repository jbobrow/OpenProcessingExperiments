
float x, y;
float vx, vy;

void setup() {
  size(1000, 600);
  x=900;
  y=350;
  vx=-0.5;
  vy=0;
}

void draw() {

  background(185, 255, 239); 


  if (mousePressed==true) {

    background(83, 154, 157);  

    //hikou
    //
    fill(245, 5, 41);
    ellipse(10, 30, 3, 60+x/2);
    fill(0);
    ellipse(50, 60, 80, 65);
    ellipse(80, 30, 12, 15);
    ellipse(70, 30, 12, 15);
    fill(255);
    ellipse(70, 30, 8, 8);
    ellipse(80, 30, 8, 8);
    fill(245, 5, 41);
    triangle(75, 36, 197, 38, 75, 40);
    stroke(y, 0, x);
    fill(255, 247, 0);
    ellipse(40, 70, 13, 13);
    ellipse(80, 70, 13, 13);
    ellipse(20, 60, 13, 13);
    ellipse(60, 60, 13, 13);

    //3 
    fill(245, 5, 41);
    ellipse(410, 30, 3, 90+x/2);
    fill(0);
    ellipse(450, 60, 80, 65);

    ellipse(480, 30, 12, 15);
    ellipse(470, 30, 12, 15);
    fill(255);
    ellipse(470, 30, 8, 8);
    ellipse(480, 30, 8, 8);
    fill(245, 5, 41);
    triangle(475, 36, 600, 38, 475, 40);
    stroke(x, 247, x);
    fill(255, 247, 0);
    ellipse(440, 70, 13, 13);
    ellipse(480, 70, 13, 13);
    ellipse(420, 60, 13, 13);
    ellipse(460, 60, 13, 13);

    //4 
    fill(245, 5, 41);
    ellipse(610, 30, 3, 60+y/2);
    fill(0);
    ellipse(650, 60, 80, 65);

    ellipse(680, 30, 12, 15);
    ellipse(670, 30, 12, 15);
    fill(255);
    ellipse(670, 30, 8, 8);
    ellipse(680, 30, 8, 8);
    fill(245, 5, 41);
    triangle(675, 36, 797, 38, 675, 40);
    stroke(255, 0, y);
    fill(255, 247, 0);
    ellipse(640, 70, 13, 13);
    ellipse(680, 70, 13, 13);
    ellipse(620, 60, 13, 13);
    ellipse(660, 60, 13, 13);

    //5    
    fill(245, 5, 41);
    ellipse(810, 30, 3, 0+y);
    fill(0);
    ellipse(850, 60, 80, 65);

    ellipse(880, 30, 12, 15);
    ellipse(870, 30, 12, 15);
    fill(255);
    ellipse(870, 30, 8, 8);
    ellipse(880, 30, 8, 8);
    fill(245, 5, 41);
    triangle(875, 36, 997, 38, 875, 40);
    stroke(y, x, y);
    fill(255, 247, 0);
    ellipse(840, 70, 13, 13);
    ellipse(880, 70, 13, 13);
    ellipse(820, 60, 13, 13);
    ellipse(860, 60, 13, 13);

    //2
    fill(245, 5, 41);
    ellipse(210, 30, 3, 100-x/2);
    fill(0);
    ellipse(250, 60, 80, 65);
    ellipse(280, 30, 12, 15);
    ellipse(270, 30, 12, 15);
    fill(255);
    ellipse(270, 30, 8, 8);
    ellipse(280, 30, 8, 8);
    fill(245, 5, 41);
    triangle(275, 36, 397, 38, 275, 40);
    stroke(0, x, 0);
    fill(255, 247, 0);
    ellipse(240, 70, 13, 13);
    ellipse(280, 70, 13, 13);
    ellipse(220, 60, 13, 13);
    ellipse(260, 60, 13, 13);


    //tarou_another

    fill(255, 255, 255);
    stroke(0);
    line(90, 550, 105, 555);
    line(60, 550, 60, 590);
    line(83, 550, 83, 590);
    ellipse(70, 550, 50, 55);
    ellipse(85, 535, 6, 6);
    ellipse(65, 535, 6, 6);
    fill(0);
    line(65, 550, 75, 555);
    ellipse(86, 535, 1, 1);
    ellipse(66, 535, 1, 1);
    //bou
    line(18, 580, 52, 588);
    quad(16, 590, 16, 581, 49, 588, 48, 592);
    //kuti
    fill(255, 214, 245);
    noStroke();
    rect(70, 540, 12, 5);
    //mozi
    textSize(32);
    fill(245, 5, 41);
    text("!!!!!", 40, 510);
  } else {



    //tarou

    fill(255, 255, 255);
    stroke(0);
    line(90, 550, 105, 555);
    line(60, 550, 60, 590);
    line(83, 550, 83, 590);
    ellipse(70, 550, 50, 55);
    fill(0);
    line(85, 550, 65, 555);
    ellipse(85, 540, 2, 2);
    ellipse(65, 540, 2, 2);
    //bou
    line(45, 532, 75, 520);
    quad(47, 525, 49, 529, 70, 516, 73, 521);
    //kuti
    fill(255, 214, 245);
    noStroke();
    ellipse(76, 545, 10, 10);
    rect(71, 540, 10, 5);
    //mozi
    textSize(32);
    fill(255, 184, 3);
    text("!", 40, 510);
  }


  chara(int(x)+800, int(y)-80);
  chara(int(x)+720, int(y)-85);
  chara(int(x)+580, int(y)-100);

  chara(int(x)+500, int(y)-80);
  chara(int(x)+350, int(y)-100);
  chara(int(x)+390, int(y)-70);  
  chara(int(x)+300, int(y)-50);
  chara(int(x)+460, int(y)-50);  
  chara(int(x)-0, int(y)-50);
  chara(int(x)+150, int(y)-50);
  chara(int(x)-100, int(y)-50);
  chara(int(x)+650, int(y)-50);  
  chara(int(x)+680, int(y)-50);  
  chara(int(x)+840, int(y)-50);
  chara(int(x)+900, int(y)-50); 


  x=x+vx;
  y=y+vy;

  vy=vy+0.1;

  if (x>width-30) vx=-vx;
  if (x<-700) vx=-vx;

  if (y>height-40) vy=-vy*0.98;
  if (y<40)vy=-vy*0.98;

  if (mousePressed) {
    if ((mouseX>x-25) && (mouseX<x+25) && (mouseY>y-25) && (mouseY<y+25)) {
      x=mouseX;
      y=mouseY;
      vx=mouseX-pmouseX;
      vy=mouseY-pmouseY;
    }
  }
}

void chara(int a, int b) {
  pushMatrix();
  translate(a, b);




  fill(245, 5, 41);

  fill(255, 255, 255);
  ellipse(50, 60, 80, 65);
  ellipse(30, 30, 12, 15);
  ellipse(20, 30, 12, 15);
  fill(0);
  if (mousePressed==true) {
    fill(245, 5, 41);
    ellipse(90, 20, 3, 50-y/2); 
    ellipse(30, 30, 8, 8);
    ellipse(20, 30, 8, 8);
  } else { 
    fill(245, 5, 41);
    ellipse(90, 40, 5, 30);
    fill(0);
    ellipse(30, 30, 8, 8);
    ellipse(20, 30, 8, 8);
  }
  //kuti
  fill(245, 5, 41);
  triangle(25, 36, 5, 38, 25, 40);



  fill(y, x, 0);

  noStroke();
  {
    ellipse(40, 70, 15, 15);
    ellipse(80, 70, 15, 15);
    ellipse(20, 60, 15, 15);
    ellipse(60, 60, 15, 15);
  }
  translate(100, 200);
  rotate((float)x);

  popMatrix();
}



