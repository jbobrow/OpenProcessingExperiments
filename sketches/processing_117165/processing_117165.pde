


PFont font1, font2, font3, font4, font5;
PImage img1, img2, img3, img4, img5;

String p1 = "The machine they sold me did not work";
String p2 = "So they sold me another one" ;
String p3 = "To fix the problem";
String p4 = "Now I have two machines";
String p5 = "But I do the job myself";
int page = 0;


void setup() {
  size(600, 400);
  background(255);
  font1 = loadFont("YDIYGO110-KSCpc-EUC-H-100.vlw");
  font2 = loadFont("Aller-Bold-100.vlw");
  font3 = loadFont("ArtBrush-100.vlw");
  font4 = loadFont("BernhardFashion-BT-50.vlw");
  font5 = loadFont("FuturaBlackBT-Regular-50.vlw");

  img1 = loadImage("0.jpg");
  img2 = loadImage("0_1.png");
  img3 = loadImage("2.png");
  img4 = loadImage("3.jpg");
  img5 = loadImage("4.png");
}

void draw() {
  if (page == 0) {
    image(img1, 0, 0);
    pushMatrix();
    translate(-200, -200);
    image(img2, mouseX, mouseY);
    popMatrix();
    fill(224, 7, 98);
    textFont(font1, 30);
    text(p1, 50, 380);
  }
  else if ( page == 1) { 
    background(255);
    image(img2, 0, 30); 
    fill(100);
    textFont(font2, 42);
    text(p2, 20, random(95, 100));
  }
  else if (page==2) {
    background(255);
    image(img4, 0, 0);
    pushMatrix();
    translate(-100, -100);
    image(img3, mouseX, mouseY);
    popMatrix();
    fill(255, 255, 0);
    textFont(font3, 50);
    text(p3, 50, 50);
  }
  else if (page ==3) {
    background(255);
    image(img2, -130, 0); 
    image(img2, 150, 0);
    fill(0, 180, 140);
    textFont(font4, 70);
    text(p4, 0, 100);
    pushMatrix();
    textFont(font3, 20);
    fill(0, 255, 255);
    text(p4, mouseX, mouseY);
    popMatrix();
  }
  else if (page ==4) {
    background(255);
    image(img2, 0, 30);
    image(img5, random(145, 155), 0);
    fill(255, 180, 0);
    textFont(font5, 60);
    text(p5, 10, 370);
  }
}


void mousePressed() {

  if (page == 0) {
    page =1;
  }
  else if (page == 1) {
    page =int(random(2, 3));
  }
  else if (page==2) {
    page =int(random(1, 4));
  }
  else if (page==3) {
    page =4;
  }
  else if (page==4) {
    page =0;
  }
  println(page);
}



