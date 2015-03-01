
//import processing.pdf.*;

size(500, 500);
//beginRecord(PDF, "syndefaldet.pdf");

noStroke();
colorMode(RGB, 400);
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}

//træ
noStroke();
fill(#61210B);
rect(350, 130, 30, 360);
fill(#01DF74);
ellipse(310, 100, 390, 150);
ellipse(310, 50, 370, 150);
ellipse(150, 110, 150, 130);
ellipse(240, 140, 170, 130);

//æble
fill(#FE2E2E);
stroke(#B40404);
ellipse(150, 100, 30, 30);
stroke(#3B240B);
fill(#3B240B);
line(145, 90, 140, 70);
fill(#0B610B);
ellipse(140, 85, 10, 7);
fill(#F5A9BC);
noStroke();
ellipse(145, 95, 7, 6);


//eva
noStroke();

//hår
fill(#765611);
ellipse(175, 405, 60, 200);
//hoved
fill(#FAE6B3);
ellipse(178, 330, 30, 35);
//pandehår
fill(#765611);
triangle(165, 345, 180, 305, 160, 320);
//krop
fill(#FAE6B3);
ellipse(180, 380, 50, 70);
//bryster
fill(#D6BF8F);
ellipse(170, 370, 15, 25);
ellipse(186, 370, 15, 25);
fill(#FAE6B3);
ellipse(186, 365, 15, 20);
ellipse(170, 365, 15, 20);
fill(#A2823D);
ellipse(172, 370, 2, 2);
ellipse(187, 370, 2, 2);
//navle
ellipse(180, 400, 2, 2);


//næse
fill(#FAE6B3);
ellipse(190, 320, 05, 05);
//øjne
fill(#2F17D1);
ellipse(175, 325, 03, 03);
ellipse(180, 323, 03, 03);
//mund
fill(#F791B0);
stroke(#FF46F3);
ellipse(183, 335, 05, 04);
noStroke();
//ben
fill(#FAE6B3);
rect(174, 400, 6, 60);
rect(190, 400, 6, 60);
//arme
rect(195, 320, 7, 60);
rect(158, 380, 5, 35);
//fisse
fill(#A2823D);
triangle(174, 407, 194, 407, 184, 422);
fill(#765611);
rect(180, 416, 9, 6);

//græs
stroke(#279334);
fill(#56FA72);
rect(0, 460, 500, 500);

//endRecord();

