
PImage myImage1;
PImage myImage2;
PImage x;
void setup(){
  size (1000,800);
  myImage1 = loadImage ("image.jpeg");
  myImage2 = loadImage ("image2.png");
  x = loadImage ("image3.png");
}

void draw(){
  tint (255,255,255,100);
  image (myImage1, 0,0,1000,800);
  tint (190,69,67,100);
  image (x, -10, 550, 300, 300);
  image (x, -10, 500, 300, 300);
  image (x, random (10,12), random(519,521), 300, 300);
  image (x, 12, 540, 300, 300);
  tint (175, 80, 80, 100);
  image (x, -10, 450, 275, 275);
  image (x, 15, 400, 275, 275);
  image (x, random(24,26), random (419,421), 275, 275);
  tint (140, 85, 85, 100);
  image (x, -10, 300, 250, 250);
  image (x, 200, 350, 250, 250);
  image (x, 200, 450, 250, 250);
  image (x, 300, 500, 250, 250);
  image (x, 20, 200, 200, 200);
  image (x, 200, 175, 200, 200);
  image (x, 370, 300, 150, 150);
  image (x, 420, 550, 150, 150);
  image (x, random(10, 30), random (50, 70), 125,125);
  image (x, random (390, 410), random(190, 210), 128, 128);
  image (x, random (390, 410), random (400,420), 125, 125);
  image (x, random (440, 460), random (410, 430), 126, 126);
  image (x, random (410, 430), random (120, 140), 129, 129);
  tint (130, 110, 110, 100);
  image (x, random (480, 510), random (500, 520), 170, 170);
  image (x, random (50, 70), random (130, 150), 180, 180);
  image (x, random (230, 250), random (-20, 0), 160, 160);
  image (x, random (550, 570), random (250, 270), 190, 190);
  image (x, random (580, 600), random (200, 220), 120, 120);
  image (x, random (630, 650), random (180, 200), 120, 120);
  tint (100, 130, 130, 100);
  image (x, random (710, 750), random (520, 570), 100, 100);
  image (x, random (590, 640), random (-10, 30), 100, 100);
  image (x, random (750, 800), random (350, 400), 90, 90);
  image (x, random (860, 910), random (-10, 50), 85, 85);

}

