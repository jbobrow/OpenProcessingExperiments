
PImage bg;

size(500,500);
smooth();

//bg = loadImage("mehretu-bw.jpg");
//background(bg);
background(222,215,186);

/* Background */
noStroke();
fill(222,202,178);
quad(0,213,252,198,270,211,0,340);


fill(212,204,182);
quad(0,90,500,17,500,110,0,137);
quad(0,314,500,121,500,241,0,370);
ellipse(-10,222,70,140);
ellipse(476,450,360,70);
ellipse(105,462,290,23);

fill(222,202,178);
triangle(0,347,259,281,0,364);

/* Shapes */
noStroke();
fill(164,160,149);
quad(0,422,52,500,30,500,0,453);
quad(26,239,35,237,80,500,73,500);

fill(200,96,59);
beginShape();
  vertex(0,446);
  vertex(29,489);
  vertex(29,489);
  vertex(20,500);
  vertex(0,500);
endShape();

fill(164,160,149);
quad(0,422,52,500,30,500,0,453);

/* Curves */
noFill();
strokeWeight(2);
stroke(150,60,60);
bezier(157,0,
       154,5,
       185,37,
       187,37);

noFill();
strokeWeight(4);
stroke(48,83,111);
bezier(405,383,
       300,440,
       350,480,
       365,500);

noFill();
strokeWeight(2);
stroke(150,60,60);
beginShape();
  vertex(161,92);
  vertex(140,95);
  bezierVertex(141,49,121,49,121,49);
  bezierVertex(108,49,97,66,90,83);
  bezierVertex(50,181,105,181,105,181);
endShape();

curve(251,435,131,435,129,500,229,520);
curve(500,370,350,370,322,454,522,600);

strokeWeight(4);
bezier(240,210,
       35,260,
       138,340,
       500,424);

stroke(51,56,52);
bezier(415,0,
       340,80,
       380,180,
       500,250);

strokeWeight(2);
bezier(320,178,
       270,242,
       310,315,
       500,345);     
    
stroke(150,60,60);
bezier(425,0,
       435,284,
       470,324,
       500,255);

strokeWeight(1);
stroke(87,83,75);
bezier(300,0,
       185,121,
       242,182,
       272,201);

stroke(45,108,126);
strokeWeight(3);
bezier(0,160,
       73,160,
       171,106,
       171,95);       

/* Quads */       
stroke(22,23,15);
strokeWeight(2);
quad(-2,441,45,460,38,468,-2,454);
quad(-2,421,61,450,50,457,-2,435);
quad(-2,391,85,439,74,443,-2,410);
quad(-18,376,29,374,120,428,92,436);
quad(50,374,103,373,164,423,135,427);
quad(118,376,175,377,216,419,176,422);
quad(188,379,245,377,269,417,228,418);
quad(259,380,317,379,327,416,280,417);
quad(332,383,392,385,393,415,335,416);
quad(404,387,469,385,462,417,404,415);
quad(478,388,545,389,492,420,471,418);

/* Circles */
fill(40,80,150);
noStroke();
ellipse(3,57,15,15);
ellipse(29,125,15,15);
ellipse(288,314,15,15);
ellipse(164,338,15,15);
ellipse(221,99,15,15);
ellipse(231,336,15,15);
ellipse(287,313,15,15);
ellipse(331,9,15,15);
ellipse(329,35,15,15);
ellipse(393,451,15,15);
ellipse(417,46,15,15);
ellipse(417,55,15,15);

fill(59,113,159);
ellipse(126,64,9,9);
ellipse(191,173,9,9);
ellipse(215,51,9,9);
ellipse(226,116,9,9);
ellipse(272,109,9,9);
ellipse(315,59,9,9);
ellipse(484,46,9,9);
ellipse(496,233,9,9);

fill(208,74,62);
ellipse(187,198,9,9);
ellipse(192,197,9,9);
ellipse(247,430,9,9);
ellipse(400,342,9,9);
ellipse(408,238,9,9);

fill(173,52,59);
ellipse(403,310,14,14);
ellipse(404,309,14,14);
ellipse(456,299,14,14);

/* Sweeping Lines */
noFill();
stroke(92,49,43);
strokeWeight(3);
curve(0,116,0,46,500,16,500,36);

// white shapes
fill(255);
noStroke();
quad(188,0,216,0,268,38,244,37);
quad(351,0,372,0,391,39,376,39); 

noFill();
stroke(1,7,0);
strokeWeight(1);
line(0,344,52,325);
line(52,325,53,184);
line(22,269,150,236);
line(150,236,153,127);

strokeWeight(2);
line(0,44,500,32);
stroke(75,75,67);
curve(189,45,189,70,500,88,500,83);
line(187,99,500,104);
line(0,144,185,173);
bezier(186,173,
       107,280,
       270,340,
       500,356);
    
bezier(58,40,
       -35,80,
       21,210,
       500,386);

strokeWeight(3);       
stroke(45,108,126);
line(446,0,500,18);

/* Accents */
strokeWeight(13);
stroke(71,102,86);
point(20,16);
line(9,30,48,17);

strokeWeight(12);
stroke(161,50,57);
line(43,82,73,94);
line(224,157,256,160);

stroke(152,126,93);
line(275,333,276,332);
line(277,330,321,305);

strokeWeight(8);
stroke(35,78,156);
line(322,147,334,146);

fill(255);
noStroke();
triangle(445,259,458,259,454,282);

strokeWeight(5);
stroke(0,0,255);
stroke(0,255,0);
stroke(0,255,255);
stroke(255,255,0);
stroke(255,0,255);


