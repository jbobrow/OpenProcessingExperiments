
size(640,480);
//先上背景色
background(240,220,190);
smooth();
///左邊_藍_四角
fill(149,199,203);
quad( 0, 260,0,480,403,480,61,217);

//將圖分成四等份,依次進行
//先畫x向線,在畫垂直y向線
//斜黑線
strokeWeight(3); 
line(2,66,200,150);
//橫黑線
strokeWeight(3); 
line(20,150,116,150);
//橫黑線
strokeWeight(2); 
line(27,167, 123,167);

//垂直黑線
strokeWeight(2); 
line(60,60,60,315);

///斜曲線分段畫
//曲線的切線
noFill();
//左1
//line(0, 274,30, 274);
//line(58, 266, 80, 250);
//bezier( 0, 274, 30, 274, 58, 266, 80, 250);
//右1
//bezier( 80, 250,80,250, 95, 240, 105, 225);
//右2
//bezier(105, 225, 105, 225,120,180,120,185);
///使點停在要的那段就要將切點與切線點設為相同
//bezier( 0, 300,20,295, 58, 280,58,280);
//bezier( 58, 280,58,280, 100, 250, 104, 235);
//bezier(100, 245, 105, 240,120,180,120,185);


///左下_黑_弧&線群
stroke(0); 
strokeCap(SQUARE); 
strokeWeight(3);
noFill(); 
arc(0, 220, 215, 83, radians(15), radians(110)); 
strokeWeight(7);
arc(0, 220, 220, 120, radians(2), radians(95)); 

strokeWeight(1);
fill(0);
triangle(106.5,223,120,190,113,223);
strokeWeight(3);
line(100,240,106,223);

//填色
strokeWeight(9);
line(30,270,100,240);
line(35,275,100,240);
strokeWeight(6);
line(40,270,100,245);
strokeWeight(4);
rect(0, 260,30,16);
rect(33, 260,15,15);
//中心的貝茲曲線

stroke(223, 206, 145); 
strokeWeight(5); 
//black squiggle + lines group in top left quadrant 
noFill(); 
stroke(0); 
//arc1 
strokeWeight(3); 
bezier(147, 184, 153, 169, 164, 157, 184, 173); 
//arc2 
strokeWeight(2); 
bezier(184, 173, 192, 181, 204, 179, 216, 164); 
//arc3 
strokeWeight(1); 
strokeCap(SQUARE); 
bezier(216, 164, 236, 150, 253, 141, 283, 145); 
line(64, 206, 279, 147); 

///左下角三角
fill(0);
triangle(0,480,0,430,63,480);
triangle(63,480,170,480,110,425);
//white triangle
fill(255);
noStroke();
triangle(145,480,170,480,158,468);
quad(78,467,100,480,130,480,92,452);

///方格_黑白_部分
stroke(0);
strokeWeight(5);
quad(170,480,342,311,356,324,200,480);
quad(158,468,242,390,250,400,170,480);
stroke(5);
//line(210,446,238,420);
//左而右
//1
line(197,432,224,457);
//2
line(225,406,251,433);
//3
strokeWeight(25);
line(260,390,275,405);
//4
strokeWeight(25);
line(295,359,307,372);
//1填色
strokeWeight(38);
line(220,430,235,445);
//上面的黑方格
strokeWeight(25);
line(234,395,245,407);


//圖中心的白_圓
strokeWeight(1); 
fill(255,240,230);
ellipse(320,262, 100,100); 

stroke(98, 80,70);
strokeWeight(4); 
fill(233,236,200); 
ellipse(320,262, 70,70);
//圖中_紅_圓
strokeWeight(1); 
fill(225,30,30);
ellipse(320,163, 25,25);

//右上藍_圓
strokeWeight(1); 
fill(135,164,160);
ellipse(400,55, 35,35);

//右半部大三角內部上白色
noStroke();
fill(240,230,220);
triangle(330,480,640,480,480,0);

//經過右下黑三角形的粉紅_線
strokeWeight(3); 
stroke(223,104,70); 
line(342,371,609,246);
strokeWeight(1); 
stroke(0); 
line(343,372,610,247);

//圖右下的黑_三角型 
fill(0); 
quad(475,260, 477,270, 640,342, 640,340); 
quad(475,260, 477,270, 310,455, 310,450); 
 
//右上_黃_三角形&圓
noStroke();
fill(250,200,10);
triangle(532,43,488,95,566,95);
fill(185,200,182); 
ellipse(585,107, 45,45); 
stroke(255); 
fill(77,100,160); 
ellipse(585,107, 33,33); 

//右半部的大三角
stroke(0); 
strokeWeight(3); 
line(330,480, 480,0); 
line(480,0, 610,390); 

strokeWeight(1); 
line(600,210, 335,56); 
strokeWeight(1.5);
line(600,210, 340,112); 
strokeWeight(1.5);
line(354,332, 515,260); 
line(352, 339, 525, 267); 

//三角形中間的白_圓
noStroke(); 
fill(195,200,177);
ellipse(480,210, 46,46); 
stroke(0); 
strokeWeight(1); 
fill(263,236,250); 
ellipse(480,210, 35,35); 
 
//右上角直線群
stroke(0); 
strokeWeight(1); 
int x = 609; 
int xWidth = 30; 
int yLow = 140; 
int yHigh = 10; 
int yInterval= 3;
//上面兩條線 
line(x, yHigh, x + xWidth, yHigh); 
yHigh = yHigh + yInterval; 
line(x, yHigh, x + xWidth, yHigh); 
//下部分三條橫線 
line(x, yLow, x + xWidth, yLow); 
yLow = yLow + yInterval; 
line(x, yLow, x + xWidth, yLow); 
yLow = yLow + yInterval; 
line(x, yLow, x + xWidth, yLow); 

//垂直兩條平行線
strokeWeight(2); 
int vX = 630; 
int vYtop =0; 
int vYdown = 150; 
int xInterval = 5; 
line(vX, vYtop, vX, vYdown); 
vX = vX + xInterval; 
line(vX, vYtop, vX, vYdown); 
//線段上的圓拱 
noFill(); 
strokeWeight(1.5); 
arc(640,45, 40,40, radians(85), radians(275)); 
 
//右下角棕色三角&綠色四角形
fill(166,104,53); 
triangle(417, 480,604,368, 640,480); 
fill(42,76,77); 
quad(604,368, 640,480, 640,380, 623,355);

//右下角圓拱組合
noFill(); 
//左下_粉紅_由_四個圓拱組成的群組
//順序_左下數來
//1
stroke(221,124,105); 
strokeWeight(4); 
arc(475,407, 77,77, radians(140),radians(310)); 
//2
stroke(203,65,65); 
strokeWeight(5); 
arc(520,352, 65,67, radians(130),radians(315)); 
//3
stroke(173,76,67); 
strokeWeight(4); 
arc(569,312, 62,62, radians(144),radians(315)); 
//1黑
stroke(0); 
strokeWeight(1); 
arc(476,408, 74,74, radians(140),radians(310));
//2黑 
stroke(0); 
strokeWeight(4); 
arc(521,353, 63,63, radians(130),radians(315)); 
 
//4 
stroke(230,108,103); 
strokeWeight(4); 
arc(603,280, 34,34, radians(140),radians(315)); 
//3黑 
stroke(0); 
strokeWeight(1); 
arc(569,312, 60,60, radians(144),radians(315)); 
//4黑 
arc(603,280, 32,32, radians(140),radians(315)); 
//black diagonals across arcs 
line(622,240, 431,420); 
strokeWeight(2); 
line(611,235, 469,365); 
 
//右下角圓
fill(0); 
stroke(0); 
strokeWeight(1); 
ellipse(592,430, 80,80); 

//圓的上色
fill(23,89,176); 
arc(592,430, 79,79, radians(115),radians(145)); 
arc(592,430, 79,79, radians(238),radians(253)); 
arc(592,430, 79,79, radians(267),radians(292)); 
arc(592,430, 79,79, radians(54),radians(87)); 
fill(222,198,90); 
arc(592,430, 79,79, radians(168),radians(192)); 
arc(592,430, 79,79, radians(328),radians(337)); 
fill(100,124,184); 
arc(592,430, 79,79, radians(347),radians(370)); 
fill(251,239,241); 
arc(592,430, 79,79, radians(90),radians(93)); 
arc(592,430, 79,79, radians(96),radians(99)); 
arc(592,430, 79,79, radians(102),radians(105)); 
arc(592,430, 79,79, radians(108),radians(111)); 
arc(592,430, 79,79, radians(255),radians(258)); 
arc(592,430, 79,79, radians(261),radians(264)); 
//圓內的圓
stroke(0); 
//fill(233,225,207); 
ellipse(592,430, 63,63); 
fill(0); 
ellipse(597,427, 11,11);

///圓上的三_分岔三角形
noStroke(); 
fill(255); 
//1左三角
quad(511,397, 516,382, 587,415, 587,417); 
fill(200,74,28); 
quad(561,402, 587,415, 587,417, 558,410); 
fill(219,215,190); 
quad(561,402, 558,410, 554,408, 557,401); 
fill(0); 
quad(554,408, 556,401, 554,400, 553,407); 
quad(552,408, 553,400, 552,398, 550,408); 
quad(551,398, 549,397, 547,408, 549,406); 
fill(200,74,28); 
quad(545,407, 550,396, 543,394, 540,406); 
fill(105,87,85); 
quad(536,404, 538,392, 516,382, 511,397); 
 
//2右三角
fill(255); 
fill(230,222,211); 
quad(605,407, 669,328, 676,337, 605, 409); 
fill(200,74,28); 
quad(614,395, 617,398, 605,409, 605,407); 
noFill(); 
quad(614,396, 617,398, 600,385, 625,382); 
fill(200,74,28); 
quad(630,385, 625,382, 640,364, 646,369); 
fill(230,222,211); 
quad(640,364, 646,370, 651,364, 647,358); 
fill(0); 
quad(651,364, 647,358, 669,328, 676,337); 
///圓外框
stroke(0); 
strokeWeight(2); 
noFill(); 
ellipse(593,429, 80,80); 
//3右下三角 
fill(255);
noStroke(); 
quad(609,434, 610,433,658,480, 647,480); 
fill(200,74,28); 
quad(609,434, 610,433, 629,451, 626,455); 
fill(0); 
quad(639,470, 647,466, 647,469,641,473); 
quad(649,470, 652,473, 645,478, 642,475); 
quad(649,480, 655,476, 658,480, 652,482); 
 







