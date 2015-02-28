
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

int imgCount = 0;

void setup() {
  size(800, 500);
  background(255);

  img = loadImage("the-beatles1.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
}

void draw() {
  if(mousePressed){
    imgCount = 0;
  }
  
  if (mouseX > 170 && mouseX < 262 && mouseY > 88 && mouseY < 206 && mousePressed) {
    imgCount = 1;
  }


  if (mouseX > 296 && mouseX < 380 && mouseY > 51 && mouseY < 158 && mousePressed) {
    imgCount = 2;
  }

  if (mouseX > 439 && mouseX < 507 && mouseY > 99 && mouseY < 168 && mousePressed) {
    imgCount = 3;
  }

  if (mouseX > 550 && mouseX < 617 && mouseY > 180 && mouseY < 232 && mousePressed) {
    imgCount = 4;
  }

  background(255);
  image(img, 175, 0);
  
  if (imgCount == 1) {
    image(img1, 0, 300);
  }
  
  if(imgCount == 2){
    image(img2, 200, 300);
  }
  
  if(imgCount == 3) {
    image(img3, 400, 300);
  }
  
  if(imgCount == 4) {
    image(img4, 600, 300);
  }
}



