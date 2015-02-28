

PFont f; //define font name;
PImage img0, img1, img2, img3, img4, img5, img6, img7;

//String a = hello; // a= b; "text contents: make the body simple

int page = 0;

void setup() {
  size(480, 800);
  f = loadFont("Baskerville-48.vlw");
  img0 = loadImage("0.png");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
}

void draw() {
  textAlign(CENTER); //find in reference and use what you want
  textFont(f, 30);
  smooth();

  if (page == 0) {
    background(30);
    fill(240);
    text("a famous line in flim", width/2, height/2);
  }
  else if (page == 1) {
    background(0);
    image(img0, 0, 0);
    fill(240);
    text("carpe diem", width/2, height/2);
  }
  else if (page == 2) {
    background(0);
    image(img1, 0, 0);
    fill(240);
    text("say hello to my little friend.", width/2, height/2);
  }
  else if (page == 3) {
    background(0);
    image(img2, 0, 0);
    fill(240);
    text("After all tomorrow is another day.", width/2, height/2);
  }
  else if (page == 4) {
    background(0);
    image(img3, 0, 0);
    fill(240);
    text("May the force be with you.", width/2, height/2);
  }
  else if (page == 5) {
    background(0);
    image(img4, 0, 0);
    fill(240);
    text("There's no place like home.", width/2, height/2);
  }
  else if (page == 6) {
    background(0);
    image(img5, mouseX, mouseY);
    fill(255, 0, 0);
    text("NOPE", width/2, height/2);
  }
  else if (page == 7) {
    background(0);
    image(img6, mouseX, mouseY);
    fill(255, 0, 0);
    text("NO", width/2, height/2);
  }
  else if (page == 8) {
    background(0);
    image(img7, mouseX, mouseY);
    fill(255, 0, 0);
    text("NOT", width/2, height/2);
  }
}


void mousePressed() {
  if (page == 0) {
    page = 1;
  }
  else if (page == 1) {
    page = int(random(1, 9));
  }
  else if (page == 2) {
    page = int(random(1, 9));
  }
  else if (page == 3) {
    page = int(random(1, 9));
  }
  else if (page == 4) {
    page = int(random(1, 9));
  }
  else if (page == 5) {
    page = int(random(1, 9));
  }
  else if (page == 6) {
    page = int(random(1, 9));
  }
  else if (page == 7) {
    page = int(random(1, 9));
  }
  else if (page == 8) {
    page = int(random(1, 9));
  }
}



