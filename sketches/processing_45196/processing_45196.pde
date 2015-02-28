
int nobars = 5;
Bar[] bars = new Bar[nobars];
Label[] boxes = new Label[nobars];

void setup() {
  size(900, 500);
  background(0);
  for (int i =0; i<5;i++) {
    bars[i] = new Bar();
    boxes[i] = new Label();
  }
  bars[0].barMax = 85;
  bars[1].barMax = 110;
  bars[2].barMax = 155;
  bars[3].barMax = 165;
  bars[4].barMax = 175;
  bars[0].barX = 25;
  bars[1].barX = 225;
  bars[2].barX = 425;
  bars[3].barX = 625;
  bars[4].barX = 825;
  for (int i = 0; i < 5; i++) {
    boxes[i].boxX = bars[i].barX - 25;
    bars[i].barNo = i;
  }
  PFont font;
  font = loadFont("Rockwell-Bold-48.vlw");
  textFont(font, 40);
}

void draw() {
  background(0);
  heading();
  bbox();
  for (int i = 0; i<5; i++) {
    boxes[i].display();

    if (mouseX >=boxes[i].boxX && mouseX <= (boxes[i].boxX + 100)) {
      if (mouseY >=450 && mouseY <=500) {
        bars[i].display();
        bars[i].update();
        boxes[i].display();
      }
    }
    else {
      bars[i].barY = 450;
    }
  }

  if (mouseX >=750 && mouseX <= 875) {
    if (mouseY >=0 && mouseY <=50) {
      for (int i = 0; i<5; i++) {
        bars[i].barY = bars[i].barMax;
        bars[i].display();
      }
      PImage usa2;
      usa2 = loadImage("usa2.jpg");
      image(usa2, 800, 450);
      PImage can2;
      can2 = loadImage("canada2.jpg");
      image(can2, 600, 450);
      PImage uk2;
      uk2 = loadImage("uk2.jpg");
      image(uk2, 400, 450);
      PImage i2;
      i2 = loadImage("i2.jpg");
      image(i2, 200, 450);
      PImage ire2;
      ire2 = loadImage("ireland2.jpg");
      image(ire2, 0, 450);
      fill(255);
      text("83%", 25, 85);
      text("78%", 225, 110);
      text("69%", 425, 155);
      text("67%", 625, 165);
      text("65%", 825, 175);
    }
  }
}


void heading() {
  fill(178, 47, 47);
  text("Homeowner Percentages", width/4, 50);
}

void bbox() {
  stroke(255);
  strokeWeight(8);
  fill(255, 50, 50);
  rect(750, 10, 125, 50);
  fill(255);
  text("FULL", 760, 50);
}

class Bar {
  int barX;
  int barY;
  int barMax;
  int barNo;

  Bar() {
    barX = 0;
    barY = 450;
  }


  void display() {

    if (barNo == 0) {
      fill(0, 180, 22);
    }
    if (barNo == 1) {
      fill(0, 62, 22);
    }
    if (barNo == 2) {
      fill(5, 2, 222);
    }
    if (barNo == 3) {
      fill(227, 9, 16);
    }
    if (barNo == 4) {
      fill(1, 4, 54);
    }


    rect(barX, barY, 50, 10000);
  }

  void update() {
    if (barY >= barMax) {
      barY -=4;
    }

    if (barNo ==0) {
      text("Ireland", 750, 250);
      text("83%", 750, 300);
      PImage ire;
      ire = loadImage("ireland.jpg");
      image(ire, 525, 200);
    }
    if (barNo ==1) {
      text("Italy", 750, 250);
      text("78%", 750, 300);
      PImage ita;
      ita = loadImage("italy.jpg");
      image(ita, 525, 200);
    }
    if (barNo ==2) {
      text("UK", 800, 250);
      text("69%", 800, 300);
      PImage uk;
      uk = loadImage("uk.jpg");
      image(uk, 550, 200);
    }
    if (barNo ==3) {
      text("Canada", 350, 250);
      text("67%", 350, 300);
      PImage can;
      can = loadImage("canada.jpg");
      image(can, 125, 200);
    }
    if (barNo ==4) {
      text("USA", 350, 250);
      text("65%", 350, 300);
      PImage usa;
      usa = loadImage("usa.jpg");
      image(usa, 125, 200);
    }
  }
}


class Label {
  int boxX;
  int labelNo;

  Label() {
  }

  void display() {
    noStroke();
    fill(155);
    rect(boxX, 450, 100, 50);
    fill(100);
    triangle(boxX, 450, (boxX + 100), 450, (boxX + 50), 420);
    fill(50);
    rect((boxX + 40), 475, 20, 25);
    fill(255);
    rect((boxX + 15), 460, 20, 20);
    rect((boxX + 65), 460, 20, 20);
  }
}


