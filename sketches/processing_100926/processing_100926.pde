
PImage imgHome, imgPen, imgStart, imgRedCircle, imgSetting, imgSettingPage, imgConfirm,
imgHomeIcon, imgTutorial, imgHand, imgBrush, imgTutorial2, imgTutorial3, imgTutorial4,
imgTutorial5, imgPlay, imgPlay2, imgPlay3, imgPlay4, imgPlay5, imgPlay6, imgPlay7,
imgPlay7_2, imgPlay8, imgScore, imgList;
int page=1, handX=100, brushX=93;

void setup() {
  size(800, 600);
  imgHome = loadImage("imgHome.jpg"); //第一頁
  imgPen = loadImage("imgPen.png");
  imgStart = loadImage("imgStart.png"); //開始白底
  imgRedCircle = loadImage("imgRedCircle.png");
  imgSetting = loadImage("imgSetting.png");
  imgSettingPage = loadImage("imgSettingPage.jpg");
  imgConfirm = loadImage("imgConfirm.png");
  imgHomeIcon = loadImage("imgHomeIcon.png");
  imgTutorial = loadImage("imgTutorial.jpg");
  imgHand = loadImage("imgHand.png");
  imgBrush = loadImage("imgBrush.png");
  imgTutorial2 = loadImage("imgTutorial2.jpg");
  imgTutorial3 = loadImage("imgTutorial3.jpg");
  imgTutorial4 = loadImage("imgTutorial4.jpg");
  imgTutorial5 = loadImage("imgTutorial5.jpg");
  imgPlay = loadImage("imgPlay.jpg");
  imgPlay2 = loadImage("imgPlay2.jpg");
  imgPlay3 = loadImage("imgPlay3.jpg");
  imgPlay4 = loadImage("imgPlay4.jpg");
  imgPlay5 = loadImage("imgPlay5.jpg");
  imgPlay6 = loadImage("imgPlay6.jpg");
  imgPlay7 = loadImage("imgPlay7.jpg");
  imgPlay7_2 = loadImage("imgPlay7_2.png");
  imgPlay8 = loadImage("imgPlay8.jpg");
  imgScore = loadImage("imgScore.jpg");
  imgList = loadImage("imgList.jpg"); 
}

void draw() {
  if (page == 1) home();
  if (page == 2) setting();
  if (page == 3) tutorial();
  if (page == 4) play();
  if (page == 5) score();
  if (page == 6) scoreList();
  println(mouseY);
}

void home() {
  image(imgHome, 0, 0); //第一頁
  image(imgPen, mouseX-5, mouseY-120);
  if (mouseX>335 & mouseX<468 & mouseY>430 & mouseY<475) {
    image(imgRedCircle, 350, 410);
    image(imgStart, 326, 430);
    if (mousePressed) page = 3;
  } 
  if (mouseX>123 & mouseX<179 & mouseY>448 & mouseY<470) {
    image(imgRedCircle, 100, 410);
    image(imgSetting, 122, 453);
    if (mousePressed) page = 2; 
  }
}

void setting() {
  image(imgSettingPage, 0, 0);
  if (mouseX>357 & mouseX<547 & mouseY>530 & mouseY<573) {
    image (imgConfirm, 330, 517);
    if (mousePressed) page = 1;
  }
  if (mouseX>24 & mouseX<103 & mouseY>18 & mouseY<92) { //回首頁
    image (imgHomeIcon, 24, 17);
    if (mousePressed) page = 1;
  }
}

void tutorial() {
  image(imgTutorial, 0, 0);
  image(imgHand, handX, 440);
  image(imgBrush, brushX-1, 220);
  image(imgBrush, 93, 220);
  fill(0, 255);
  rect(130, 220, brushX-100, 90);
  
  if (mouseY>480) {
    if (handX>205) {
      image(imgTutorial2, 0, 0);
      image(imgHand, handX, 440);
      image(imgBrush, brushX-1, 220);
      image(imgBrush, 93, 220);
      rect(130, 220, brushX-100, 90);
    }
    if (handX>325) {
      image(imgTutorial3, 0, 0);
      image(imgHand, handX, 440);
      image(imgBrush, brushX-1, 220);
      image(imgBrush, 93, 220);
      rect(130, 220, brushX-100, 90);
    }
    if (handX>435) {
      image(imgTutorial4, 0, 0);
      image(imgHand, handX, 440);
      image(imgBrush, brushX-1, 220);
      image(imgBrush, 93, 220);
      rect(130, 220, brushX-100, 90);
    }
    if (handX>570) {
      image(imgTutorial5, 0, 0);
      image(imgHand, handX, 440);
      image(imgBrush, brushX-1, 220);
      image(imgBrush, 93, 220);
      rect(130, 220, brushX-100, 90);
    }
    handX = constrain (mouseX-40, 100, 700);
    brushX = constrain (mouseX-50, 95, 580);
    if (handX>695) page = 4;
  } 
  if (mouseX>24 & mouseX<103 & mouseY>18 & mouseY<92) { //回首頁
    image (imgHomeIcon, 24, 17);
    if (mousePressed) page = 1;
  }
}

void play() {
  if (mouseY>80) image(imgPlay, 0, 0);
  if (mouseX<660) image(imgPlay2, 0, 0);
  if (mouseX<555) image(imgPlay3, 0, 0);
  if (mouseX<460) image(imgPlay4, 0, 0);
  if (mouseX<365) image(imgPlay5, 0, 0);
  if (mouseX<280) image(imgPlay6, 0, 0);
  if (mouseX<200) {
    image(imgPlay7, 0, 0);
    if (mouseX>53 & mouseX<178 & mouseY>487 & mouseY<547) image(imgPlay7_2, 53, 490);
    if (mousePressed) page = 5;
  }
  if (mouseY<80) image(imgPlay8, 0, 0);
  if (mouseX>24 & mouseX<103 & mouseY>18 & mouseY<92) { //回首頁
    image (imgHomeIcon, 24, 17);
    if (mousePressed) page = 1;
  }
}

void score() {
  image(imgScore, 0, 0);
  if (mouseX>24 & mouseX<103 & mouseY>18 & mouseY<92) { //回首頁
    image (imgHomeIcon, 24, 17);
  if (mousePressed) page = 1;
  }
  if (mousePressed) page = 6;
}
  
void scoreList() {
  image(imgList, 0, 0);
  if (mouseX>24 & mouseX<103 & mouseY>18 & mouseY<92) { //回首頁
    image (imgHomeIcon, 24, 17);
    if (mousePressed) page = 1;
  }
}

