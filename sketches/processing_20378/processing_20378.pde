
PFont amer;
PFont amercon;


int currH; // actual time
int nextH; // soon to be time
int drawH; // drawing placeholder thingy (changes everytime)
int m;

color currC;
color nextC;



void setup () {
  size(640, 480);
  smooth();

  amer = loadFont ("amer.vlw");
  amercon = loadFont ("amercon.vlw");
  
  textFont(amer, 32); 
  textAlign(CENTER);
  textSize(75);

  currC = color(11, 177, 202);
  //nextC = color(255, 70, 35);
  nextC = color(11, 141, 177);

}


void draw () {
  background (255);


  currH = hour() % 12;
  nextH = currH + 1;

  if (currH == 0) currH = 12;

  
  // get the minutes
  m = minute();


  fill(0);
  // draw it!
  
  //////////////
  if (m >0) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(420, 174); // move me
  rotate(radians(-96)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 1) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(185, 392); // move me
  rotate(radians(-10)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 2) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(240, 192); // move me
  rotate(radians(22)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 3) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(419, 264); // move me
  rotate(radians(-78)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  
    /////////////
  if (m > 4) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(409, 343); // move me
  rotate(radians(77)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  
    /////////////
  if (m > 5) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(194, 228); // move me
  rotate(radians(-117)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 6) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(323, 393); // move me
  rotate(radians(-57)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 7) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(443, 63); // move me
  rotate(radians(-127)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 8) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(168, 122); // move me
  rotate(radians(-135)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 9) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(505, 220); // move me
  rotate(radians(177)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 10) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(309, 49); // move me
  rotate(radians(-158)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 11) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(218, 300); // move me
  rotate(radians(88)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 12) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(320, 263); // move me
  rotate(radians(77)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 13) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(523, 305); // move me
  rotate(radians(-57)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 14) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(387, 94); // move me
  rotate(radians(-145)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 15) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(228, 138); // move me
  rotate(radians(-102)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 16) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(397, 422); // move me
  rotate(radians(64)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 17) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(465, 196); // move me
  rotate(radians(-25)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 18) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(276, 399); // move me
  rotate(radians(-128)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 19) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(155, 270); // move me
  rotate(radians(-117)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 20) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(338, 181); // move me
  rotate(radians(16)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 21) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(316, 221); // move me
  rotate(radians(-105)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
 /////////////
  if (m > 22) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(243, 59); // move me
  rotate(radians(-118)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 23) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(351, 326); // move me
  rotate(radians(2)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 24) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(331, 429); // move me
  rotate(radians(22)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 25) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(231, 320); // move me
  rotate(radians(-155)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
    /////////////
  if (m > 26) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(505, 174); // move me
  rotate(radians(-26)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 27) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(217, 214); // move me
  rotate(radians(102)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 28) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(370, 349); // move me
  rotate(radians(123)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
    
  /////////////
  if (m > 29) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(115, 173); // move me
  rotate(radians(123)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
 
     
  /////////////
  if (m > 29) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(280, 430); // move me
  rotate(radians(99)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  
  
/////////////
  if (m > 30) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(114, 174); // move me
  rotate(radians(122)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 31) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(472, 358); // move me
  rotate(radians(54)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 32) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(290, 152); // move me
  rotate(radians(-178)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 33) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(470, 275); // move me
  rotate(radians(-116)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 34) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(175, 282); // move me
  rotate(radians(156)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 35) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(362, 80); // move me
  rotate(radians(50)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 36) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(307, 301); // move me
  rotate(radians(-167)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 37) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(270, 130); // move me
  rotate(radians(-56)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 38) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(247, 380); // move me
  rotate(radians(35)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  
  /////////////
  if (m > 39) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(439, 196); // move me
  rotate(radians(-136)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 40) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(196, 415); // move me
  rotate(radians(53)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  
  /////////////
  if (m > 41) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(435, 252); // move me
  rotate(radians(63)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 42) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(324, 114); // move me
  rotate(radians(45)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 43) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(171, 203); // move me
  rotate(radians(64)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 44) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(357, 42); // move me
  rotate(radians(-84)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 45) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(408, 287); // move me
  rotate(radians(-158)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 46) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(293, 99); // move me
  rotate(radians(177)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 47) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(475, 205); // move me
  rotate(radians(75)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 48) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(454, 85); // move me
  rotate(radians(172)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
  /////////////
  if (m > 49) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(376, 400); // move me
  rotate(radians(178)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 50) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(134, 259); // move me
  rotate(radians(-7)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 51) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(273, 295); // move me
  rotate(radians(57)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 52) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(367, 194); // move me
  rotate(radians(-120)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 53) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(272, 78); // move me
  rotate(radians(-4)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 54) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(350, 377); // move me
  rotate(radians(-6)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m >55) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(135, 303); // move me
  rotate(radians(155)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 56) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(436, 361); // move me
  rotate(radians(130)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 57) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(203, 283); // move me
  rotate(radians(37)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 58) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(404, 156); // move me
  rotate(radians(29)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  
/////////////
  if (m > 59) {
    drawH = nextH;
    fill(nextC);
  } else {
    drawH = currH;
    fill(currC);
  }
  
  pushMatrix();
  translate(204, 117); // move me
  rotate(radians(-53)); // change my rotation
  text(drawH, 0, 0); //draw me
  popMatrix();
  

  
  
  
  ////// Text Size Change
  
  if (nextH > 9 || currH >9) {
    textFont(amercon);
    textSize(70);
  }
  
  
  


pushMatrix();
translate(320, 240);
rotate(radians(-90));

   //SECOND HAND
   pushMatrix();
   float s = second();
   float sMapped = map(s, 0, 60, 0, 360);
   rotate(radians(sMapped));
   stroke(0);
   strokeWeight(4);
   line(0, 0, 175, 0);
   popMatrix();
   
   //MINUTE HAND
   pushMatrix();
   float m = minute();
   float mMapped = map(m, 0, 60, 0, 360);
   rotate(radians(mMapped));
   stroke(0);
   strokeWeight(6);
   line(0, 0, 125, 0);
   popMatrix();
   
   //HOUR HAND
   pushMatrix();
   float h = hour();
   //  float hModulo = h % 12;
   float hMapped = map(h % 12, 0, 12, 0, 360);
   rotate(radians(hMapped));
   stroke(0);
   strokeWeight(8);
   line(0, 0, 100, 0);
   popMatrix();
   
popMatrix ();
   
}


