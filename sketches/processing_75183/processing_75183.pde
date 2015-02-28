
//load images
PImage imgBackground;
PImage imgDH2;
PImage imgDH3;
PImage imgEgg;
PImage imgC1;
PImage imgK1;
PImage imgK2;
PImage imgK3;
PImage imgK4;
PImage imgK5;
PImage imgK6;
PImage imgB1;

int i = 0;

//catepilar
int startX = 75;
int stopX = 220;
int startY = 528;
int stopY = 555;
float x = startX;
float y = startY;

//butterfly
int startXB1 = 156;
int stopXB1 = 230;
int startYB1 = 144;
int stopYB1 = 324;
float xB1 = startXB1;
float yB1 = startYB1;

int startXB2 = 242;
int stopXB2 = 42;
int startYB2 = 123;
int stopYB2 = 27;
float xB2 = startXB2;
float yB2 = startYB2;


void setup() {
  size (458, 598);
  smooth();
  imgBackground = loadImage("Tree3.png");

  imgEgg = loadImage("Egg.png");

  imgC1 = loadImage("C1.png");

  imgK1 = loadImage("K1.png");
  imgK2 = loadImage("K2.png");
  imgK3 = loadImage("K3.png");
  imgK4 = loadImage("K4.png");
  imgK5 = loadImage("K5.png");
  imgK6 = loadImage("K6.png");

  imgB1 = loadImage("B1.png");
//  imgB2 = loadImage("B2.png");
//  imgB3 = loadImage("B3.png");


  imgDH2 = loadImage("DH2.png");
  imgDH3 = loadImage("DH3.png");

  //background
  image(imgBackground, 0, 0);

  //Damien Hirst
  image(imgDH2, 0, 0);
}

void draw() {

  frameRate(10);

  if (i<15) {
    image(imgEgg, 51, 488);
    i++;
  }

  if (i>=15 && i<60) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    pushMatrix();
    float r = random(-radians(2), radians(5));
    translate(51, 543);
    rotate(r);
    image(imgEgg, 0, -55);
    popMatrix();
    i++;
  }

  if (i>=60 && i<160) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    x = startX + ((stopX - startX) * (i-60)/100);
    y = startY + ((stopY - startY) * (i-60)/100);

    image(imgC1, x, y);
    i++;
  }

  if (i>=160 && i<260) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    pushMatrix();
    translate(214, 350);
    rotate(radians(-1*(i-160)));
    image(imgC1, 6, 205);
    popMatrix();

    i++;
  }

  if (i>=260 && i<300) {

    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    pushMatrix();
    translate(112, 305);
    rotate(radians(-1*(i-170)));
    image(imgC1, 0, 300);
    popMatrix();

    i++;
  }

  if (i>=300 && i<450) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    pushMatrix();
    translate(112, 305);
    rotate(radians(-130));
    image(imgC1, i-300, 300);
    popMatrix();

    i+=5;
  }

  if (i>=450 && i<600) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK1, 0, i-590);
    i+=10;
  }

  if (i>=600 && i<700) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK1, 0, 0);
  }

  if (i>=600 && i<610) {
    i++;
  }

  if (i>=610 && i<710) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK1, 0, 610-i);
    image(imgK2, 0, i-700);
    i+=10;
  }

  if (i>=710 && i<720) {
    i++;
  }

  if (i>=720 && i<820) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK2, 0, 720-i);
    image(imgK3, 0, i-810);
    i+=10;
  }

  if (i>=820 && i<830) {
    i++;
  }

  if (i>=830 && i<930) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK3, 0, 830-i);
    image(imgK4, 0, i-920);
    i+=10;
  }

  if (i>=930 && i<940) {
    i++;
  }

  if (i>=940 && i<1140) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK4, 0, 940-i);
    image(imgK5, 0, i-1130);
    i+=10;
  }

  if (i>=1140 && i<1150) {
    i++;
  }

  if (i>=1150 && i<1400) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    image(imgK5, 0, 1050-i);
    image(imgK6, 0, i-1390);
    i+=10;
  }
  
    if (i>=1400 && i<1410) {
    i++;
  }

  if (i==1410) {
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);

    imageMode(CENTER);
    image(imgB1, 156, 144);
    i++;
  }

  if (i>1410 && i<1420) {
    i++;
  }

  if (i>=1420 && i<=1520) {
    imageMode(CORNER);
    image(imgBackground, 0, 0);
    image(imgDH2, 0, 0);
    
    xB1 = startXB1 + ((stopXB1 - startXB1) * (i-1420)/100);
    yB1 = startYB1 + ((stopYB1 - startYB1) * (i-1420)/100);
    
    xB2 = startXB2 + ((stopXB2 - startXB2) * (i-1420)/100);
    yB2 = startYB2 + ((stopYB2 - startYB2) * (i-1420)/100);

    imageMode(CENTER);
    image(imgB1, xB1, yB1, xB2, yB2);
    i+=10;
  }
  if (i==1530) {
    imageMode(CORNER);
    image(imgBackground, 0, 0);
    image(imgDH3, 0, 0);
  }
}



