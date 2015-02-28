
/* Data visualization:
 Exploratorium Cycle of Emotions*/


PImage img, img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16;

void setup() {
  size(1080, 720);

  img = loadImage("mainpage.png");
  img1 = loadImage("cone.png");
  img2 = loadImage("ctwo.png");
  img3 = loadImage("cthree.png");
  img4 = loadImage("cfour.png");
  img5 = loadImage("cfive.png");
  img6 = loadImage("excone.png");
  img7 = loadImage("exctwo.png");
  img8 = loadImage("excthree.png");
  img9 = loadImage("excfour.png");
  img10 = loadImage("excfive.png");
  img11 = loadImage("exhone.png");
  img12 = loadImage("exhtwo.png");
  img13 = loadImage("exhthree.png");
  img14 = loadImage("exhfour.png");
  img15 = loadImage("exhfive.png");
  img16 = loadImage("all.png");
}



void draw() {


  if (dist(mouseX, mouseY, 318, 270)<50) {
    cOne();
  }
  else if (dist(mouseX, mouseY, 383, 270)<70) {
    cTwo();
  }
  else if (dist(mouseX, mouseY, 465, 270)<70) {
    cThree();
  }
  else if (dist(mouseX, mouseY, 654, 270)<70) {
    cFour();
  }
  else if (dist(mouseX, mouseY, 820, 270)<50) {
    cFive();
  }
  else if (dist(mouseX, mouseY, 280, 380)<70) {
    excOne();
  }
  else if (dist(mouseX, mouseY, 393, 380)<50) {
    excTwo();
  }
   else if (dist(mouseX, mouseY, 470, 380)<70) {
    excThree();
  }
  else if (dist(mouseX, mouseY, 760, 380)<50) {
    excFour();
  }
  else if (dist(mouseX, mouseY, 950, 380)<70) {
    excFive();
  }
  else if (dist(mouseX, mouseY, 410, 508)<50) {
    exhOne();
  }
  else if (dist(mouseX, mouseY, 507, 503)<70) {
    exhTwo();
  }
  else if (dist(mouseX, mouseY, 570, 510)<50) {
    exhThree();
  }
  else if (dist(mouseX, mouseY, 670, 510)<70) {
    exhFour();
  }
  else if (dist(mouseX, mouseY, 840, 510)<70) {
    exhFive();
  }
  else if (dist(mouseX, mouseY, 960, 250)<70) {
    all();
  }
  else {
    image(img, 0, 0);
  }
}




void all() {
  image(img16, 0, 0);
}








void cOne() {
  image(img1, 0, 0);
}
void cTwo() {
  image(img2, 0, 0);
}
void cThree() {
  image(img3, 0, 0);
}
void cFour() {
  image(img4, 0, 0);
}
void cFive() {
  image(img5, 0, 0);
}

void excOne() {
  image(img6, 0, 0);
}
void excTwo() {
  image(img7, 0, 0);
}
void excThree() {
  image(img8, 0, 0);
}
void excFour() {
  image(img9, 0, 0);
}
void excFive() {
  image(img10, 0, 0);
}

void exhOne() {
  image(img11, 0, 0);
}
void exhTwo() {
  image(img12, 0, 0);
}
void exhThree() {
  image(img13, 0, 0);
}
void exhFour() {
  image(img14, 0, 0);
}
void exhFive() {
  image(img15, 0, 0);
}


