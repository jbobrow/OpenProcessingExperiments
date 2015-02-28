
PFont font1, font2;
PImage [] img = new PImage[8];

String p1 ="94";
String p2 ="He is back in 94.";
String p3 ="He needs a better road.";
String p4 ="He always needs more.";
String p5 ="He is back in 94.";
String p6 ="He is dancing all alone.";
String p7 ="I want them down.";
String p8 ="Trying to catch all the clolors that faded";

int page = 0;

void setup() {

  size(600, 400);
  background(228, 216, 200);



  for (int i = 1; i<8; i++) {
    img [i] = loadImage(i+".png");
  }


  font1 = loadFont("DINAlternate-Bold-200.vlw");
  font2 = loadFont("DINAlternate-Bold-48.vlw");
}



void draw() {

  smooth();

  if (page == 0) {
    background(228, 216, 200);
    textFont(font1, 200);
    text(p1, 350, 260);
  }
  else if (page ==1) {
    background(228, 216, 200);
    image(img[1], 0, 50);
    textFont(font2, 24);
    text(p2, 370, 200);
  }
  else if (page ==2) {
    background(228, 216, 200);
    image(img[7], 200, 70);
    textFont(font2, 24);
    text(p3, 282, 120);
  }
  else if (page==3) {
    background(228, 216, 200);
    image(img[3], 10, 100);
    textFont(font2, 24);
    text(p4, 325, 250);
  }
  else if (page==4) {
    background(228, 216, 200);
    image(img[4], 150, 50);
    textFont(font2, 24);
    text(p5, 210, 150);
  }
  else if (page==5) {
    background(228, 216, 200);
    image(img[6], 150, 40);
    textFont(font2, 20);
    text(p6, 200, 370);
  }
  else if (page==6) {
    background(228, 216, 200);
    image(img[2], 150, 30);
    textFont(font2, 24);
    text(p7, 200, 180);
  }
  else if (page==7) {
    background(228, 216, 200);
    image(img[5], 0, 50);
    textFont(font2, 24);
    text(p8, 83, 152);
  }
}

void mousePressed() {
  if (page == 0)  
  {
    page = int(random(1, 2));
  }
  else if (page ==1)
  {
    page = int(random(2, 3));
  }
  else if (page ==2)
  {
    page = int(random(3, 4));
  } 
  else if (page ==3)
  {
    page = int(random(4, 5));
  } 
  else if (page ==4)
  {    
    page = int(random(5, 6));
  } 
  else if (page ==5)
  {
    page = int(random(6, 7));
  }
  else if (page ==6)
  {
    page = int(random(7, 0));
  }
  else if (page ==7)
  {
    page = 0;
  }
}



