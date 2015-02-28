
// Summer Myung
// Final
// December, 13, 2012

PImage First;
PImage _1; 
PImage _2;
PImage _3;
PImage _4;
PImage _5;
PImage _6;
PImage FINAL;
PImage Arrow;
PFont Futura;


String subheadClicked = "appear";


void setup () {
  background(255);
  size (1651, 1275);


  Futura = loadFont("Futura-MediumItalic-150.vlw");


  First = loadImage("CREATIVE_1.png");
  _1 = loadImage("CREATIVE_2.png");
  _2 = loadImage("CREATIVE_3.png");
  _3 = loadImage("CREATIVE_4.png");
  _4 = loadImage("CREATIVE_5.png");
  _5 = loadImage("CREATIVE_6.png");
  _6 = loadImage("CREATIVEFINAL.png");
  Arrow = loadImage("ARROW.png");
  FINAL = loadImage("CREATIVEFINAL.png");
  textFont(Futura);
}

void draw() {


  image (First, 0, 0);

  if (subheadClicked == "_2") {
    image(_1, 0, 0);
  }

  if (subheadClicked == "_3") {
    image (_2, 0, 0);
  }

  if (subheadClicked == "_4") {
    image (_3, 0, 0);
    fill(random(255));
    text ("30%", 860, 460);
  }

  if (subheadClicked == "_5") {
    image (_4, 0, 0);
    fill(0);
    text ("30%", 860, 460);
  }

  if (subheadClicked == "_6") {
    image (_5, 0, 0);
    fill(0);
    text ("30%", 860, 460);
  }


  if (subheadClicked == "FINAL") {
    image (FINAL, 0, 0);
    fill(0);
    text ("30%", 860, 460);
  }



  // shadow

  if ( (mouseX > 67) && (mouseX < 505) && ( mouseY > 394) && (mouseY < 450) ) {
    fill(30, 30, 20, 100);
    noStroke();
    rect(64, 391, 445, 61);
  }


  if ( (mouseX > 65) && (mouseX < 803) && ( mouseY > 800) && (mouseY < 864) ) {
    fill(30, 30, 20, 100);
    noStroke();
    rect(64, 798, 744, 64);
  }

  if ( (mouseX > 742) && (mouseX < 1439) && ( mouseY > 82) && (mouseY < 187) ) {
    fill(30, 30, 20, 100);
    noStroke();
    rect(739, 82, 703, 109);
  }

  if ( (mouseX > 910) && (mouseX < 1602) && (mouseY > 564) && (mouseY < 622) ) {
    fill(30, 30, 20, 100);
    noStroke();
    rect(908, 564, 697, 61);
  }


  if ( (mouseX > 945) && (mouseX < 1565) && (mouseY > 673) && (mouseY < 853) ) {
    fill(30, 30, 20, 100);
    noStroke();
    rect(945, 673, 622, 175);
  }


  if ( (mouseX > 1150) && (mouseX < 1256) && (mouseY > 875) && (mouseY < 984) ) {
    image(Arrow, 0, 0);
  }
}



void mouseClicked() {

  if ( (mouseX > 67) && (mouseX < 505) && ( mouseY > 394) && (mouseY < 450) ) {
    subheadClicked = "_2";
  } 


  if ( (mouseX > 65) && (mouseX < 803) && (mouseY > 800) && (mouseY < 864) ) {
    subheadClicked = "_3";
  }

  if ( (mouseX >742) && (mouseX < 1439) && (mouseY > 82) && (mouseY < 187) ) {
    subheadClicked = "_4";
  }

  if ( (mouseX > 910) && (mouseX < 1602) && (mouseY > 564) && (mouseY < 622) ) {
    subheadClicked = "_5";
  }

  if ( (mouseX > 945) && (mouseX < 1565) && (mouseY > 673) && (mouseY < 853) ) {
    subheadClicked = "_6";
  }

  if ( (mouseX > 1185) && (mouseX < 1206) && (mouseY > 892) && (mouseY < 984) ) {
    subheadClicked = "FINAL";
  }
}


