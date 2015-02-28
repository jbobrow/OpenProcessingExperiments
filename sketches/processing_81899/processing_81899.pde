
import netscape.javascript.*;

void setup() {
  size(1200,700);
  background(#716c61);
  
  PImage impasse;
  impasse = loadImage("impasse.png");
  image(impasse, 300, 100);
}

void draw() {
  noStroke();
  fill(#7C7B79, 7);
  rect(680, 30, 340, 290);
  rect(180, 480, 340, 190); 
  tele1();
  tele2();
  rec();
}

void tele1() {
  for (int x = 700; x < 1000; x = x + 4) {
    for (int y = 50; y < 300; y = y + 4) {
      fill(random(50,200));
      noStroke();
      rect(x,y,4,4);
    }
  }
}

void tele2() {
    for (int x = 200; x < 500; x = x + 4) {
    for (int y = 500; y < 650; y = y + 4) {
      fill(random(50,200));
      noStroke();
      rect(x,y,4,4);
    }
  }
}

void rec() {
  fill(random(160, 180));
  textSize(32);
  text("rec", 210+20, 80);
  //fill(#D63027);
  fill(random(210,240), 51, 41);
  ellipse(265+20, 72, 15,15);
}

