
color green1 = color(0, 62, 0);
color green2 = color(23, 62, 0);
color green3 = color(36, 62, 0);
color green4 = color(12, 116, 12);
color green5 = color(49, 127, 0);
color green6 = color(76, 180, 6);
color green7 = color(6, 162, 6);
color green8 = color(0, 191, 0);
color green9 = color(41, 191, 0);
color green10 = color(0, 255, 0);
color green11 = color(109, 191, 0);
color green12 = color(101, 255, 0);
color green13 = color(148, 255, 3);
color green14 = color(82, 179, 82);
color green15 = color(127, 255, 127);
color green16 = color(157, 255, 129);
color green17 = color(139, 255, 62);
color green18 = color(173, 255, 62);
color green19 = color(200, 255, 127);
color green20 = color(178, 255, 127);
color green21 = color(4, 93, 4);
color blue1 = color(0, 62, 56);
color blue2 = color(62, 127, 121);
color blue3 = color(0, 191, 173);
color blue4 = color(0, 255, 231);
color blue5 = color(62, 255, 237);
color blue6 = color(127, 255, 243);
color blue7 = color(191, 255, 248);
color red1 = color(127, 0, 6);
color red2 = color(173, 9, 21);
color red3 = color(255, 0, 17);
color red4 = color(255, 62, 77);
color red5 = color(255, 127, 136);
color red6 = color(255, 191, 195);
color orange1 = color(255, 256, 6);
color orange2 = color(255, 141, 63);
color orange3 = color(255, 178, 62);
color orange4 = color(254, 178, 127);
color purple1 = color(62, 0, 56);
color purple2 = color(127, 62, 121);
color purple3 = color(191, 0, 173);
color purple4 = color(255, 0, 231);
color purple5 = color(255, 62, 238);
color purple6 = color(255, 127, 243);
color purple7 = color(255, 191, 249);
color yellow1 = color(255, 223, 0);
color yellow2 = color(255, 231, 63); 
color yellow3 = color(255, 239, 127); 
color yellow4 = color(255, 247, 191);
color used1 = color(5, 60, 50);
color used2 = color(5, 5, 50);
color used3 = color(10, 10, 60);
color used4 = color(0, 10, 70);
color used5 = color(5, 5, 40);
color used6 = color(12, 10, 50);
color used7 = color(10, 20, 70);
color used8 = color(5, 10, 80);
color used9 = color(15, 10, 90);
color used10 = color(1, 4, 45);
color used11 = color(12, 26, 80);
color used12 = color(15, 20, 70);
color used13 = color(10, 5, 70);
color used14 = color(5, 5, 60);
color used15 = color(10, 20, 120);
color used16 = color(20, 10, 100);
color used17 = color(50, 10, 60);
color used18 = color(70, 10, 60);
color used19 = color(25, 80, 60);
color used20 = color(25, 100, 70);
color used21 = color(100, 100, 10);
color used22 = color(120, 120, 5);
color used23 = color(130, 140, 0);
color used24 = color(110, 120, 5);


int i = 0;

void setup () {
  size(800, 800);
  noStroke();
  background(blue2);
} 


void draw() {
  i = i + 1; 

  //if (i>150) {
  //fill(purple1);
  //ellipse(0, 0, 1300, 1300);
  //}

  //if (i>100) {
  //fill(purple2);
  //ellipse(0, 0, 1100, 1100);
  //}

  //if (i>1) {
  //fill(purple3);
  //ellipse(0, 0, 900, 900);
  //}

  fill(blue1);
  ellipse(400, 800, 900, 500);

  fill(used2);
  ellipse(400, 400, 500, 1000);

  fill(blue1);
  triangle(200, 800, 300, 800, 250, 600);

  fill(blue1);
  triangle(450, 800, 600, 800, 550, 650);

  fill(used3);
  triangle(550, 400, 375, 750, 550, 600);

  fill(used4);
  triangle(310, 250, 200, 250, 200, 170);

  fill(used5);
  triangle(240, 440, 370, 620, 400, 570);

  fill(used5);
  triangle(370, 640, 550, 400, 360, 570);

  fill(used6);
  triangle(240, 440, 250, 600, 400, 660);

  fill(used7);
  triangle(323, 438, 373, 475, 403, 438);

  fill(green2);
  triangle(310, 250, 200, 170, 310, 230);

  fill(green3);
  triangle(400, 250, 440, 200, 500, 200); 


  if (i<100) {
    fill(green19);
  }
  if (i>100) {
    fill(green18);
  }
  if (i>150) {
    fill(green17);
  }
  triangle(150, 100, 250, 0, 100, 250);


  if (i<100) {
    fill(green18);
  }
  if (i>100) {
    fill(green17);
  }
  if (i>150) {
    fill(green16);
  }
  triangle(250, 0, 350, 0, 150, 150);


  if (i<100) {
    fill(green15);
  }
  if (i>100) {
    fill(green14);
  }
  if (i>150) {
    fill(green13);
  }
  triangle(360, -10, 150, 150, 100, 250);


  if (i<100) {
    fill(green12);
  }
  if (i>100) {
    fill(green11);
  }
  if (i>150) {
    fill(green10);
  }
  triangle(350, 0, 450, 0, 250, 100);


  if (i<100) {
    fill(green14);
  }
  if (i>100) {
    fill(green13);
  }
  if (i>150) {
    fill(green12);
  }
  triangle(150, 150, 100, 250, 100, 350);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  }
  triangle(160, 250, 200, 216, 200, 500);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green10);
  }
  if (i>150) {
    fill(green11);
  }
  triangle(150, 150, 160, 250, 250, 100);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  }
  triangle(550, 475, 550, 255, 602, 255);


  if (i<100) {
    fill(green10);
  }
  if (i>100) {
    fill(green9);
  }
  if (i>150) {
    fill(green8);
  }
  triangle(450, 0, 250, 100, 350, 100);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  }
  triangle(450, 0, 350, 100, 400, 150);


  if (i<100) {
    fill(green4);
  }
  if (i>100) {
    fill(green21);
  }
  if (i>150) {
    fill(green3);
  }
  triangle(450, 0, 400, 150, 450, 100);


  if (i<100) {
    fill(green14);
  }
  if (i>100) {
    fill(green13);
  }
  if (i>150) {
    fill(green12);
  }
  triangle(450, 0, 450, 100, 525, 175);


  if (i<100) {
    fill(green11);
  }
  if (i>100) {
    fill(green10);
  }
  if (i>150) {
    fill(green9);
  }
  triangle(450, 0, 525, 175, 650, 275);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green8);
  }
  if (i>150) {
    fill(green7);
  }
  triangle(450, 0, 575, 175, 650, 175);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  }
  triangle(575, 175, 650, 175, 650, 275);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  }
  triangle(450, 0, 550, 0, 650, 175);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  }
  triangle(550, 0, 650, 125, 650, 175);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  }
  triangle(250, 100, 200, 175, 350, 100);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  }
  triangle(350, 100, 200, 175, 160, 250);


  if (i<100) {
    fill(green15);
  }
  if (i>100) {
    fill(green14);
  }
  if (i>150) {
    fill(green13);
  }
  triangle(150, 150, 125, 250, 200, 500);


  if (i<100) {
    fill(green17);
  }
  if (i>100) {
    fill(green16);
  }
  if (i>150) {
    fill(green15);
  } 
  triangle(100, 250, 70, 350, 100, 500);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green8);
  }
  if (i>150) {
    fill(green7);
  } 
  triangle(125, 250, 100, 350, 200, 500);


  if (i<100) {
    fill(green19);
  }
  if (i>100) {
    fill(green18);
  }
  if (i>150) {
    fill(green17);
  } 
  triangle(100, 350, 100, 500, 125, 600);


  if (i<100) {
    fill(green11);
  }
  if (i>100) {
    fill(green10);
  }
  if (i>150) {
    fill(green9);
  } 
  triangle(100, 350, 125, 600, 200, 500);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  } 
  triangle(200, 300, 200, 500, 300, 650);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green8);
  }
  if (i>150) {
    fill(green7);
  } 
  triangle(90, 450, 50, 500, 125, 600);


  if (i<100) {
    fill(green8);
  }
  if (i>100) {
    fill(green7);
  }
  if (i>150) {
    fill(green6);
  } 
  triangle(50, 500, 125, 600, 50, 650);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green8);
  }
  if (i>150) {
    fill(green7);
  } 
  triangle(200, 500, 125, 600, 100, 800);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  } 
  triangle(125, 600, 65, 750, 100, 800);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  } 
  triangle(200, 500, 200, 600, 100, 800);


  if (i<100) {
    fill(green15);
  }
  if (i>100) {
    fill(green14);
  }
  if (i>150) {
    fill(green13);
  } 
  triangle(50, 650, 125, 600, 50, 800);


  if (i<100) {
    fill(green17);
  }
  if (i>100) {
    fill(green16);
  }
  if (i>150) {
    fill(green15);
  } 
  triangle(25, 550, 50, 500, 50, 650);


  if (i<100) {
    fill(green19);
  }
  if (i>100) {
    fill(green18);
  }
  if (i>150) {
    fill(green17);
  } 
  triangle(50, 650, 0, 750, 50, 725);


  if (i<100) {
    fill(green21);
  }
  if (i>100) {
    fill(green3);
  }
  if (i>150) {
    fill(green2);
  } 
  triangle(300, 650, 200, 500, 250, 800);


  if (i<100) {
    fill(green15);
  }
  if (i>100) {
    fill(green14);
  }
  if (i>150) {
    fill(green13);
  } 
  triangle(250, 650, 225, 800, 250, 900);


  if (i<100) {
    fill(green9);
  }
  if (i>100) {
    fill(green8);
  }
  if (i>150) {
    fill(green7);
  } 
  triangle(200, 500, 200, 600, 250, 650);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  }
  triangle(200, 600, 250, 650, 225, 800);


  if (i<100) {
    fill(green8);
  }
  if (i>100) {
    fill(green7);
  }
  if (i>150) {
    fill(green6);
  } 
  triangle(200, 600, 162, 675, 225, 800);


  if (i<100) {
    fill(green10);
  }
  if (i>100) {
    fill(green9);
  }
  if (i>150) {
    fill(green8);
  } 
  triangle(100, 800, 150, 750, 162, 675);


  if (i<100) {
    fill(green14);
  }
  if (i>100) {
    fill(green13);
  }
  if (i>150) {
    fill(green12);
  } 
  triangle(162, 675, 225, 800, 150, 750);


  if (i<100) {
    fill(green8);
  }
  if (i>100) {
    fill(green7);
  }
  if (i>150) {
    fill(green6);
  } 
  triangle(150, 750, 50, 850, 188, 775);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  } 
  triangle(188, 775, 200, 850, 225, 800);


  if (i<100) {
    fill(green3);
  }
  if (i>100) {
    fill(green2);
  }
  if (i>150) {
    fill(green1);
  } 
  triangle(300, 650, 250, 800, 325, 750);


  if (i<100) {
    fill(green21);
  }
  if (i>100) {
    fill(green3);
  }
  if (i>150) {
    fill(green2);
  } 
  triangle(242, 450, 300, 600, 300, 650);


  if (i<100) {
    fill(green3);
  }
  if (i>100) {
    fill(green2);
  }
  if (i>150) {
    fill(green1);
  } 
  triangle(650, 125, 650, 175, 700, 350);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  } 
  triangle(650, 175, 650, 275, 700, 350);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  } 
  triangle(650, 275, 700, 450, 700, 350);


  if (i<100) {
    fill(green11);
  }
  if (i>100) {
    fill(green10);
  }
  if (i>150) {
    fill(green9);
  } 
  triangle(650, 275, 700, 450, 550, 800);


  if (i<100) {
    fill(green14);
  }
  if (i>100) {
    fill(green13);
  }
  if (i>150) {
    fill(green12);
  } 
  triangle(650, 275, 550, 475, 550, 800);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  }
  triangle(700, 350, 700, 450, 750, 550);


  if (i<100) {
    fill(green21);
  }
  if (i>100) {
    fill(green3);
  }
  if (i>150) {
    fill(green2);
  } 
  triangle(700, 350, 750, 425, 750, 550);


  if (i<100) {
    fill(green10);
  }
  if (i>100) {
    fill(green9);
  }
  if (i>150) {
    fill(green8);
  } 
  triangle(750, 550, 700, 450, 650, 750);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  } 
  triangle(700, 450, 650, 750, 636, 600);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  } 
  triangle(636, 600, 660, 850, 593, 700);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  } 
  triangle(750, 550, 650, 750, 775, 600);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  } 
  triangle(650, 750, 675, 720, 700, 810);


  if (i<100) {
    fill(green7);
  }
  if (i>100) {
    fill(green6);
  }
  if (i>150) {
    fill(green5);
  } 
  triangle(593, 700, 508, 900, 624, 770);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  } 
  triangle(675, 720, 740, 745, 700, 690);


  if (i<100) {
    fill(green21);
  }
  if (i>100) {
    fill(green3);
  }
  if (i>150) {
    fill(green2);
  } 
  triangle(700, 690, 740, 700, 725, 660);


  if (i<100) {
    fill(green6);
  }
  if (i>100) {
    fill(green5);
  }
  if (i>150) {
    fill(green4);
  } 
  triangle(650, 275, 550, 475, 600, 260);


  if (i<100) {
    fill(green4);
  }
  if (i>100) {
    fill(green21);
  }
  if (i>150) {
    fill(green3);
  } 
  triangle(550, 400, 550, 625, 500, 500);


  if (i<100) {
    fill(green5);
  }
  if (i>100) {
    fill(green4);
  }
  if (i>150) {
    fill(green21);
  } 
  triangle(550, 625, 525, 560, 500, 800);


  if (i<100) {
    fill(green10);
  }
  if (i>100) {
    fill(green9);
  }
  if (i>150) {
    fill(green8);
  } 
  triangle(550, 625, 550, 800, 470, 900);


  if (i<100) {
    fill(green3);
  }
  if (i>100) {
    fill(green2);
  }
  if (i>150) {
    fill(green1);
  } 
  triangle(525, 560, 500, 800, 470, 675);


  fill(used8);
  triangle(200, 300, 225, 425, 310, 500);

  fill(used9);
  triangle(550, 290, 550, 400, 430, 510);

  fill(used10);
  triangle(310, 500, 430, 510, 380, 555);

  fill(used11);
  triangle(325, 360, 360, 390, 400, 360);

  fill(used12);
  triangle(325, 360, 330, 300, 350, 360);

  fill(used13);
  quad(550, 300, 600, 350, 565, 400, 550, 390);

  fill(used14);
  triangle(550, 300, 600, 260, 600, 350);

  fill(used15);
  triangle(550, 365, 550, 300, 570, 350);

  fill(used16);
  triangle(550, 300, 600, 260, 575, 255);

  fill(purple2);
  triangle(360, 455, 300, 422, 430, 422);

  fill(purple1);
  triangle(300, 422, 385, 425, 350, 405);

  fill(purple1);
  triangle(430, 422, 370, 405, 335, 425);

  fill(purple1);
  triangle(375, 422, 340, 422, 360, 430); 

  strokeWeight(10);
  stroke(0);
  fill(blue1);
  rect(195, 250, 120, 55);
  rect(395, 250, 140, 55);

  noStroke();
  fill(0);
  rect(310, 260, 90, 10);

  fill(blue2);
  rect(200, 255, 30, 45);
  rect(400, 255, 55, 45);


  if (i<100) {
    fill(green13);
  }
  if (i>100) {
    fill(green12);
  }
  if (i>150) {
    fill(green11);
  }  
  triangle(450, 100, 500, 250, 610, 260);


  if (i<100) {
    fill(green9);
  }

  if (i>100) {
    fill(green8);
  }

  if (i>150) {
    fill(green7);
  }  

  triangle(525, 175, 600, 260, 650, 275);


  fill(used21);
  quad(565, 390, 530, 500, 564, 540, 595, 500);

  fill(used22);
  triangle(565, 390, 530, 500, 564, 540);

  fill(used23);
  triangle(564, 500, 545, 450, 565, 390); 

  fill(used24);
  triangle(564, 500, 581, 450, 565, 390);

  //fill(10);
  //quad(550, 500, 564, 512, 576, 500, 564, 480);

  if (i>250) i=0;
}


