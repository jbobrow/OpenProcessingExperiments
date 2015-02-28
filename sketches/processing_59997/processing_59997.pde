
PImage kt1, wildfox1, wildfox2, wildfox4, banana1, lulu1, mason1, green1, bella1, dad1, dp1, tim1, kt3, mom1, kt2;
PFont font, fontDefault;
color bColor = #F0EE94;
boolean startUpBoolean = true;
boolean shoppingPageBoolean, step2Boolean, finalPageBoolean, goToLinkBoolean, happyBirthdayBoo= false;
boolean wildfox1Boo, wildfox2Boo, wildfox4Boo, banana1Boo, lulu1Boo, mason1Boo, green1Boo, dad1Boo, mom1Boo, bella1Boo, tim1Boo, dp1Boo, kt2Boo, kt3Boo;

String wildfox1Link = "http://www.wildfoxcouture.com/BIG-HEART---CASSIDY-PID38006-WCJ755909.aspx";
String wildfox2Link = "http://www.wildfoxcouture.com/FRIENDS---OVERSIZED-V-PID37421-WTJ721A72.aspx";
String green1Link = "http://begreenman.com/Purchase.html";
String wildfox4Link = "http://www.wildfoxcouture.com/COWGIRL-BALLERINA-at-Wildfox-PID34741-WTJ913A65.aspx";
String banana1Link = "http://bananarepublic.gap.com/browse/product.do?cid=48422&pid=462104002&mlink=5002,4877951,8&clink=4877951";
String lulu1Link = "http://www.lulus.com/products/good-and-pleat-y-black-and-white-skirt/50337.html";
String mason1Link = "http://www.shopbop.com/wrap-dress-mason-by-michelle/vp/v=1/845524441923540.htm?folderID=2534374302063518&fm=other-shopbysize-viewall&colorId=12397";

void setup() {
  size(500, 500);
  font = loadFont("font.vlw");
  fontDefault = loadFont("fontDefault.vlw");
  smooth();
  noStroke();
  kt1 = loadImage("kt1.png");
  wildfox1 = loadImage("wildfox1.png");
  wildfox2 = loadImage("wildfox2.png");
  wildfox4 = loadImage("wildfox4.png");
  banana1 = loadImage("banana1.png");
  lulu1 = loadImage("lulu1.png");
  mason1 = loadImage("mason1.png");
  green1 = loadImage("green1.png");
  bella1 = loadImage("bella1.png");
  dad1 = loadImage("dad1.png");
  dp1 = loadImage("dp1.png");
  kt3 = loadImage("kt3.png");
  kt2 = loadImage("kt2.png");
  tim1 = loadImage("tim1.png");
  mom1 = loadImage("mom1.png");
}

void draw() {
  background(bColor);

  if (startUpBoolean) {
    startUp();
  }

  if (shoppingPageBoolean) {
    shoppingPage();
  }

  if (step2Boolean) {
    step2();
  }

  if (goToLinkBoolean) {
    goToLink();
  }

  if (happyBirthdayBoo) {
    happyBirthday();
  }

  println(mouseX+" mouseX "+mouseY+" mouseY");
  //println(reset);
}

///////////////////////////////////////////////////
void startUp() {
  textFont(fontDefault, 12);
  background(bColor);
  image(kt1, width/2-75, height/2-150);
  fill(0);
  rect(9, 9, 350, 13);
  fill(255);
  text("THE INTERACTIVE KATIE WILLIAMS SHOPPING EXPERIENCE", 10, 20);
  if (mouseOver(width/2-70, width/2+70, height/2-80, height/2-60)) {
    fill(100);
  }
  else {
    fill(0);
  }
  rect(width/2-70, height/2-80, 140, 20);

  fill(255);
  text("CLICK HERE TO SHOP", width/2-65, height/2-65);
  if (mousePressed) {
    if (mouseOver(width/2-70, width/2+70, height/2-80, height/2-60)) {
      startUpBoolean = false;
      shoppingPageBoolean = true;
    }
  }
}
///////////////////////////////////////////////////
void shoppingPage() {
  noCursor();
  fill(0);
  rect(9, 9, 305, 13);
  fill(255);
  textFont(fontDefault, 12);
  text("STEP 1: PICK SOME SUPER CUTE OUTFITS FOR KATIE", 10, 20);
  if (mouseOver(9, 144, 452, 477)) {
    fill(0);
  }
  else {
    fill(0, 255, 0);
  }
  rect(9, 452, 135, 25);
  fill(255);
  textFont(fontDefault, 25);
  text("NEXT STEP", 10, 450, 150, 50);
  image(wildfox1, 10, 80);
  image(wildfox2, 70, 80);
  image(green1, 141, 80);
  image(wildfox4, 216, 80);
  image(banana1, 286, 80);
  image(lulu1, 356, 80);
  image(mason1, 426, 80);

  //--------------------clicking the outfits-----------//
  if (mousePressed) {
    if (mouseOver(27, 42, 75, 89)) {
      wildfox1Boo = true;
      dad1Boo = true;
    }
    if (mouseOver(102, 116, 76, 88)) {
      wildfox2Boo = true;
      mom1Boo = true;
    }
    if (mouseOver(172, 188, 75, 88)) {
      green1Boo = true;
      tim1Boo = true;
    }
    if (mouseOver(243, 254, 76, 91)) {
      wildfox4Boo = true;
      dp1Boo = true;
    }
    if (mouseOver(317, 334, 70, 87)) {
      banana1Boo = true;
      kt2Boo = true;
    }
    if (mouseOver(377, 397, 71, 90)) {
      lulu1Boo = true;
      bella1Boo = true;
    }
    if (mouseOver(445, 465, 69, 87)) {
      mason1Boo = true;
      kt3Boo = true;
    }
    if (mouseOver(9, 144, 452, 477)) {
      shoppingPageBoolean = false;
      step2Boolean = true;
    }
  }
  //---------------------faces over chosen-------------//  
  if (wildfox1Boo) {
    image(kt1, 13, 80, 38, 75);
  }
  if (wildfox2Boo) {
    image(kt1, 91, 80, 38, 75);
  }
  if (green1Boo) {
    image(kt1, 183-19, 80, 38, 75);
  }
  if (wildfox4Boo) {
    image(kt1, 248-19, 80, 38, 75);
  }
  if (banana1Boo) {
    image(kt1, 305, 80, 38, 75);
  }
  if (lulu1Boo) {
    image(kt1, 385-19, 80, 38, 75);
  }
  if (mason1Boo) {
    image(kt1, 454-19, 80, 38, 75);
  }
  if (dad1Boo) {
    dad();
  }
  if (tim1Boo) {
    tim();
  }
  if (dp1Boo) {
    dp();
  }
  if (mom1Boo) {
    mom();
  }
  if (kt2Boo) {
    ktTwo();
  }
  if (kt3Boo) {
    ktThree();
  }
  if (bella1Boo) {
    bella();
  }
  //-------------------------------------------
  image(kt1, mouseX-19, mouseY, 38, 75);
}
///////////////////////////////////////////////////
void step2() {
  noCursor();
  fill(0);
  rect(9, 9, 295, 13);
  fill(255);
  textFont(fontDefault, 12);
  text("STEP 2: PAY FOR THEM AND SHIP THEM TO KATIE", 10, 20);
  if (mouseOver(100, 400, 200, 300)) {
    fill(0);
  }
  else {
    fill(0, 255, 0);
  }
  rect(100, 200, 300, 100);
  fill(255);
  textFont(font, 50);
  text("CHECKOUT!!!", 101, 265);
  if (mouseOver(100, 400, 310, 323)) {
    fill(100);
  }
  else {
    fill(0);
  }
  rect(100, 310, 300, 13);
  fill(255);
  textFont(fontDefault, 12);
  text("NAH, I DON'T WANT TO", 101, 322);
  if (mousePressed) {
    if (mouseOver(100, 400, 200, 300) && step2Boolean) { 
      step2Boolean = false;
      finalPageBoolean = true;
      goToLinkBoolean = true;
      happyBirthdayBoo = true;
    }
    if (mouseOver(100, 400, 310, 323) && step2Boolean) {
      step2Boolean = false;
      finalPageBoolean = true;
      happyBirthdayBoo = true;
      wildfox1Boo = false;
      wildfox2Boo = false;
      green1Boo = false;
      wildfox4Boo = false;
      banana1Boo = false;
      lulu1Boo = false;
      mason1Boo = false;
    }
  }
  image(kt1, mouseX-19, mouseY, 38, 75);
}

///////////////////////////////////////////////////
void goToLink() {
  if (wildfox1Boo) {
    link(wildfox1Link, "_new");
    wildfox1Boo = false;
  }
  if (wildfox2Boo) {
    link(wildfox2Link, "_new");
    wildfox2Boo = false;
  }
  if (green1Boo) {
    link(green1Link, "_new");
    green1Boo = false;
  }
  if (wildfox4Boo) {
    link(wildfox4Link, "_new");
    wildfox4Boo = false;
  }
  if (banana1Boo) {
    link(banana1Link, "_new");
    banana1Boo = false;
  }
  if (lulu1Boo) {
    link(lulu1Link, "_new");
    lulu1Boo = false;
  }
  if (mason1Boo) {
    link(mason1Link, "_new");
    mason1Boo = false;
  }
}
///////////////////////////////////////////////////
void happyBirthday() {
  cursor();
  balloon();
  balloon();
  balloon();
  fill(0);
  rect(9, 9, 90, 13);
  fill(255);
  textFont(fontDefault, 12);
  text("STEP 3: PARTY", 10, 20);
  if (mouseOver(9, 69, 476, 491)) {
    fill(100);
  }
  else {
    fill(0);
  }
  rect(9, 476, 60, 15);
  fill(255);
  textFont(fontDefault, 12);
  text("RE-SHOP!", 11, 488);
  image(kt1, width/2-75, height/2-150);
  textMode(CENTER);
  textFont(font, 50);
  text("HAPPY BIRTHDAY", 50, 100, 450, 120);
  text("KATIE WILLIAMS", 50, 300, 450, 120);
  if (mousePressed) {
    if (mouseOver(9, 69, 476, 491)) {
      startUpBoolean = true;
      shoppingPageBoolean = false;
      step2Boolean = false; 
      finalPageBoolean = false; 
      goToLinkBoolean = false; 
      happyBirthdayBoo= false;
    }
  }
}
///////////////////////////////////////////////////
boolean mouseOver(float x1, float x2, float y1, float y2) {
  if (mouseX>x1 && mouseX<x2 && mouseY> y1 && mouseY<y2) {
    return true;
  }
  else {
    return false;
  }
}
///////////////////////////////////////////////////

void balloon() {
  fill (random(0, 255), random(0, 255), random(0, 255));
  ellipse (random(0, width), random(0, height), 50, 80);
}

void dad() {
  if (dad1Boo) {
    image(dad1, width/2-50, height/2);
    textFont(font, 50);
    text("THATS AWESOME", 50, height/2+150);
    dad1Boo = false;
  }
}
void mom() {
  if (mom1Boo) {
    image(mom1, width/2-50, height/2);
    textFont(font, 50);
    text("HOW LOVELY", 50, height/2+150);
    mom1Boo = false;
  }
}
void tim() {
  if (tim1Boo) {
    image(tim1, width/2-50, height/2);
    textFont(font, 50);
    text("I'M AWESOME", 50, height/2+150);
    tim1Boo = false;
  }
}
void dp() {
  if (dp1Boo) {
    image(dp1, width/2-50, height/2);
    textFont(font, 50);
    text("NOW DAS PAPER", 50, height/2+150);
    dp1Boo = false;
  }
}
void ktTwo() {
  if (kt2Boo) {
    image(kt2, width/2-50, height/2);
    textFont(font, 50);
    text("O.M.G. FAB!", 50, height/2+150);
    kt2Boo = false;
  }
}
void ktThree() {
  if (kt3Boo) {
    image(kt3, width/2-50, height/2);
    textFont(font, 50);
    text("THATS LIKE, YEAH!", 50, height/2+150);
    kt3Boo = false;
  }
}
void bella() {
  if (bella1Boo) {
    image(bella1, width/2-50, height/2);
    textFont(font, 50);
    text("ROOF ROOF GROWL", 10, height/2+150);
    bella1Boo = false;
  }
}


