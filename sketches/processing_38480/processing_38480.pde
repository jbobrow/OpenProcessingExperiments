
PGraphics pg;

void setup() {
  size(400,400);
  smooth();

  check();
  dots();
  lace_1();
  argyle();
}

void check() {
  noStroke();
  fill(150, 0, 0);
  rect(0, 0, 200, 200);

  //黒格子
  for (int i = 0; i < 4; i++) { 
    fill(0, 180);
    noStroke();
    rect(0, 50*i+15, 200, 20); //横
    rect(50*i+15, 0, 20, 200); //縦
  }

  //黄格子
  for (int j = 0; j < 4; j++) {
    strokeWeight(2);
    stroke(255, 200, 0);
    line(0, 50*j+18, 200, 50*j+18); //横
    line(50*j+18, 0, 50*j+18, 200); //縦
  }

  //白格子
  for (int i = 0; i < 4; i++) {
    strokeWeight(2);
    stroke(250);
    line(0, 50*i+30, 200, 50*i+30); //横
    line(50*i+30, 0, 50*i+30, 200); //縦

    line(0, 50*i+50, 200, 50*i+50); //横
    line(50*i+50, 0, 50*i+50, 200); //縦
  }
}

void dots() {
  noStroke();
  fill(130, 80, 40);
  rect(199, 0, 201, 200);

  for (int j = 0; j < 5; j++) {
    for (int k = 0; k < 4;k++) {
      fill(220);
      ellipse(40*j+220, 60*k+10, 15, 15);
    }
  }
  for (int p = 1; p < 5; p++) {
    for (int q = 0; q < 3; q++) {
      ellipse(40*p+200, 60*q+40, 15, 15);
    }
  }
}

void lace_1() {
  noStroke();
  fill(100);
  rect(0, 199, 200, 201);

  for (int i = 0; i < 2; i++) {
    noStroke();
    fill(250);
    rect(0, 100*i+230, 200, 40);

    for (int j = 0;j < 21;j++) {
      stroke(250);
      fill(250);
      ellipse(10*j, 100*i+230, 10, 20);
      ellipse(10*j, 100*i+270, 10, 20);

      noFill();
      ellipse(10*j, 100*i+230, 20, 40);
      ellipse(10*j, 100*i+270, 20, 40);
    }

    for (int p = 0; p < 3; p++) {
      for (int q = 0; q < 2; q++) {
        lace_2(65*p+35, 100*q+250);
      }
    }
  }
}

void lace_2(int x, int y) {
  int r = 6;
  int s = 12;

  noStroke();
  fill(100);

  ellipse(x, y, 2.5*r, r);
  ellipse(x, y, r, 2.5*r);

  ellipse(x+s, y+s, 1.5*r, r);
  ellipse(x-s, y+s, 1.5*r, r);

  ellipse(x+s, y-s, 1.5*r, r);
  ellipse(x-s, y-s, 1.5*r, r);

  ellipse(x+2*s, y, 2*r, r);
  ellipse(x-2*s, y, 2*r, r);

  ellipse(x, y-1.5*s, r, r);
  ellipse(x, y+1.5*s, r, r);
}

void argyle() {
  noStroke();
  fill(150, 200, 230);
  rect(199, 199, 201, 201);

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 4 ; j++) {
      if (i % 2 == 0) {
        fill(50, 100, 180);
      }
      else {
        fill(60, 180, 210);
      }
      noStroke();
      lozenge(210+20*i, 225+50*j);
    }
  }
  strokeWeight(2);
  stroke(255);
  for(int k = 0; k < 10; k ++){
    line(380-20*k,200,400,250+50*k);
  }  

  for(int a = 0; a < 13; a ++){
    line(220+20*a,200,200,250+50*a);
  }
  
  for(int b = 0; b < 4; b++){
    line(200,350-50*b,220+20*b,400);
  }
  
}

void lozenge(int x, int y) {
  quad(x+10, y, x, y-25, x-10, y, x, y+25);
}


