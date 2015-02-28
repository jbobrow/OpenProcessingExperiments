
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;

int imageChoice;

void setup() {
  size(580, 470);
  img = loadImage("Bunny.jpg");
  img11 = loadImage("Bunny2.jpg");
  img2 = loadImage("carrot.png");
  img3 = loadImage("broccoli.png");
  img4 = loadImage("lettuce.png");
  img5 = loadImage("peas.png");
  img6 = loadImage("strawberry.png");
  img7 = loadImage("sammich.png");
  img8 = loadImage("fries.png");
  img9 = loadImage("pizza.png");
  img10 = loadImage("steak.png");
}
void draw() {
  image(img, 0, 0, 580, 470);
  float randomX = random(0, 400);
  float randomY = random(0, 200);
  float randomTint = random(0, 255);
  tint(255, randomTint);
  image(img11, 0, 0, 580, 470);
  
  tint(255, 255);
  
  if (imageChoice == 0){
  image(img2, mouseX-25, mouseY-30);
}
  if (imageChoice == 1){
  image (img3, mouseX-25, mouseY-30);
  }
 if (imageChoice == 2){
  image (img4, mouseX-25, mouseY-30);
  }
 if (imageChoice == 3){
  image (img5, mouseX-25, mouseY-30);
  }
 if (imageChoice == 4){
  image (img6, mouseX-25, mouseY-30);
  }
 if (imageChoice == 5){
  image (img7, mouseX-25, mouseY-30);
  }
 if (imageChoice == 6){
  image (img8, mouseX-25, mouseY-30);
  }
  if (imageChoice == 7){
  image (img9, mouseX-25, mouseY-30);
  }
  if (imageChoice == 8){
  image (img10, mouseX-25, mouseY-30);
  }
}


void mousePressed() {
  imageChoice = imageChoice + 1;
  if (imageChoice > 8) {
    imageChoice = 0;
  }
}

