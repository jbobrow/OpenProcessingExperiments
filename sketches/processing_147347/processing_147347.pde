
int i = 1;
//PImage[] tree = new PImage[54]; //use .png

void setup () {
  size(800, 800);
  //for(int a = 1; a < tree.length; a++) {
    //String imageName = "screen-" + nf(a, 4) + ".tif";
    //tree[a - 1] = loadImage(imageName);
  //}
}

void draw () {
  //image(tree[i], 0, 0);
  background(i * 4);
 rect(width/2 - 300, height - 45, 600, 15);
  if(mouseX < 700 && mouseX > 100 && mouseY > 745 && mouseY < 780) {
    rect(mouseX - 5, 745, 10, 35);
    if(mouseX > 100 && mouseX < 110) {
      i = 1;
    } else if(mouseX > 110 && mouseX < 120) {
      i = 2;
    } else if(mouseX > 120 && mouseX < 130) {
      i = 3;
    } else if(mouseX > 130 && mouseX < 140) {
      i = 4;
    } else if(mouseX > 140 && mouseX < 150) {
      i = 5;
    } else if(mouseX > 150 && mouseX < 160) {
      i = 6;
    } else if(mouseX > 160 && mouseX < 170) {
      i = 7;
    } else if(mouseX > 170 && mouseX < 180) {
      i = 8;
    } else if(mouseX > 180 && mouseX < 190) {
      i = 9;
    } else if(mouseX > 190 && mouseX < 200) {
      i = 10;
    } else if(mouseX > 200 && mouseX < 210) {
      i = 11;
    } else if(mouseX > 210 && mouseX < 220) {
      i = 12;
    } else if(mouseX > 220 && mouseX < 230) {
      i = 13;
    } else if(mouseX > 230 && mouseX < 240) {
      i = 14;
    } else if(mouseX > 240 && mouseX < 250) {
      i = 15;
    } else if(mouseX > 250 && mouseX < 260) {
      i = 16;
    } else if(mouseX > 260 && mouseX < 270) {
      i = 17;
    } else if(mouseX > 270 && mouseX < 280) {
      i = 18;
    } else if(mouseX > 280 && mouseX < 290) {
      i = 19;
    } else if(mouseX > 290 && mouseX < 300) {
      i = 20;
    } else if(mouseX > 300 && mouseX < 310) {
      i = 21;
    } else if(mouseX > 310 && mouseX < 320) {
      i = 22;
    } else if(mouseX > 320 && mouseX < 330) {
      i = 23;
    } else if(mouseX > 330 && mouseX < 340) {
      i = 24;
    } else if(mouseX > 340 && mouseX < 350) {
      i = 25;
    } else if(mouseX > 350 && mouseX < 360) {
      i = 26;
    } else if(mouseX > 360 && mouseX < 370) {
      i = 27;
    } else if(mouseX > 370 && mouseX < 380) {
      i = 28;
    } else if(mouseX > 380 && mouseX < 390) {
      i = 29;
    } else if(mouseX > 390 && mouseX < 400) {
      i = 30;
    } else if(mouseX > 400 && mouseX < 410) {
      i = 31;
    } else if(mouseX > 410 && mouseX < 420) {
      i = 32;
    } else if(mouseX > 420 && mouseX < 430) {
      i = 33;
    } else if(mouseX > 430 && mouseX < 440) {
      i = 34;
    } else if(mouseX > 440 && mouseX < 450) {
      i = 35;
    } else if(mouseX > 450 && mouseX < 460) {
      i = 36;
    } else if(mouseX > 460 && mouseX < 470) {
      i = 37;
    } else if(mouseX > 470 && mouseX < 480) {
      i = 38;
    } else if(mouseX > 480 && mouseX < 490) {
      i = 39;
    } else if(mouseX > 490 && mouseX < 500) {
      i = 40;
    } else if(mouseX > 500 && mouseX < 510) {
      i = 41;
    } else if(mouseX > 510 && mouseX < 520) {
      i = 42;
    } else if(mouseX > 520 && mouseX < 530) {
      i = 43;
    } else if(mouseX > 530 && mouseX < 540) {
      i = 44;
    } else if(mouseX > 540 && mouseX < 550) {
      i = 45;
    } else if(mouseX > 550 && mouseX < 560) {
      i = 46;
    } else if(mouseX > 560 && mouseX < 570) {
      i = 47;
    } else if(mouseX > 570 && mouseX < 580) {
      i = 48;
    } else if(mouseX > 580 && mouseX < 590) {
      i = 49;
    } else if(mouseX > 590 && mouseX < 600) {
      i = 50;
    } else if(mouseX > 600 && mouseX < 610) {
      i = 51;
    } else if(mouseX > 610 && mouseX < 620) {
      i = 52;
    } else if(mouseX > 620 && mouseX < 630) {
      i = 53;
    } else if(mouseX > 630 && mouseX < 640) {
      i = 54;
    } else if(mouseX > 640 && mouseX < 650) {
      i = 55;
    } else if(mouseX > 650 && mouseX < 660) {
      i = 56;
    } else if(mouseX > 660 && mouseX < 670) {
      i = 57;
    } else if(mouseX > 670 && mouseX < 680) {
      i = 58;
    } else if(mouseX > 680 && mouseX < 690) {
      i = 59;
    } else if(mouseX > 690 && mouseX < 700) {
      i = 60;
    }
  }
  
}
