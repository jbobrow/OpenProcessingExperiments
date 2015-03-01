
void setup() {
  size(1500, 1000);
  colorMode(HSB, 360, 100, 100);
  smooth();
}

void draw() {
    smooth();
  background(172, 15, 83); 
  //grass
  fill(116, 51, 40);
  rect(0, 430, 1500, 1000);
  fill(116, 51, 35);
  ellipse(900, 430, 40, 15);
  ellipse(940, 425, 80, 25);
  ellipse(990, 430, 40, 15);
  fill(116, 50, 46);
  rect(0, 445, 1500, 1000);
  fill(172, 27, 90);
  ellipse(1200, 445, 100, 10);


  //fence
  for (int y=950; y<1100; y+=2) {
    fill(47, 95, 32);
    rect(y, 435, 1, 7);
  }
  //cornfield
  for (int x=0; x<1300; x+=4) {
    fill(54, 63, 80);
    rect(x, 460, 1, 10);
    rect(x, 470, 2, 20);
    fill(54, 63, 77);
    rect(x, 485, 3, 30);
  }

  //coop wall
  fill(40, 66, 33);
  rect(0, 0, 200, 1000);
  rect(200, 0, 1500, 100);
  rect(1300, 0, 1500, 1000);
  rect(0, 500, 1500, 1000);
  rect(600, 0, 100, 1000);

  //coop lines
  fill(40, 66, 25);
  for (int i=-5; i < 100; i+=60) {
    rect(0, i, 1500, 5);
  }
  for (int i = 115; i<850; i+=60) {
    rect(0, i, 200, 5);
  }

  for (int i = 115; i<700; i+=60) {
    rect(600, i, 100, 5);
  }
  for (int i = 115; i<850; i+=60) {
    rect(1300, i, 200, 5);
  }

  for (int i = 535; i<850; i+=60) {
    rect(0, i, 1500, 5);
  }


  //falling eggs
  float g = (map(second(), 0, 59, 430, 823));
  fill(37, 71, 86);
  ellipse(295, g, 35, 45);


  float e = (map(minute(), 0, 59, 430, 818));
  fill(37, 41, 86);
  ellipse(695, e, 25, 35);

  float p = (map(hour(), 0, 23, 430, 813));
  fill(37, 41, 35);
  ellipse(1125, p, 20, 25);

  //platform
  noStroke();
  fill(40, 57, 23);
  rect(0, 370, 1500, 50); 
  rect(0, 900, 1500, 100);
  //egg shoot  
  rect(265, 355, 60, 100);
  rect(665, 355, 60, 100);
  rect(1095, 355, 60, 100);

  //crate
  fill(50, 39, 80);
  rect(200, 800, 200, 100);
  rect(600, 800, 200, 100);
  rect(1030, 800, 200, 100);
  //crate lines
  fill(50, 39, 60);
  rect(200, 830, 200, 5);
  rect(200, 865, 200, 5);
  rect(600, 830, 200, 5);
  rect(600, 865, 200, 5);
  rect(1030, 830, 200, 5);
  rect(1030, 865, 200, 5);

  //egg sign
  fill(50, 88, 32);
  textSize(30);
  text("GOLD EGGS", 215, 860);

  textSize(30);
  text("EGGS", 660, 860);

  textSize(30);
  text("EGGS?", 1085, 860);









  //hen 1

  fill(29, 89, 43);
  ellipse(320, 300, 180, 140);
  ellipse(320, 270, 140, 170);
  ellipse(340, 205, 100, 40);
  fill(29, 85, 44);
  ellipse(340, 310, 80, 90);
  fill(29, 83, 45);
  ellipse(340, 300, 40, 70);
  fill(24, 91, 45);
  ellipse(270, 270, 50, 80);
  fill(24, 85, 44);
  ellipse(305, 270, 40, 50); 
  fill(24, 80, 43);
  ellipse(330, 250, 40, 50); 
  fill(24, 94, 48);
  ellipse(345, 210, 40, 30);
  fill(29, 86, 44);
  ellipse(345, 210, 40, 30);
  fill(19, 86, 44);
  ellipse(350, 205, 25, 16);
  fill(19, 86, 50);
  ellipse(350, 205, 15, 10);
  fill(19, 86, 28);
  ellipse(350, 205, 10, 10);
  fill(19, 32, 82);
  ellipse(349, 203, 3, 3);


  fill(13, 87, 67);
  ellipse(350, 175, 10, 25);
  rect(335, 166, 15, 21, 20);
  rect(356, 170, 7, 17, 20);
  ellipse(370, 182, 5, 15);
  ellipse(355, 188, 30, 7);
  ellipse(355, 184, 30, 7);

  fill(13, 82, 55);
  ellipse(360, 235, 20, 18);
  fill(13, 82, 58);
  ellipse(350, 235, 15, 15);
  fill(13, 82, 60);
  ellipse(343, 235, 12, 15);


  fill(34, 72, 70);
  triangle(387, 210, 400, 220, 376, 220);
  fill(22, 79, 59);
  triangle(388, 200, 400, 220, 387, 210);

  //end
  //hen2
  fill(29, 89, 43);
  ellipse(720, 300, 180, 140);
  ellipse(720, 270, 140, 170);
  ellipse(740, 205, 100, 40);
  fill(29, 85, 44);
  ellipse(740, 310, 80, 90);
  fill(29, 83, 45);
  ellipse(740, 300, 40, 70);
  fill(24, 91, 45);
  ellipse(670, 270, 50, 80);
  fill(24, 85, 44);
  ellipse(705, 270, 40, 50); 
  fill(24, 80, 43);
  ellipse(730, 250, 40, 50); 
  fill(24, 94, 48);
  ellipse(745, 210, 40, 30);
  fill(29, 86, 44);
  ellipse(745, 210, 40, 30);
  fill(19, 86, 44);
  ellipse(750, 205, 25, 16);
  fill(19, 86, 50);
  ellipse(750, 205, 15, 10);
  fill(19, 86, 28);
  ellipse(750, 205, 10, 10);
  fill(19, 32, 82);
  ellipse(749, 203, 3, 3);


  fill(13, 87, 67);
  ellipse(750, 175, 10, 25);
  rect(735, 166, 15, 21, 20);
  rect(756, 170, 7, 17, 20);
  ellipse(770, 182, 5, 15);
  ellipse(755, 188, 30, 7);
  ellipse(755, 184, 30, 7);

  fill(13, 82, 55);
  ellipse(760, 235, 20, 18);
  fill(13, 82, 58);
  ellipse(750, 235, 15, 15);
  fill(13, 82, 60);
  ellipse(743, 235, 12, 15);


  fill(34, 72, 70);
  triangle(787, 210, 800, 220, 776, 220);
  fill(22, 79, 59);
  triangle(788, 200, 800, 220, 787, 210);

  //end
  //hen 3

  fill(29, 89, 43);
  ellipse(1120, 300, 180, 140);
  ellipse(1120, 270, 140, 170);
  ellipse(1140, 205, 100, 40);
  fill(29, 85, 44);
  ellipse(1140, 310, 80, 90);
  fill(29, 83, 45);
  ellipse(1140, 300, 40, 70);
  fill(24, 91, 45);
  ellipse(1070, 270, 50, 80);
  fill(24, 85, 44);
  ellipse(1105, 270, 40, 50); 
  fill(24, 80, 43);
  ellipse(1130, 250, 40, 50); 
  fill(24, 94, 48);
  ellipse(1145, 210, 40, 30);
  fill(29, 86, 44);
  ellipse(1145, 210, 40, 30);
  fill(19, 86, 44);
  ellipse(1150, 205, 25, 16);
  fill(19, 86, 50);
  ellipse(1150, 205, 15, 10);
  fill(19, 86, 28);
  ellipse(1150, 205, 10, 10);
  fill(19, 32, 82);
  ellipse(1149, 203, 3, 3);


  fill(13, 87, 67);
  ellipse(1150, 175, 10, 25);
  rect(1135, 166, 15, 21, 20);
  rect(1156, 170, 7, 17, 20);
  ellipse(1170, 182, 5, 15);
  ellipse(1155, 188, 30, 7);
  ellipse(1155, 184, 30, 7);

  fill(13, 82, 55);
  ellipse(1160, 235, 20, 18);
  fill(13, 82, 58);
  ellipse(1150, 235, 15, 15);
  fill(13, 82, 60);
  ellipse(1143, 235, 12, 15);


  fill(34, 72, 70);
  triangle(1187, 210, 1200, 220, 1176, 220);
  fill(22, 79, 59);
  triangle(1188, 200, 1200, 220, 1187, 210);

  //eggs
  fill(37, 71, 86);
  ellipse(265, 363, 35, 25);
  ellipse(300, 365, 40, 30);
  fill(37, 76, 88);
  ellipse(334, 364, 35, 30);
  fill(37, 76, 88);
  ellipse(368, 364, 35, 25);

  //eggs 2
  fill(37, 41, 86);
  ellipse(665, 363, 35, 25);
  ellipse(700, 365, 40, 30);
  fill(37, 46, 88);
  ellipse(734, 364, 35, 30);
  fill(37, 46, 88);
  ellipse(768, 364, 35, 25);

  //eggs 3
  fill(37, 41, 35);
  ellipse(1065, 363, 35, 25);
  ellipse(1100, 365, 40, 30);
  fill(37, 46, 38);
  ellipse(1134, 364, 35, 30);
  fill(37, 46, 38);
  ellipse(1168, 364, 35, 25);
}



