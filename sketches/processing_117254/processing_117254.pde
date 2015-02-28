
PFont font1, font2, font3, font4, font5, font6, font7;
PImage img1, img2, img3, img4, img5;

String p1 = "A rainbow in the sky";
String p2 = "So was it when my life began";
String p3 = "and";
String p4 = "So be it now I am a man";
String p5 = "The child is wish my days to be";
String p6 = "Bound each to by natural piety.";
String p7 = "My Heart Leaps Up";
String p8 = "My Heart leaps up when I behoid";

int page = 0;

void setup() {
  size(600, 800);
  font1 = createFont("Courier", 50);
  font2 = createFont("Courier", 30);
  font3 = createFont("Avenir-Light", 70);
  font4 = createFont("FuturaStd-CondExtraBoldObl", 50);
  font5 = createFont("Helvetica-CondLtObl-100", 30);
  font6 = createFont("AGaramondPro-Regular-48", 20);
  font7 = createFont("Avenir-Roman-48", 50);


  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
}

void draw() {

  if (page == 0) {
    textAlign(CENTER);
    background(20, 20, 20);
    image(img1, 0, 0);
    fill(255, 255, 0);
    textFont(font1, 20);
    text(p1, width/2, 550);
  }

  else if (page == 1) {
    textAlign(CENTER);
    background(15, 20, 100);
    image(img5, 0, 0);
    fill(255, 255, 255);
    textFont(font2, 20);
    text(p2, width/2, 200);
  }

  else if (page == 2) {
    textAlign(CENTER);
    background(100, 200, 200);
    fill(0);
    textFont(font3, 60);
    text(p3, width/2, 400);
  }

  else if (page == 3) {
    textAlign(CENTER);
    background(0);
    image(img3, 0, 0);
    fill(255);
    textFont(font4, 20);
    text(p4, width/2, 600);
  }


  else if (page == 4) {
    textAlign(CENTER);
    background(120, 200, 100);
    fill(0);
    textFont(font5, 30);
    text(p5, width/2, 300);
  }


  else if (page == 5) {
    textAlign(CENTER);
    background(90, 90, 100);
    image(img4, 0, 0);
    fill(0);
    textFont(font6, 20);
    text(p6, width/2, 100);
  }

  else if (page == 6) {
    textAlign(CENTER);
    background(200, 100, 50);
    image(img5, 0, 0);
    fill(0);
    textFont(font6, 30);
    text(p7, width/2, 120);
  }

  else if (page == 7) {
    textAlign(CENTER);
    background(90, 100, 50);
    image(img2, 0, 0);
    fill(0);
    textFont(font6, 20);
    text(p8, width/2, 140);
  }
}

void mousePressed() {
  if (page == 0) {
    page = 1;
  } 
  else if (page == 1) {
    page = int ( random(2, 7));
  }
  else if (page == 2) {
    page = int ( random(3, 4));
  }
  else if (page == 3) {
    page = int ( random(4, 5));
  }
  else if (page == 4) {
    page = int ( random(5, 6));
  }
  else if (page == 5) {
    page = int ( random(6, 7));
  }
  else if (page == 6) {
    page = int ( random(7));
  }
  else if (page == 7) {
    page = int ( 8);
  }

  println(page);
}



