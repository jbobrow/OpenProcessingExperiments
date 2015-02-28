
//底圖
void setup() {
  size(400,400);
  //直線
  background(243,227,198);
  smooth();
  strokeWeight(2);
  line(142,70,0,217);
  line(142,70,400,290);
  line(400,153,335,400);
  line(140,152,141,0);
  line(110,8,186,6);
  line(115,18,191,16);
  line(390,400,395,400);
  //
  strokeWeight(1);
  line(385,174,400,165);
  line(386,177,400,169);
  line(0,237,306,153);
  //
  strokeWeight(3);
  line(369,206,400,192);
  strokeWeight(4);
  line(344,282,400,204);
  //

  //圓 弧 無框線
  noStroke();
  fill(248,214,151);
  ellipse(-75,20,285,285);
  fill(236,200,101);
  ellipse(-45,145,165,165);
  fill(248,168,104);
  ellipse(-75,20,225,225);
  fill(246,186,74);
  ellipse(-45,145,140,140);
  fill(180,100,90);
  ellipse(-75,20,175,175);
  fill(177,28,35);
  ellipse(-45,145,120,120);
  //圓 弧 有框線
  stroke(2);
  strokeWeight(2);
  fill(177,28,35);
  ellipse(351,20,22,22);
  strokeWeight(1);
  fill(239,237,224);
  ellipse(350,111,90,90);
  ellipse(315,435,90,90);
  strokeWeight(10);
  fill(20,20,20);
  ellipse(350,111,50,50);
  strokeWeight(8);
  fill(239,237,224);
  ellipse(350,111,60,60);
  noStroke();
  fill(157,187,205);
  ellipse(315,435,80,80);

  //圓 弧 左中
  noStroke();
  fill(221,213,172);
  ellipse(144,288,85,105);
  fill(214,198,165);
  ellipse(144,288,75,95);
  fill(190,197,190);
  ellipse(144,288,65,85);
  fill(71,90,56);
  ellipse(144,288,55,75);
  stroke(0);
  strokeWeight(1);
  fill(229,219,203);
  ellipse(144,288,45,65);
  fill(249,200,200);
  ellipse(16,405,125,125);

  //圓 弧 右中
  noStroke();
  fill(201,213,172);
  ellipse(220,294,65,85);
  fill(100,120,150);
  ellipse(220,294,55,75);
  fill(181,183,152);
  ellipse(220,294,45,65);

  ////方形_先畫方形在畫線條
  //墊底色
  noStroke();
  fill(227,221,204);
  beginShape();
  vertex(81,245);
  vertex(148,308);
  vertex(181,256);
  vertex(223,296);
  vertex(293,224);
  vertex(302,231);
  vertex(369,157);
  vertex(379,166);
  vertex(179,400);
  vertex(18,400);
  endShape();

  //黑色
  noStroke();
  fill(0,0,0);
  quad(62,292,130,334,148,308,81,245);
  quad(148,308,179,339,193,325,157,293);
  quad(167,278,205,315,223,296,181,256);
  quad(193,325,205,339,218,325,205,315);
  quad(192,351,207,366,220,351,207,338);
  quad(263,275,275,288,295,263,285,252);
  quad(276,243,285,252,302,231,293,224);
  quad(302,231,313,243,327,227,315,216);
  quad(333,198,342,208,353,195,343,186);
  quad(356,172,365,181,379,166,369,157);
  //土黃色
  fill(177,100,54);
  triangle(24,388,18,400,38,400);
  quad(218,325,230,338,246,321,234,308);
  //草綠
  fill(122,157,78);
  quad(48,328,36,357,89,399,112,364);
  quad(163,356,180,366,192,351,179,339);
  //水藍
  fill(115,182,172);
  quad(112,364,138,377,163,356,131,336);
  //粉紅
  fill(232,166,150);
  quad(180,366,160,389,178,399,198,378);

  //黑線_左向右斜
  stroke(0);
  strokeWeight(3);
  line(81,245,18,400);
  line(181,256,85,400);
  line(293,224,116,400);
  line(369,157,147,400);
  line(379,166,179,400);
  //黑線_右向左斜
  stroke(0);
  strokeWeight(3);
  line(81,245,207,366);
  line(181,256,246,321);
  line(293,224,116,400);
  line(369,157,379,166);
  //
  line(62,292,198,378);
  line(48,328,178,399);
  line(36,357,89,399);
  line(24,388,38,400);
  //黑線_右向左斜
  line(159,294,220,349);
  line(169,280,230,338);
  line(255,264,274,287);

  size(400,400);
  smooth();
  //右1曲線
  noFill();
  strokeWeight(2.5);
  beginShape();
  vertex(220,95);
  bezierVertex(230,60,240,40,270,0);
  endShape();
  //右2曲線
  strokeWeight(1.5);
  beginShape();
  vertex(225,117);
  bezierVertex(245,70,260,40,313,0);
  endShape();
  ////////////////////////////////////////////////////////////////////
  //左曲塊
  fill(0);
  beginShape();
  vertex(192,35);
  bezierVertex(185,125,130,135,74,142);
  vertex(71,119);
  bezierVertex(115,130,170,125,188,36);
  vertex(192,35);
  endShape();


  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(0,261);
  bezierVertex(45,265,40,155,107,208);
  endShape();
  //
  strokeWeight(2);
  beginShape();
  vertex(107,208);
  bezierVertex(107,208,150,250,185,210);
  endShape();
  //
  strokeWeight(1.5);
  beginShape();
  vertex(185,210);
  bezierVertex(200,190,190,150,316,149);
  endShape();
  ////粗線
  strokeWeight(7);
  strokeCap(SQUARE);
  line(110,390,400,350);
  stroke(150,62,31);
  line(220,405,400,370);
}


void draw() {
  smooth();
  fill(250,250,250,60);
  noStroke();
  ellipse(350, 111, 90, 90);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(10);
  strokeWeight(5);
  line(350, 111, cos(s) * 45 + 350, sin(s) * 45 + 111);
  // 插入
  noFill();
  strokeWeight(1);
  ellipse(350,111,90,90);
  strokeWeight(5);
  fill(248,214,151);
  ellipse(350,111,60,60);
  strokeWeight(1);
  ellipse(350,111,50,50);
  //
  strokeWeight(1);
  line(350, 111, cos(m) * 25 + 350, sin(m) * 25 + 111);
  strokeWeight(1);
  line(350, 111, cos(h) * 15 + 350, sin(h) * 15 + 111);
  //存檔
//    if(mousePressed){
//    saveFrame ("Kan'clock-####.tif"); 
//  }
      if(mousePressed){
    saveFrame (); 
  }
}



