
PFont font;
int step;
int imageNum;
PImage img1;
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
PImage img12;
PImage img13;

void setup() {
  background(0);
  size(540, 500);
  font = loadFont("Futura-CondensedExtraBold-48.vlw");
  fill(255);
  textFont(font, 30);
  textAlign(CENTER);
  img1 = loadImage("desk.jpg");
  img2 = loadImage("setuppic.jpg");
  img3 = loadImage("bdbeer.jpg");
  img4 = loadImage("bdbath.jpg");
  img5 = loadImage("phwaterm.jpg");
  img6 = loadImage("uglygirls.jpg");
  img7 = loadImage("phpink.jpg");
  img8 = loadImage("partyhard.jpg");
  img9 = loadImage("phenglish.jpg");
  img10 = loadImage("bdkeg.jpg");
  img11 = loadImage("wooks.jpg");
  img12 = loadImage("bdcart.jpg");
  img13 = loadImage("phdead.png");
}




void draw() {
  if (step == 0) {
    switch(imageNum) {
    case 0:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 1:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 2:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 3:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 4:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 5:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 6:
      image(img1, 0, 0, 540, 500);
      fill(255);
      textFont(font, 28);
      text("WEB HOMEWORK KICKING YOUR ASS?", width/2, height/5);
      break;
    case 7:
      background(0);
      fill(255);
      textFont(font, 50);
      text("FUCK IT LETS PARTY!", width/2, height/2);
      break;
    case 8:
      background(255);
      fill(0);
      textFont(font, 50);
      text("FUCK IT LETS PARTY!", width/2, height/2);
      break;
    case 9:
      background(0);
      fill(255);
      textFont(font, 50);
      text("FUCK IT LETS PARTY!", width/2, height/2);
      break;
    case 10:
      background(255);
      fill(0);
      textFont(font, 50);
      text("FUCK IT LETS PARTY!", width/2, height/2);
      break;
     case 11:
       image(img2, 0, 0, 540, 500);
       break;
     case 12:
       image(img2, 0, 0, 540, 500);
       break;
     case 13:
       image(img2, 0, 0, 540, 500);
       break;
     case 14:
       image(img2, 0, 0, 540, 500);
       break;
     case 15:
       image(img3, 0, 0, 540, 500);
       break;
     case 16:
       image(img4, 0, 0, 540, 500);
       break;
     case 17:
       image(img5, 0, 0, 540, 500);
       break;
     case 18:
       image(img6, 0, 0, 540, 500);
       break;
     case 19:
       image(img7, 0, 0, 540, 500);
       break;
     case 20:
       image(img8, 0, 0, 540, 500);
       break;
     case 21:
       image(img9, 0, 0, 540, 500);
       break;
     case 22:
       image(img10, 0, 0, 540, 500);
       break;
     case 23:
       image(img11, 0, 0, 540, 500);
       break;
     case 24:
       image(img12, 0, 0, 540, 500);
       break;
     case 25:
       image(img13, 0, 0, 540, 500);
       break;
     case 26:
       image(img13, 0, 0, 540, 500);
       break;
     case 27:
       image(img13, 0, 0, 540, 500);
       break;
    }
    imageNum = (imageNum + 1)%28;
  }
  step = (step + 1)%15;
}



