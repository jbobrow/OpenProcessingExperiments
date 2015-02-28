
//Miro's painting
//Test 010 [Date:20131028] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//米字移動，色彩變化，隨著秒移動
//米字每60秒繞一圈，背景變色
//每分鐘右側線條寬度增加
//程式結構編排

int s = second();
int m = minute();


void setup() {

  size(397, 500);
  background(220, 220, 212);
  smooth();
  colorMode(RGB);
  frameRate(30);
  s = 0;
}

void draw() {

  s = second();
  m = minute();

  println(s+" sec");//顯示資訊
  println(m+" min");



  drawfloat();       
  drawLinesA();                  //Line//右側斜線
  drawQuad();                    //Quad//大曲線填色區塊
  drawCurves();                  //大曲線填色區塊
  drawQuadRGBY();                //Quad//大曲線填色區塊
  drawCurvesBlack();
  drawLinesCenter();             //Line//Center
  drawCurvesRed();               //Curves//左上三支紅色曲線
  drawEllipseRed();              //Red ellipse//左上紅色圓圈
  drawCurvesMoon();              //Curves//切過月亮長條曲線
  drawCurvesTopRight();          //Curves//右上封閉曲線
  drawCurvesCenterBlueBlack();   //Curves//中央藍黑填色曲線
  drawCurvesCenterRedBlack();    //Curves//中央紅黑填色曲線
  drawCurvesBlackEllipse();      //Curves//最下方曲線+填黑圓
  drawMoon();
  drawCurvesTopEllipseBlackRed();
  drawfloatStar();
}


// stars//Line//星星
void drawfloatStar() {

  int x1Pos = 199;
  int y1Pos = 250;

  pushMatrix();
  stroke(22*s, 252*s, 3*s);
  strokeWeight(1);
  translate(x1Pos, y1Pos);
  rotate(2*PI*s/60);
  line(332-x1Pos, 294-y1Pos, 334-x1Pos, 382-y1Pos);
  line(282-x1Pos, 339-y1Pos, 372-x1Pos, 331-y1Pos);
  line(297-x1Pos, 290-y1Pos, 377-x1Pos, 392-y1Pos);
  line(369-x1Pos, 298-y1Pos, 283-x1Pos, 380-y1Pos);
  popMatrix();
}


void drawfloat() {

  //background(220, 220, 212);

  background(48*(s/60), 113*(s/60), s);
  println(s+" sec");//顯示資訊

  //Line//Star
  stroke(241, 250, 30);
  strokeWeight(1);

  int xPos = 332;
  int yPos = 335;
  int sunXPos = 88;
  int sunYPos = 81;


  pushMatrix(); 
  //translate(xPos, yPos);
  translate(sunXPos+(xPos-sunXPos)*(s*1.0000f/59), sunYPos+(yPos-sunYPos)*(s*1.0000f/59));//強制浮點
  rotate(PI/30*s);

  line(332-xPos, 294-yPos, 334-xPos, 382-yPos);
  line(282-xPos, 339-yPos, 372-xPos, 331-yPos);
  line(297-xPos, 290-yPos, 377-xPos, 392-yPos);
  line(369-xPos, 298-yPos, 283-xPos, 380-yPos);
  popMatrix();
}




void drawLinesA() {
  //Line//右側斜線
  stroke(70*s, 70*s, 30*s);
  strokeWeight(2*m);
  line(395, 144, 364, 173);
}

void drawQuad() {
  //Quad//大曲線填色區塊
  noStroke();
  fill(s, 2*s, m);// Black
  quad(196, 312, 225, 312, 224, 338, 191, 338);
  fill(s, 80, 156);// Blue
  quad(196, 312, 209, 312, 209, 326, 194, 324);
  fill(208, s, 50);// Red
  quad(209, 326, 225, 326, 224, 338, 208, 338);
}

void drawCurves() {
  //大曲線填色區塊
  fill(0, 0, 0);//黑
  noStroke();
  beginShape();
  curveVertex(143, 371);
  curveVertex(143, 371);
  curveVertex(147, 393);
  curveVertex(152, 407);
  curveVertex(181, 434);
  curveVertex(225, 434);

  curveVertex(254, 414);
  curveVertex(260, 339);

  curveVertex(263, 365);
  curveVertex(265, 369);
  curveVertex(265, 371);
  curveVertex(266, 370);
  curveVertex(265, 369);

  curveVertex(263, 351);
  curveVertex(242, 351);
  curveVertex(223, 351);
  curveVertex(189, 351);
  curveVertex(165, 348);
  curveVertex(144, 344);
  curveVertex(144, 344);
  endShape();

  noStroke();
  beginShape();
  curveVertex(242, 351);
  curveVertex(242, 351);

  curveVertex(262, 351);
  curveVertex(264, 362);
  curveVertex(265, 371);
  curveVertex(265, 381);
  curveVertex(262, 397);
  curveVertex(251, 383);
  curveVertex(251, 350);
  curveVertex(243, 391);

  curveVertex(242, 351);
  curveVertex(242, 351);
  endShape();
}

void drawQuadRGBY() {
  //Quad//大曲線填色區塊
  noStroke();
  fill(208*s, 67, 50);// Red
  quad(184, 407, 223, 408, 223, 435, 181, 433);
  quad(224, 390, 262, 396, 255, 412, 223, 408);
  quad(241, 338, 261, 337, 263, 350, 242, 350);
  quad(160, 374, 187, 381, 184, 407, 151, 406);
  quad(160, 374, 160, 374, 151, 406, 148, 393);

  fill(27, 94, 50);// Green
  quad(224, 351, 242, 350, 242, 392, 224, 390);
  quad(192, 339, 208, 339, 207, 351, 189, 351);
  quad(165, 349, 189, 351, 189, 366, 163, 363);

  fill(57, 75, 150);// Blue
  quad(224, 337, 241, 338, 242, 350, 224, 351);
  quad(188, 365, 223, 365, 224, 390, 187, 381);
  quad(146, 345, 165, 349, 160, 374, 142, 370);

  fill(225, 225, 31);// Yellow
  quad(208, 337, 224, 337, 224, 351, 207, 351);
  fill(218, 139, 47);// Yellow
  quad(151, 310, 195, 311, 189, 351, 146, 345);
}

void drawCurvesBlack() {
  noStroke();//Black
  fill(0, 0, 0);
  beginShape();
  curveVertex(146, 345);
  curveVertex(146, 345);

  curveVertex(148, 329);
  curveVertex(158, 332);
  curveVertex(166, 348);
  curveVertex(157, 346); 

  curveVertex(146, 345);
  curveVertex(146, 345);
  endShape();
}

void drawLinesCenter() {
  //Line//Center
  stroke(0, 0, 0);
  strokeWeight(2);
  line(141, 311, 244, 311);
  line(192, 338, 265, 338);

  //Line
  stroke(0, 0, 0);
  strokeWeight(2);
  line(197, 297, 176, 472);
  line(223, 279, 225, 481);
  line(242, 329, 241, 391);
}

void drawCurvesRed() {
  //Curves//左上三支紅色曲線//a
  noFill();
  stroke(41, 41, 7);
  strokeWeight(2);

  beginShape();
  curveVertex(74, 61);
  curveVertex(74, 61);

  curveVertex(68, 55);
  curveVertex(66, 52);
  curveVertex(58, 46);
  curveVertex(42, 39);
  curveVertex(25, 45);
  curveVertex(22, 50);
  curveVertex(20, 52);
  curveVertex(19, 53);
  curveVertex(18, 55);
  curveVertex(17, 60);
  curveVertex(17, 67);

  curveVertex(22, 78);
  curveVertex(22, 78);
  endShape();

  //Curves//左上三支紅色曲線//b
  beginShape();
  curveVertex(68, 69);
  curveVertex(68, 69);

  curveVertex(62, 65);
  curveVertex(55, 63);
  curveVertex(49, 62);
  curveVertex(41, 67);
  curveVertex(35, 74);
  curveVertex(29, 87);
  curveVertex(28, 97);
  curveVertex(29, 105);

  curveVertex(34, 113);
  curveVertex(34, 113);
  endShape();

  //Curves//左上三支紅色曲線//c
  beginShape();
  curveVertex(66, 79);
  curveVertex(66, 79);

  curveVertex(54, 75);
  curveVertex(43, 86);
  curveVertex(43, 97);
  curveVertex(46, 106);
  curveVertex(48, 111);
  curveVertex(55, 120);

  curveVertex(61, 125);
  curveVertex(61, 125);
  endShape();
}

void drawEllipseRed() {
  //Red ellipse//左上紅色圓圈
  noStroke();
  fill(202, 73, 28);
  ellipseMode(CENTER);
  ellipse(90, 82, 56, 50);
}

void drawCurvesMoon() {
  //Curves//切過月亮長條曲線
  noFill();
  stroke(70, 70, 30);
  beginShape();
  curveVertex(246, 0);
  curveVertex(246, 0);
  curveVertex(235, 52);
  curveVertex(204, 90);
  curveVertex(155, 137);
  curveVertex(112, 182);
  curveVertex(63, 270);
  curveVertex(35, 382); 
  curveVertex(64, 425); 
  curveVertex(112, 420);
  curveVertex(146, 391);
  curveVertex(166, 350);
  curveVertex(146, 328);
  curveVertex(116, 343);
  curveVertex(109, 353);
  curveVertex(109, 353);
  endShape();

  fill(0, 0, 0);//填黑圓
  stroke(70, 70, 30);
  beginShape();
  curveVertex(109, 353);
  curveVertex(109, 353);
  curveVertex(104, 348);
  curveVertex(96, 345);
  curveVertex(86, 348);
  curveVertex(77, 354);
  curveVertex(66, 370);
  curveVertex(70, 381);
  curveVertex(74, 383);
  curveVertex(82, 386);
  curveVertex(98, 380);
  curveVertex(108, 370);
  curveVertex(113, 361);
  curveVertex(109, 353);
  curveVertex(109, 353);
  endShape();

  //Curves//中央填色與直線相交曲線
  noFill();
  stroke(0, 0, 0);
  strokeWeight(2);
  beginShape();
  curveVertex(356, 154);
  curveVertex(356, 154);

  curveVertex(278, 170);
  curveVertex(243, 184);
  curveVertex(217, 198); 
  curveVertex(191, 239);
  curveVertex(177, 258); 
  curveVertex(164, 279); 
  curveVertex(151, 312);
  curveVertex(143, 360);

  curveVertex(147, 393);
  curveVertex(152, 407);
  curveVertex(181, 434);
  curveVertex(225, 434);
  curveVertex(254, 414);
  curveVertex(262, 396);

  curveVertex(266, 378);
  curveVertex(260, 336);
  curveVertex(255, 295);
  curveVertex(261, 214);
  curveVertex(290, 188);

  curveVertex(355, 164);
  curveVertex(355, 164);
  endShape();
}

void drawCurvesTopRight() {
  //Curves//右上封閉曲線
  noFill();
  stroke(0);
  strokeWeight(2);

  beginShape();
  curveVertex(279, 112); 
  curveVertex(279, 112);  

  curveVertex(292, 98);
  curveVertex(330, 93);
  curveVertex(376, 132);
  curveVertex(379, 236);
  curveVertex(339, 282);
  curveVertex(312, 271);
  curveVertex(319, 243);
  curveVertex(339, 216);
  curveVertex(352, 189);
  curveVertex(353, 167);
  curveVertex(344, 135);
  curveVertex(289, 125);

  curveVertex(279, 112); 
  curveVertex(279, 112); 
  endShape();
}

void drawCurvesCenterBlueBlack() {
  //Curves//中央藍黑填色曲線//藍
  fill(55, 80, 134);
  stroke(0);
  strokeWeight(1);

  beginShape();
  curveVertex(261, 215); 
  curveVertex(261, 215);   

  curveVertex(260, 198); 
  curveVertex(268, 190);
  curveVertex(290, 190);
  curveVertex(308, 215);
  curveVertex(304, 243);
  curveVertex(287, 266);
  curveVertex(290, 243);
  curveVertex(278, 225);

  curveVertex(261, 215); 
  curveVertex(261, 215); 
  endShape();

  //Curves//中央藍黑填色曲線//黑
  fill(0, 0, 0);
  noStroke();

  beginShape();
  curveVertex(290, 190); 
  curveVertex(290, 190);   

  curveVertex(308, 215);
  curveVertex(304, 243);
  curveVertex(287, 266);
  curveVertex(290, 243);
  curveVertex(278, 225);
  curveVertex(261, 215);

  curveVertex(290, 190); 
  curveVertex(290, 190); 
  endShape();
}

void drawCurvesCenterRedBlack() {
  //Curves//中央紅黑填色曲線//黑
  fill(0, 0, 0);
  noStroke();

  beginShape();
  curveVertex(195, 188); 
  curveVertex(195, 188);   

  curveVertex(186, 179);
  curveVertex(189, 169);
  curveVertex(197, 151);
  curveVertex(217, 142);
  curveVertex(235, 151);
  curveVertex(240, 160);
  curveVertex(242, 185);
  curveVertex(233, 204);
  curveVertex(225, 206);
  curveVertex(217, 199);
  curveVertex(222, 179);
  curveVertex(221, 165);
  curveVertex(214, 166);
  curveVertex(210, 172);
  curveVertex(205, 182);

  curveVertex(195, 188); 
  curveVertex(195, 188); 
  endShape();

  //Curves//中央紅黑填色曲線//紅
  fill(198, 69, 29);
  noStroke();

  beginShape();
  curveVertex(242, 185);   
  curveVertex(242, 185);

  curveVertex(233, 204);
  curveVertex(225, 206);
  curveVertex(217, 199); 

  curveVertex(242, 185);   
  curveVertex(242, 185); 
  endShape();
}

void drawCurvesBlackEllipse() {
  //Curves//最下方曲線+填黑圓
  noFill();
  stroke(s);
  strokeWeight(2);

  beginShape();
  curveVertex(193, 468); 
  curveVertex(193, 468);  

  curveVertex(232, 482);
  curveVertex(255, 486);
  curveVertex(280, 484);
  curveVertex(297, 476);
  curveVertex(299, 455);

  curveVertex(303, 426); 
  curveVertex(303, 426); 
  endShape();

  //Curves//填黑圓 
  noStroke();
  fill(m, s, m-s); 
  beginShape();
  curveVertex(303, 426); 
  curveVertex(303, 426);

  curveVertex(315, 424);
  curveVertex(326, 418);
  curveVertex(326, 407);
  curveVertex(322, 401);
  curveVertex(299, 400);
  curveVertex(290, 406);
  curveVertex(289, 415);
  curveVertex(295, 420);

  curveVertex(303, 426); 
  curveVertex(303, 426); 
  endShape();
}

void drawMoon() {

  //Green//月亮上半部綠色曲線
  //fill(21, 83, 42);
  fill(200*(s/60), 10*(s/60), 5*s);
  noStroke();
  beginShape();
  curveVertex(219, 14); 
  curveVertex(219, 14);
  curveVertex(184, 23);

  curveVertex(149, 43);
  curveVertex(148, 44);
  curveVertex(147, 45);

  curveVertex(133, 51);
  curveVertex(123, 57);
  curveVertex(112, 67);
  curveVertex(89, 99);
  curveVertex(87, 101);
  curveVertex(85, 114);

  curveVertex(95, 160);
  curveVertex(107, 178);
  curveVertex(115, 181);
  curveVertex(114, 182);
  curveVertex(130, 160);
  curveVertex(153, 139);

  curveVertex(168, 88);
  curveVertex(184, 51);
  curveVertex(219, 14);
  curveVertex(219, 14);
  endShape();

  //Black//月亮下半部黑色曲線
  fill(50*(s/30), s, 80*(s/60));
  noStroke();
  beginShape();
  curveVertex(153, 139);
  curveVertex(153, 139);
  curveVertex(156, 158);
  curveVertex(166, 197);
  curveVertex(166, 197);
  curveVertex(167, 196); 
  curveVertex(148, 194);
  curveVertex(114, 182);
  curveVertex(115, 181);
  curveVertex(123, 169);
  curveVertex(133, 159);
  curveVertex(153, 139);
  curveVertex(153, 139);
  endShape();

  //Black //左上黑色相交
  noStroke();
  fill(0, 18, 20);

  beginShape();
  curveVertex(112, 67);
  curveVertex(112, 67);
  curveVertex(95, 87);
  curveVertex(89, 99);
  curveVertex(87, 101);
  curveVertex(87, 107);
  curveVertex(96, 104);
  curveVertex(107, 98);
  curveVertex(114, 87);
  curveVertex(116, 80);
  curveVertex(112, 67);
  curveVertex(112, 67);
  endShape();

  //Curves//右側與曲線相交圓//藍黑紅
  noStroke();
  fill(55, 80, 134);//藍
  beginShape();
  curveVertex(339, 283); 
  curveVertex(339, 283);

  curveVertex(337, 265);
  curveVertex(340, 256);
  curveVertex(347, 245);
  curveVertex(367, 233);
  curveVertex(381, 238); 
  curveVertex(370, 254); 
  curveVertex(352, 275);

  curveVertex(339, 283); 
  curveVertex(339, 283);
  endShape();


  fill(0, 0, 0);//黑
  beginShape();
  curveVertex(381, 238); 
  curveVertex(381, 238);

  curveVertex(390, 254);
  curveVertex(390, 265);
  curveVertex(386, 280);
  curveVertex(379, 289);
  curveVertex(367, 295); 
  curveVertex(348, 292); 
  curveVertex(339, 283);
  curveVertex(352, 275); 
  curveVertex(370, 254);

  curveVertex(381, 238); 
  curveVertex(381, 238);
  endShape();

  //下方黑紅小圓
  fill(198, 69, 29);//紅小圓
  beginShape();
  curveVertex(352, 275);
  curveVertex(352, 275);

  curveVertex(350, 265);
  curveVertex(358, 251);
  curveVertex(370, 254);
  curveVertex(374, 264);
  curveVertex(373, 275);
  curveVertex(365, 282); 
  curveVertex(356, 278); 

  curveVertex(352, 275);
  curveVertex(352, 275);
  endShape();

  fill(0, 0, 0);//黑小圓
  beginShape();
  curveVertex(352, 275);
  curveVertex(352, 275);

  curveVertex(350, 265);
  curveVertex(358, 251);
  curveVertex(370, 254);
  curveVertex(363, 263);
  curveVertex(358, 270);

  curveVertex(352, 275);
  curveVertex(352, 275);
  endShape();
}


void drawCurvesTopEllipseBlackRed() {
  //上方小圓側與曲線相交填黑
  beginShape();
  curveVertex(355, 105);
  curveVertex(355, 105);

  curveVertex(367, 116);
  curveVertex(376, 131);
  curveVertex(395, 144);
  curveVertex(384, 154);
  curveVertex(376, 131);
  curveVertex(347, 114);

  curveVertex(355, 105);
  curveVertex(355, 105);
  endShape();

  //上方黑紅小圓
  fill(198, 69, 29);//紅小圓
  beginShape();
  curveVertex(330, 93);
  curveVertex(330, 93);

  curveVertex(343, 99);
  curveVertex(355, 105);
  curveVertex(347, 114);
  curveVertex(334, 111);
  curveVertex(329, 102);
  curveVertex(330, 97);

  curveVertex(330, 93);
  curveVertex(330, 93);
  endShape();

  fill(120*s, 20*s, 0);//黑小圓
  beginShape();
  curveVertex(330, 93);
  curveVertex(330, 93);

  curveVertex(339, 85);
  curveVertex(348, 83);
  curveVertex(356, 92);
  curveVertex(355, 105);
  curveVertex(343, 99);

  curveVertex(330, 93);
  curveVertex(330, 93);
  endShape();
}



