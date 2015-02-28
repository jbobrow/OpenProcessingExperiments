
PImage img0, img1, img2, img3, img4, img5, img6, img7, img8;
int count, randP;
float posX, posY, opacity;
float randX, randY, randR;
boolean putPic;

void setup() {
  size(800, 600);
  frameRate(60);
  img0 = loadImage("img0.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
  img5 = loadImage("img5.jpg");
  img6 = loadImage("img6.jpg");
  img7 = loadImage("img7.jpg");
  img8 = loadImage("img8.jpg");
  randP = int(random(1, 9));
  cursor(HAND);
  count = 0;
  image(img0, 0, 0, width, height);
  imageMode(CENTER); 
  rectMode(CENTER);
  smooth();
}

void draw() {
  if (mousePressed) {
    putPic = true; 
  }
  
  if (putPic) {
    if (count == 0) {
      posX = mouseX;
      posY = mouseY;
      randP = int(random(1, 9));
      randX = random(150, 250);
      randY = random(150, 250);
      randR = random(0, 360);
    }

    opacity = map(count, 0, 60, 0, 255);
    tint(255, opacity);
    fill(255);
    
    println(randP);
    if (randP == 1) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img1, 0, 0, randX, randY);
    }
    if (randP == 2) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img2, 0, 0, randX, randY);
    }
    if (randP == 3) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img3, 0, 0, randX, randY);
    }
    if (randP == 4) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img4, 0, 0, randX, randY);
    }
    if (randP == 5) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img5, 0, 0, randX, randY);
    }
    if (randP == 6) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img6, 0, 0, randX, randY);
    }
    if (randP == 7) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img7, 0, 0, randX, randY);
    }
    if (randP == 8) {
      translate(posX, posY);
      rotate(radians(randR));
      rect(0, 0, randX+10, randY+10);
      image(img8, 0, 0, randX, randY);
    }

    count++;
    if (count == 60) {
      putPic = false;
      count = 0;

    }
  }
}


