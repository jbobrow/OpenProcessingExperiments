
int i = 0; //ランダムの範囲を狭くする
int line_al = 0; //ラインの透明度

size(800, 800);
background(0, 5, 15); 
smooth();

/*-----背景のカラフルな四角-----*/
for (int y = 0; y <= width; y += 40) {
  i += 2;
  for (int x = 0; x <= width; x += 40) {
    noStroke();
    fill(random(80, 200), random(80, 200), random(80, 200), 50-y/20);
    quad(x+random(30, 80)-i, y-random(30, 80)+i, x-random(30, 80)+i, y-random(30, 80)+i, x-random(30, 80)+i, y+random(30, 80)-i, x+random(30, 80)-i, y+random(30, 80)-i);
  }
}

/*-----斜光のようなライン-----*/
for (int sl = 0; sl <= 190; sl += 1) {
  if (sl <= 95) {
    line_al ++;
  } else {
    line_al --;
  }
  stroke(255, line_al);
  line(350-sl, -40+sl, 350-sl, -40+sl+30);
  line(750-sl, 130+sl, 750-sl, 130+sl+30);
  line(700-sl, 320+sl, 700-sl, 320+sl+20);
  line(200-sl, 370+sl, 200-sl, 370+sl+40);
  line(890-sl, 350+sl, 890-sl, 350+sl+20);
  line(500-sl, 680+sl, 500-sl, 680+sl+30);
}

/*-----左右のグラデーション-----*/
for (int side = 0; side <= 150; side += 1) {
  stroke(0, 0, 0, 150-side);
  line(side, 0, side, height); //左
  line(width-side, 0, width-side, height); //右
}

/*-----四角と三角のオブジェクト-----*/
noStroke();
fill(229, 179, 179, 56); //不透明度22%
quad(789, -44, 546, 20, 565, 139, 705, 147);
quad(481, 31, 410, 147, 551, 125, 628, 58);

quad(509, 85, 356, 282, 333, 371, 453, 211);
triangle(431, 118, 412, 176, 445, 147);
quad(766, 157, 719, 169, 750, 197, 766, 171);
triangle(712, 177, 733, 199, 747, 176);

fill(229, 179, 179, 68); //不透明度27%
triangle(600, 103, 403, 477, 725, 120);
quad(577, 126, 400, 209, 492, 276, 596, 215);
quad(740, 247, 577, 295, 645, 361, 740, 281);
quad(347, 144, 263, 236, 263, 294, 354, 208);
quad(325, 133, 310, 185, 319, 197, 365, 140);
quad(448, 193, 286, 309, 239, 456, 397, 345);
quad(460, 220, 429, 297, 448, 408, 535, 370);
triangle(564, 321, 575, 401, 609, 343);
triangle(658, 280, 338, 554, 583, 493);

fill(229, 179, 179, 81); //不透明度32%
triangle(228, 274, 261, 285, 347, 247);
triangle(194, 376, 145, 523, 222, 578);
quad(121, 518, 152, 546, 168, 520, 168, 507);
quad(492, 320, 316, 361, 233, 475, 469, 391);
quad(519, 427, 316, 484, 475, 527, 541, 455);
quad(504, 499, 469, 563, 604, 529, 595, 508);
quad(494, 546, 445, 570, 480, 595, 519, 572);
quad(637, 590, 578, 601, 509, 663, 599, 634);
triangle(369, 656, 318, 690, 357, 690);

fill(229, 179, 179, 97); //不透明度38%
quad(133, 290, 130, 345, 197, 338, 182, 310);
quad(421, 569, 393, 656, 433, 656, 496, 563);
quad(403, 340, 122, 719, 226, 675, 378, 530);
quad(155, 610, 85, 657, 90, 720, 174, 736);
quad(345, 677, 327, 703, 344, 703, 361, 690);


