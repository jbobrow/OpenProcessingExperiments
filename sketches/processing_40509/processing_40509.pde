
void setup () {
  size(800, 800);
  noLoop();
}

void draw() {
  
  background(random(0,255),random(0,255),random(0,255),random(0,255));

  // Text Preperation
  PFont fontOne = loadFont("one.vlw");
  PFont fontTwo = loadFont("two.vlw");
  PFont fontThree = loadFont("three.vlw");
  PFont fontFour = loadFont("four.vlw");
  PFont fontFive = loadFont("five.vlw");
  float tFace = 1;
  float tSize = 1;
  float tLetterRandom = 1;
  char tLetter ='z';

  // Shape Preparation
  noStroke();

  // Image Preparation
  float iSizePercent;



  for (int iCount=1; iCount<16; iCount++) {

    // Begin Type Play
    for (int tCount=0; tCount<15; tCount++) {

      // Choosing Typeface
      tFace = random(1, 5);
      if (tFace<=1) {
        textFont(fontOne);
      }
      else if (tFace<=2) {
        textFont(fontTwo);
      }
      else if (tFace<=3) {
        textFont(fontThree);
      }
      else if (tFace<=4) {
        textFont(fontFour);
      } 
      else {
        textFont(fontFive);
      }

      // Choosing Type Letter
      tLetterRandom = random(0, 26);
      if (tLetterRandom<=1) {
        tLetter ='a';
      }
      else if (tLetterRandom<=2) {
        tLetter ='b';
      }
      else if (tLetterRandom<=3) {
        tLetter ='c';
      }
      else if (tLetterRandom<=4) {
        tLetter ='d';
      }
      else if (tLetterRandom<=5) {
        tLetter ='e';
      }
      else if (tLetterRandom<=6) {
        tLetter ='f';
      }
      else if (tLetterRandom<=7) {
        tLetter ='g';
      }
      else if (tLetterRandom<=8) {
        tLetter ='h';
      }
      else if (tLetterRandom<=9) {
        tLetter ='i';
      }
      else if (tLetterRandom<=10) {
        tLetter ='j';
      }
      else if (tLetterRandom<=11) {
        tLetter ='k';
      }
      else if (tLetterRandom<=12) {
        tLetter ='l';
      }
      else if (tLetterRandom<=13) {
        tLetter ='m';
      }
      else if (tLetterRandom<=14) {
        tLetter ='n';
      }
      else if (tLetterRandom<=15) {
        tLetter ='o';
      }
      else if (tLetterRandom<=16) {
        tLetter ='p';
      }
      else if (tLetterRandom<=17) {
        tLetter ='q';
      }
      else if (tLetterRandom<=18) {
        tLetter ='r';
      }
      else if (tLetterRandom<=19) {
        tLetter ='s';
      }
      else if (tLetterRandom<=20) {
        tLetter ='t';
      }
      else if (tLetterRandom<=21) {
        tLetter ='u';
      }
      else if (tLetterRandom<=22) {
        tLetter ='v';
      }
      else if (tLetterRandom<=23) {
        tLetter ='w';
      }
      else if (tLetterRandom<=24) {
        tLetter ='x';
      }
      else if (tLetterRandom<=25) {
        tLetter ='y';
      }
      else {
        tLetter ='z';
      }

      // Choosing Type Size
      textSize(random(6, 128));

      fill(random(0, 255), random(0, 255), random(0, 255), random(100, 255));
      text(tLetter, random(0, 800), random(0, 800));
    }
    // End Type Play



    // Begin Shape Play
    for (int sCount=0; sCount<3; sCount++) {
      fill(random(0, 255), random(0, 255), random(0, 255), random(0, 125));
      int sPos = int(random(-100, 600));
      int sPos2 = int(random(-100, 600));
      quad(sPos+int(random(0, 300)), sPos2+int(random(0, 300)), sPos+int(random(0, 300)), sPos2+int(random(0, 300)), sPos+int(random(0, 300)), sPos2+int(random(0, 300)), sPos+int(random(0, 300)), sPos2+int(random(0, 300)));
    }

    // Begin Image Play
    // Loading Image
    PImage First = loadImage(iCount + ".jpg");

    // Image Tinting
    tint(random(0, 255),random(0,255),random(0,255));

    // Image Sizing
    First.resize(int(random(20, 200)), 0);

    // Placing Image
    image(First, random(0, 750), random(0, 750));
    // End Image Play
  }
}

void mouseClicked() {
  redraw();
}


