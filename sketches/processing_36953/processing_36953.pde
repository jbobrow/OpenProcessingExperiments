
size(500,500);
background (0);
smooth();
//Yellow Arrow lines (numbered from top of circle to bottom)
strokeWeight(15);
fill(255,278,0);
stroke(255,278,0);
//Arrow 1
line(-15,300,175,0);
line(175,0,275,455);
triangle(265,455,282,451,276,465);
//Arrow 2
line(30,300,230,0);
line(230,0,415,140);
triangle(423,138,428,150,415,148);
//Arrow 3
line(85,375,455,200);
triangle(443,196,460,198,450,210);
//Arrow 4
line(175,375,500,245);
line(500,245,445,65);
triangle(440,78,444,60,458,73);
//Arrow 5
line(185,425,500,295);
line(500,295,355,175);
triangle(358,190,354,173,372,175);
//Arrow 6
line(195,510,500,475);
line(500,475,375,425);
triangle(368,434,357,416,377,415);
//end of arrows
fill(255,115,0);
noStroke();
triangle(-55,435,55,600,500,-225);
triangle(25,-100,-100,135,600,475);
noFill();
stroke(255,0,0);
strokeWeight(25);
ellipse(0,500,100,100);
ellipse(0,500,250,250);
ellipse(0,500,400,400);
strokeWeight(30);
//These are the orange lines to divide up the red circles
fill(255,115,0);
stroke(255,115,0);
line(85,300,75,325);
line(115,425,95,443);
line(0,370,0,385);
strokeWeight(20);
line(22,473,38,445);
line(35,505,58,505);
//These are the black lines to divide up the red circles
fill(0);
stroke(0);
line(215,470,180,475);
strokeWeight(5);
triangle(0,350,12,350,0,365);
//The Following are the Lines that assmble the word "POWER"
//Letter P Lines starting from bottom point of the letter's stem.
strokeWeight(30);
line(115,160,25,95);
line(25,95,75,35);
line(75,35,124,72);
line(124,72,78,125);
//Letter O Lines starting from top right point of letter.
strokeWeight(25);
line(200,147,163,198);
line(200,147,252,185);
line(252,185,217,232);
line(163,198,217,232);
//Letter W Lines starting from right terminal of the letter.
strokeWeight(20);
line(305,215,334,263);
line(334,263,298,260);
line(298,260,314,293);
line(314,293,262,277);
//letter E Lines starting from top point of letter's stem.
strokeWeight(16);
line(353,324,403,353);
line(353,324,372,293);
line(403,353,423,324);
line(393,313,383,332);
//Letter R Lines starting from top point of letter's stem.
strokeWeight(12);
line(427,373,473,398);
line(427,373,442,347);
line(442,347,463,360);
line(463,360,452,382);
line(452,382,484,375);
//Lines forming the word "OBEY", using the O from "POWER".
//Letter B Lines starting from top point of letter's stem.
line(237,118,277,148);
line(237,118,256,93);
line(256,93,294,122);
line(294,122,277,148);
line(263,130,273,115);
//Letter E Lines starting from bottom point of letter's stem.
line(308,96,274,73);
line(308,96,320,78);
line(274,73,287,53);
line(292,82,304,65);
//Letter Y Lines starting from bottom point of Letter's stem.
line(340,47,323,37);
line(323,37,318,14);
line(323,37,300,36);

