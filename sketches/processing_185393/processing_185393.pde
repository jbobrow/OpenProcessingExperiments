
/* Data visualization:
 Exploratorium Cycle of Emotions*/


PImage img, img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16;

void setup() {
  size(1125, 750);

  img = loadImage("main.png");
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


  if (dist(mouseX, mouseY, 370, 280)<20) {
    cOne();
  }
  else if (dist(mouseX, mouseY, 440, 270)<40) {
    cTwo();
  }
  else if (dist(mouseX, mouseY, 530, 270)<40) {
    cThree();
  }
  else if (dist(mouseX, mouseY, 700, 270)<60) {
    cFour();
  }
  else if (dist(mouseX, mouseY, 890, 270)<20) {
    cFive();
  }
  else if (dist(mouseX, mouseY, 270, 420)<60) {
    excOne();
  }
  else if (dist(mouseX, mouseY, 440, 420)<20) {
    excTwo();
  }
   else if (dist(mouseX, mouseY, 530, 420)<40) {
    excThree();
  }
  else if (dist(mouseX, mouseY, 800, 420)<30) {
    excFour();
  }
  else if (dist(mouseX, mouseY, 1000, 420)<60) {
    excFive();
  }
  else if (dist(mouseX, mouseY, 450, 560)<20) {
    exhOne();
  }
  else if (dist(mouseX, mouseY, 530, 560)<60) {
    exhTwo();
  }
  else if (dist(mouseX, mouseY, 610, 560)<20) {
    exhThree();
  }
  else if (dist(mouseX, mouseY, 700, 560)<40) {
    exhFour();
  }
  else if (dist(mouseX, mouseY, 890, 560)<60) {
    exhFive();
  }
  else if (dist(mouseX, mouseY, 1060, 220)<40) {
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


