

PImage street;
PImage mustard;
PImage fancycats1;
PImage fancycats2;
PImage fancycats3;
PImage fancycats4;
PImage fancycats5;
PImage fancycats6;
PImage fancycats7;
PImage fancycats8;
PImage fancycats9;
PImage fancycats10;
PImage fancycats11;
PImage fancycats12;
PImage fancycats13;
PImage fancycats14;
PImage fancycats15;



int ang1Deg= 45;
int ang2Deg= 225;
int ang3Deg= 90;

float mustardX=0;
float mustardY=0;

float streetX=0;

float fancycats1X= -125; //1 
float fancycats1Y= 50; 
float fancycats2X= -200; //2
float fancycats2Y= 50;
float fancycats3X= -275; //3
float fancycats3Y= 50;
float fancycats4X= -350; //4
float fancycats4Y= 50;
float fancycats5X= -425; //5
float fancycats5Y= 50;
float fancycats6X= -495; //6
float fancycats6Y= 50;
float fancycats7X= -565; //7
float fancycats7Y= 50;
float fancycats8X= -630; //8
float fancycats8Y= 50;
float fancycats9X= -695; //9
float fancycats9Y= 50;
float fancycats10X= -770; //10
float fancycats10Y= 50;
float fancycats11X= -845; //11
float fancycats11Y= 50;
float fancycats12X= -925; //12
float fancycats12Y= 50;
float fancycats13X= -1000; //13
float fancycats13Y= 50;
float fancycats14X= -1075; //14
float fancycats14Y= 50;
float fancycats15X= -1150; //15
float fancycats15Y= 50;

float velX = 2;

int amplitude1 = 30;
int amplitude2 = 50;

void setup() {
  size(1024, 768);
  smooth();

  mustard = loadImage("scottP.png");
  street = loadImage("cityStreet.jpg");
  fancycats1 = loadImage("fancycats01.png");
  fancycats2 = loadImage("fancycats02.png");
  fancycats3 = loadImage("fancycats03.png");  
  fancycats4 = loadImage("fancycats04.png");
  fancycats5 = loadImage("fancycats05.png");
  fancycats6 = loadImage("fancycats06.png");
  fancycats7 = loadImage("fancycats07.png");
  fancycats8 = loadImage("fancycats08.png");
  fancycats9 = loadImage("fancycats09.png");
  fancycats10 = loadImage("fancycats10.png");
  fancycats11 = loadImage("fancycats11.png");
  fancycats12 = loadImage("fancycats12.png");
  fancycats13 = loadImage("fancycats13.png");
  fancycats14 = loadImage("fancycats14.png");
  fancycats15 = loadImage("fancycats15.png");


}

void draw() {


  image(street, streetX, 0);

  ang1Deg += 5;
  ang2Deg += 5;
  ang3Deg += 5;

  if (ang1Deg > 405) {
    ang1Deg= 45;
    ang2Deg= 225;
    ang3Deg= 60;
  }

  float ang1 = radians(ang1Deg); // convert degrees to radians
  float ang2 = radians(ang2Deg);
  float ang3 = radians(ang3Deg);

// Here's where we enter all the sign function for the 15 cats //
  
  image(mustard, mustardX, mustardY+335);
  mustardX+=velX;
  mustardY = (amplitude1 * sin(ang1));

  image(fancycats1, fancycats1X, fancycats1Y+50);
  fancycats1X+=velX;
  fancycats1Y = (amplitude1 * sin(ang2));

  image(fancycats2, fancycats2X, fancycats2Y+50);
  fancycats2X+=velX;
  fancycats2Y = (amplitude2 * sin(ang3));

  image(fancycats3, fancycats3X, fancycats3Y+50);
  fancycats3X+=velX;
  fancycats3Y = (amplitude1 * sin(ang3));
  
  image(fancycats4, fancycats4X, fancycats4Y+50);
  fancycats4X+=velX;
  fancycats4Y = (amplitude1 * sin(ang1));

  image(fancycats5, fancycats5X, fancycats5Y+50);
  fancycats5X+=velX;
  fancycats5Y = (amplitude2 * sin(ang3));

  image(fancycats6, fancycats6X, fancycats6Y+50);
  fancycats6X+=velX;
  fancycats6Y = (amplitude1 * sin(ang3));
  
  image(fancycats7, fancycats7X, fancycats7Y+50);
  fancycats7X+=velX;
  fancycats7Y = (amplitude2 * sin(ang1));

  image(fancycats8, fancycats8X, fancycats2Y+50);
  fancycats8X+=velX;
  fancycats8Y = (amplitude2 * sin(ang2));

  image(fancycats9, fancycats9X, fancycats9Y+50);
  fancycats9X+=velX;
  fancycats9Y = (amplitude1 * sin(ang3));
  
  image(fancycats10, fancycats10X, fancycats10Y+50);
  fancycats10X+=velX;
  fancycats10Y = (amplitude1 * sin(ang1));
  
  image(fancycats11, fancycats11X, fancycats11Y+50);
  fancycats11X+=velX;
  fancycats11Y = (amplitude2 * sin(ang3));

  image(fancycats12, fancycats12X, fancycats12Y+50);
  fancycats12X+=velX;
  fancycats12Y = (amplitude1 * sin(ang3));
  
  image(fancycats13, fancycats13X, fancycats13Y+50);
  fancycats13X+=velX;
  fancycats13Y = (amplitude1 * sin(ang3));
  
  image(fancycats14, fancycats14X, fancycats14Y+50);
  fancycats14X+=velX;
  fancycats14Y = (amplitude2 * sin(ang3));
  
  image(fancycats15, fancycats15X, fancycats15Y+50);
  fancycats15X+=velX;
  fancycats15Y = (amplitude2 * sin(ang1));

 // Here's where the loop is placed, so they return and repeat. Thanks Daniel Selden for that
// precious piece of logistics!!!!
 
  if (mustardX>2000) {
    mustardX=0;
  }
  if (fancycats1X>2000) {
    fancycats1X=0;
  }
  if (fancycats2X>2000) {
    fancycats2X=0;
  }
  if (fancycats3X>2000) {
    fancycats3X=0;
  }
  if (fancycats4X>2000) {
    fancycats4X=0;
  }
  if (fancycats5X>2000) {
    fancycats5X=0;
  }
  if (fancycats6X>2000) {
    fancycats6X=0;
  }
  if (fancycats7X>2000) {
    fancycats7X=0;
  }
  if (fancycats8X>2000) {
    fancycats8X=0;
  }
  if (fancycats9X>2000) {
    fancycats9X=0;
  }
  if (fancycats10X>2000) {
    fancycats10X=0;
  }
  if (fancycats11X>2000) {
    fancycats11X=0;
  }
  if (fancycats12X>2000) {
    fancycats12X=0;
  }
  if (fancycats13X>2000) {
    fancycats13X=0;
  }
  if (fancycats14X>2000) {
    fancycats14X=0;
  }
  if (fancycats15X>2000) {
    fancycats15X=0;
  }
}


