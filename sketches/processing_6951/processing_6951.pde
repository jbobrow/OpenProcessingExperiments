
size(640, 480);
background(#e1ddd4);
noFill();
ellipseMode(CORNER);
smooth();
strokeWeight(3);
//arc left upper corner
arc(-5,-50,350,400,PI,TWO_PI-PI/2);
strokeWeight(2);
arc(-5,-50,770,500,PI,TWO_PI-PI/2);
fill(#c5343b);
//red circle left corner
ellipse(107,59,28,28);
fill(#f2f0f1);
noStroke();
//white triangle middle
quad(348,0,268,0,137,480,483,480);
stroke(0);
strokeWeight(2);

//pink square right
fill(#cf9eab);
noStroke();
triangle(484,100,566,100,484,150);
quad(484,100,520,128,552,178,484,178);
stroke(0);
//lines top middle
line(145,11,379,106);
line(239,0,375,89);
strokeWeight(1);
line(379,106,452,137);
line(375,89,452,137);
strokeWeight(4);
line(265,0,135,480);
strokeWeight(3);
line(349,0,485,480);
ellipseMode(CENTER);
strokeWeight(1);
noFill();
//circle fade
for (int i = 60; i > 30 ; i=i-1) {
 stroke(180+i,180+i,180+i);
 ellipse(303,134,i+17,i+17);
}
stroke(0);
ellipse(303,134,46,46);
//left down corner
noStroke();
fill(#5e93bb);
triangle(0,288,72,349,0,437);
fill(#c5d1d6);
quad(89,366,150,418,133,480,-10,480);
stroke(0);
strokeWeight(3);
line(0,287,222,479);


fill(#FFFFFF);
quad(33,396,18,384,-13,417,2,432);
quad(2,432,16,447,-2,468,-25,460);
quad(56,369,71,382,47,411,33,398);
quad(114,334,99,321,74,347,91,361);
quad(74,347,91,361,127,316,114,305);
quad(114,304,128,286,145,298,129,315);
fill(#000000);
quad(42,358,57,370,31,398,18,384);
quad(31,396,45,413,18,445,1,430);
quad(74,347,91,361,71,382,56,369);
quad(111,305,127,317,111,335,97,321);
quad(128,286,145,298,164,275,150,264);
strokeWeight(4);
line(0,467,164,276);
line(57,367,149,263);
noStroke();
fill(#e6bd39);
ellipse(523,407,96,96);
stroke(0);
strokeWeight(1);
fill(#cbd3e5);
ellipse(523,407,80,80);
strokeWeight(6);
noFill();
stroke(#ce7052);
ellipse(523,407,127,127);

stroke(0);
fill(255);
strokeWeight(1);
ellipse(125,205,119,119);
fill(0);
noStroke();
ellipse(125,205,86,86);
stroke(#b95647);
strokeWeight(3);
fill(255);
ellipse(125,205,66,66);
stroke(0);
line(0,272,67,258);
noFill();
arc(38,270, 120, 43, radians(180), radians(320));
fill(#cdcfb9);
noStroke();
triangle(137,480,153,422,220,480);
fill(#5a6a50);
triangle(300,203,190,344,315,208);
triangle(303,201,580,353,295,212);
stroke(0);
strokeWeight(1);
line(163,297,351,200);
strokeWeight(2);
line(168,304,356,207);
line(150,337,447,180);
stroke(#a25641);
line(150,335,447,178);
fill(0);
noStroke();
triangle(114,442,297,189,308,197);
triangle(297,189,573,349,300,205);
fill(#b18143);
triangle(225,480,443,333,484,480);
fill(#2e4e4a);
quad(445,332,467,315,570,480,486,480);


noFill();

stroke(#dd867b);
strokeWeight(5);

arc(300,360,104,104,radians(130),radians(310));

arc(367,300,89,89,radians(150),radians(320));

arc(437,255,89,89,radians(170),radians(300));
arc(480,209,56,56,radians(170),radians(300));

stroke(0);
strokeWeight(2);

arc(300,360,98,98,radians(130),radians(310));
arc(367,300,83,83,radians(140),radians(320));
arc(437,255,83,83,radians(156),radians(300));
arc(480,209,50,50,radians(156),radians(300));

line(280,315,506,146);
line(250,400,524,150);

strokeWeight(4);
line(360,335,505,225);
stroke(#e1c025);
line(360,339,505,229);

noStroke();
fill(#204a8d);
ellipse(424,2,50,50);
noFill();
stroke(0);
strokeWeight(1);
ellipse(424,2,56,56);
ellipse(424,2,60,60);
strokeWeight(2);
ellipse(424,2,66,66);
line(477,0,477,55);
line(484,0,484,55);
line(455,31,510,31);
line(455,36,510,36);
line(455,41,510,41);




fill(#d7a43f);
strokeWeight(4);
ellipse(614,88,120,120);
fill(#b2c1b4);
strokeWeight(1);
ellipse(640,88,100,100);
noStroke();
fill(255);
quad(390,382,374,377,365,384,382,390);
fill(0);
stroke(0);
ellipse(433,415,110,110);
fill(#d8d7db);
ellipse(433,415,87,87);
stroke(#265497);
strokeWeight(8);
noFill();
strokeCap(SQUARE);
arc(433,415,96,96,radians(230),radians(240));
arc(433,415,96,96,radians(254),radians(290));
arc(433,415,96,96,radians(350),radians(380));
arc(433,415,96,96,radians(50),radians(90));
arc(433,415,96,96,radians(113),radians(146));
stroke(255);
arc(433,415,96,96,radians(243),radians(245));
arc(433,415,96,96,radians(248),radians(251));
arc(433,415,96,96,radians(93),radians(95));
arc(433,415,96,96,radians(98),radians(100));
arc(433,415,96,96,radians(103),radians(105));
arc(433,415,96,96,radians(109),radians(110));
stroke(#dec982);
arc(433,415,96,96,radians(330),radians(340));
arc(433,415,96,96,radians(165),radians(192));

fill(#cb432e);
noStroke();
triangle(430,405,390,382,385,390);
triangle(449,395,463,370,467,374);
triangle(451,421,483,443,478,448);
quad(483,356,478,352,496,328,506,333);
quad(368,373,365,386,358,384,361,370);
fill(#7b6a60);
quad(324,352,355,367,350,382,318,374);
fill(0);
ellipse(440,408,16,16);
quad(505,321,513,326,547,290,538,278);
ellipse(523,407,37,37);

fill(255);
quad(483,443,478,448,510,480,525,480);
quad(469,372,483,356,478,352,463,369);
arc(523,407,34,34,radians(57),radians(240));

stroke(0);
strokeWeight(3);
fill(#c43328);
quad(634,414,640,420,566,480,550,480);
strokeWeight(10);
line(645,447,590,430);


//chessboard
noStroke();
fill(#0a5f9a);
ellipse(680,361,120,120);

stroke(0);
strokeWeight(4);
line(542,263,640,420);
line(540,263,640,197);
line(565,245,642,369);
line(520,127,643,333);
line(517,127,640,64);
line(555,288,626,245);
line(548,112,642,273);


//random spots
fill(0);
noStroke();
float randx;
float randy;
float minusOrPlus;
float minusOrPlus2;
for(int f=0;150 > f; f++){
  randx=random(20);
  randy=random(20);
  minusOrPlus=round(random(0,2));
  minusOrPlus2=round(random(0,2));
  if(30 > randx + randy ){
   if(minusOrPlus==1){
    randx=304+randx;
   }else{
    randx=304-randx;
   } 
   if(minusOrPlus2==1){
    randy=133+randy;
   }else{
    randy=133-randy;
   } 
    ellipse(randx,randy,1,1);
  }
}

