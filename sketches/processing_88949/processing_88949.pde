
Pimage img;
Pimage img2;
Pimage img3;
Pimage img4;
Pfont font;


void setup() {
size(600, 600);
img = loadImage("Background.png");
img2 = loadImage("Ghostbird.png");
img3 = loadImage("Ghostfat.png");
img4 = loadImage("Girlfront.png");
font = loadFont("PrimeRegular.otf");
textFont(font);
}

void draw() {
  image(img, 0, 0);
  image(img2, 70, 130);
  image(img3, 375, 150);
  image(img4,  275, 475);
  textSize(24);
  fill(75, 255, 88);
  text("Protagonist", 230, 590);
  text("Enemy Ghost", 70, 275);
  text("Enemy Ghost", 300, 275);
}



