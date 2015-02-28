
PImage img1, img2, img3;

void setup() {
  background(60);
  size(600, 390);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
}

void draw() {
  smooth();
  frameRate(30);
  translate(200, 195);
  imageMode(CENTER);

  if ((mouseX>200) && (mouseY<200) && (mousePressed == true)) {
    imageMode(CENTER);
    img3 = img2;
    image(img3, (300-mouseX), 0);
  }
  else {
    imageMode(CENTER);
    img3 = img1;
    image(img3, (300-mouseX), 0);
  }
}



