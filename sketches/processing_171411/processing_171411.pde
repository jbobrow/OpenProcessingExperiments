
int state = 0;
int DCLOCK = 1;
int BCANCER = 2;
int BDRUG = 3;
int BCAR = 4;
int BANIMAL = 5;
int BFOOD = 6;
int BMURDER =7 ;
int BAIDS = 8;
int BSUICIDE = 9;
int BHEALTH = 10;
int BDOMESTIC = 11;
int BARREST = 12;
int BDEATH = 13;
int count = 14;

float x = 15;
float y = 16;

void setup() {
  size(1000, 1000);
  background(175);
  fill(0);
  ellipse(500, 500, 900, 900);
  fill(255);
  ellipse(500, 500, 875, 875);
  fill(0);
  ellipse(500, 500, 50, 50);
  rect(490, 200, 20, 350);
  rect(475, 480, 225, 40);
  state = DCLOCK;
  frameRate=30;
  text("(U.S.)", 500, 950);
}


void draw() {

  if (state==DCLOCK) {
    CLOCK();
  }
  if (state==BCANCER) {
    CANCER();
  }
  if (state==BDEATH) {
    DEATH();
  }
  if (state==BDRUG) {
    DRUG();
  }
  if (state==BCAR) {
    CAR();
  }
  if (state==BANIMAL) {
    ANIMAL();
  }
  if (state==BFOOD) {
    FOOD();
  }
  if (state==BARREST) {
    ARREST();
  }
  if (state==BSUICIDE) {
    SUICIDE();
  }
  if (state==BMURDER) {
    MURDER();
  }
  if (state==BHEALTH) {
    HEALTH();
  }
  if (state==BAIDS) {
    AIDS();
  }
  if (state==BDOMESTIC) {
    DOMESTIC();
  }
  println(mouseX, mouseY);
}




void DEATH() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count == 2) {
    float x = random(width);
    float y = random(height);
    ellipse(x, y, 75, 75);
    strokeWeight(10);
    line(x-75, y+100, x+75, y+20);
    line(x-75, y+20, x+75, y+100);
    count = 0;
  }
}



void CANCER() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==13) {
    float x = random(width);
    float y = random(height);
    strokeWeight(10);
    fill(255);
    ellipse(x, y, 25, 25);
    ellipse(x+100, y, 25, 25);
    noFill();
    arc(x+60, y, 100, 40, PI+QUARTER_PI, TWO_PI);
    arc(x+90, y, 200, 40, HALF_PI, PI);
    count = 0;
  }
}



void DRUG() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==1260) {
    float x = random(width);
    float y = random(height);
    strokeWeight(10);
    fill(200);
    line(x, y, x+100, y);
    rect(x+25, y-10, 50, 20);
    line(x+100, y-10, x+100, y+10);
    count = 0;
  }
}


void CAR() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==750) {
    float x = random(width);
    float y = random(height);
    strokeWeight(10);
    fill(255);
    ellipse(x, y, 80, 80);
    line(x, y-40, x, y+40);
    line(x-35, y, x+35, y);
    line(x-25, y-30, x+25, y+30);
    line(x-25, y+30, x+25, y-30);
    count = 0;
  }
}

void ANIMAL() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==300) {
    float x = random(width);
    float y = random(height);
    strokeWeight(2);
    noFill();
    line(x, y+30, x+50, y+30);
    line(x, y+35, x+50, y+35);
    line(x, y+40, x+50, y+40);
    strokeWeight(10);
    triangle(x, y, x+50, y, x+25, y+50);
    fill(0);
    count = 0;
  }
}

void FOOD() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==300) {
    float x = random(width);
    float y = random(height);
    strokeWeight(2);
    fill(0);
    ellipse(x, y, 50, 75);
    rect(x-5, y, 10, 75);
    ellipse(x-5, y+75, 20, 20);
    ellipse(x+5, y+75, 20, 20);
    count = 0;
  }
}

void ARREST() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==60) {
    float x = random(width);
    float y = random(height);
    strokeWeight(5);
    line(x-25, y-50, x-25, y+50);
    line(x-15, y-50, x-15, y+50);
    line(x-5, y-50, x-5, y+50);
    line(x+5, y-50, x+5, y+50);
    line(x+15, y-50, x+15, y+50);
    line(x+25, y-50, x+25, y+50);
    count = 0;
  }
}

void SUICIDE() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==930) {
    float x = random(width);
    float y = random(height);
    stroke(0);
    strokeWeight(5);
    noFill();
    ellipse(x, y, 75, 100);
    line(x, y-50, x, y-125);
    count = 0;
    fill(0);
  }
}

void MURDER() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==2160) {
    float x = random(width);
    float y = random(height);
    fill(0);
    rect(x, y, 25, 50);
    rect(x, y, 75, 25);
    noFill();
    stroke(0);
    strokeWeight(10);
    line(x+40, y+5, x+40, y+40);
    count = 0;
    fill(0);
  }
}

void HEALTH() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==34) {
    float x = random(width);
    float y = random(height);
    rect(x, y, 100, 50);
    rect(x+25, y-25, 50, 100);
    count = 0;
    fill(0);
  }
}

void AIDS() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==630) {
    float x = random(width);
    float y = random(height);
    strokeWeight(5);
    noStroke();
    fill(100);
    ellipse(x, y, 50, 50);
    triangle(x-25, y, x+25, y, x, y-100);
    count = 0;
    fill(0);
  }
}

void DOMESTIC() {
  fill(0);
  rect(0, 0, 100, 100);
  count++;
  if (count==270) {
    float x = random(width);
    float y = random(height);
    strokeWeight(2);
    fill(100);
    ellipse(x, y, 100, 100);
    fill(200);
    ellipse(x-25, y-25, 30, 45);
    fill(0);
    ellipse(x-25, y-25, 25, 25);
    ellipse(x+25, y-25, 25, 25);
    line(x-50, y, x+50, y);
    count = 0;
    fill(0);
  }
}

void mouseClicked() {
  if ( mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100) {
    state = DCLOCK;
    CLOCK();
  }
  if (state == DCLOCK) {
    if (mouseX > 170 && mouseX < 320 && mouseY > 160 && mouseY < 250) {
      state = BCANCER;
      count = 0;
      background(255);
      CANCER();
    }
    if (mouseX > 415 && mouseX < 590 && mouseY > 83 && mouseY < 235) {
      state = BDEATH;
      count = 0;
      background(255);
      DEATH();
    }
    if (mouseX > 87 && mouseX < 333 && mouseY > 207 && mouseY < 385) {
      state = BDRUG;
      count = 0;
      background(255);
      DRUG();
    }
    if (mouseX > 70 && mouseX < 175 && mouseY > 450 && mouseY < 530) {
      state = BCAR;
      count = 0;
      background(255);
      CAR();
    }
    if (mouseX > 100 && mouseX < 180 && mouseY > 635 && mouseY < 715) {
      state = BANIMAL;
      count = 0;
      background(255);
      ANIMAL();
    }
    if (mouseX > 260 && mouseX < 325 && mouseY > 730 && mouseY < 865) {
      state = BFOOD;
      count = 0;
      background(255);
      FOOD();
    }
    if (mouseX > 450 && mouseX < 525 && mouseY > 780 && mouseY < 900) {
      state = BARREST;
      count = 0;
      background(255);
      ARREST();
    }
    if (mouseX > 650 && mouseX < 750 && mouseY > 670 && mouseY < 850) {
      state = BSUICIDE;
      count = 0;
      background(255);
      SUICIDE();
    }
    if (mouseX > 790 && mouseX < 880 && mouseY > 645 && mouseY < 700) {
      state = BMURDER;
      count = 0;
      background(255);
      MURDER();
    }
    if (mouseX > 780 && mouseX < 915 && mouseY > 450 && mouseY < 555) {
      state = BHEALTH;
      count = 0;
      background(255);
      HEALTH();
    }
    if (mouseX > 785 && mouseX < 865 && mouseY > 300 && mouseY < 420) {
      state = BAIDS;
      count = 0;
      background(255);
      AIDS();
    }
    if (mouseX > 645 && mouseX < 750 && mouseY > 150 && mouseY < 250) {
      state = BDOMESTIC;
      count = 0;
      background(255);
      DOMESTIC();
    }
  }
}




void CLOCK() {
  //CLOCK FACE//
  background(175);
  fill(0);
  ellipse(500, 500, 900, 900);
  fill(255);
  ellipse(500, 500, 875, 875);
  fill(0);
  ellipse(500, 500, 50, 50);
  rect(490, 200, 20, 350);
  rect(475, 480, 225, 40);


  ////OBJECTS ON CLOCK////

  //skull
  ellipse(500, 125, 75, 75);
  strokeWeight(10);
  line(425, 225, 575, 145);
  line(425, 145, 575, 225);

  //cancer
  strokeWeight(10);
  fill(255);
  ellipse(200, 200, 25, 25);
  ellipse(300, 200, 25, 25);
  noFill();
  arc(260, 200, 100, 40, PI+QUARTER_PI, TWO_PI);
  arc(290, 200, 200, 40, HALF_PI, PI);

  //drugs
  strokeWeight(10);
  fill(200);
  line(100, 360, 200, 360);
  rect(125, 350, 50, 20);
  line(200, 350, 200, 370);

  //wheel
  strokeWeight(10);
  fill(255);
  ellipse(125, 500, 80, 80);
  line(125, 460, 125, 540);
  line(90, 500, 160, 500);
  line(100, 470, 150, 530);
  line(100, 530, 150, 470);

  //rat
  strokeWeight(2);
  line(125, 680, 175, 680);
  line(125, 685, 175, 685);
  line(125, 690, 175, 690);
  strokeWeight(10);
  triangle(125, 650, 175, 650, 150, 700);

  //food
  strokeWeight(2);
  fill(0);
  ellipse(300, 775, 50, 75);
  rect(295, 775, 10, 75);
  ellipse(295, 850, 20, 20);
  ellipse(305, 850, 20, 20);

  //jail
  strokeWeight(5);
  line(475, 800, 475, 900);
  line(485, 800, 485, 900);
  line(495, 800, 495, 900);
  line(505, 800, 505, 900);
  line(515, 800, 515, 900);
  line(525, 800, 525, 900);
  textMode(CENTER);
  textAlign(CENTER);
  text("(U.S.)", 500, 915);

  //domvio
  strokeWeight(2);
  fill(100);
  ellipse(700, 200, 100, 100);
  fill(200);
  ellipse(675, 175, 30, 45);
  fill(0);
  ellipse(675, 175, 25, 25);
  ellipse(725, 175, 25, 25);
  line(650, 200, 750, 200);
   textMode(CENTER);
  textAlign(CENTER);
  text("(U.S.)", 700, 265);


  //blood
  strokeWeight(5);
  noStroke();
  fill(100);
  ellipse(830, 400, 50, 50);
  triangle(805, 400, 855, 400, 830, 300);

  //suicide
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(700, 800, 75, 100);
  line(700, 750, 700, 675);

  //health
  fill(0);
  rect(800, 475, 100, 50);
  rect(825, 450, 50, 100);

  //gun
  fill(0);
  rect(800, 650, 25, 50);
  rect(800, 650, 75, 25);
  noFill();
  stroke(0);
  strokeWeight(10);
  line(840, 655, 840, 690);
}

