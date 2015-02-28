
size (640,480);
background (249,259,252);
smooth();


//lines
line(0,53,125,0);
line(0,100,240,0);
stroke(3);

noStroke();

//lef black box
fill(0);
beginShape();
vertex(45, 0);//1
vertex(97, 0);
vertex(89, 31);
vertex(108, 37);
vertex(95,86);
vertex(103,88);
vertex(93,130);
vertex(114,134);
vertex(112,145);
vertex(120,147);//10
vertex(118,159);
vertex(109,157);
vertex(106,163);
vertex(115,165);
vertex(104,206);//15
vertex(94,205);
vertex(89,224);
vertex(102,230);
vertex(94,267);
vertex(38,253);
vertex(41,244);
vertex(0,236);
vertex(0,120);
vertex(9,76);
vertex(23,80);//25

endShape(CLOSE);

// left box dark offblue

fill(49,79,115);
beginShape();
vertex(0,289);
vertex(9,287);
vertex(19,320);
vertex(0,324);

endShape();


//bluU CURVE
fill(25,45,110);
triangle(640,0,640,297,306,0);
curve(638, 0, 326, 1 , 638 , 295, 600, 248);










//Red shape
fill(202,0, 22);
beginShape();
 vertex(174,45);//1
 vertex(217,0);
 vertex(240,0);
 vertex(245,6);
 vertex(234,17);//5
 vertex(328,108);
 vertex(344,93);
 vertex(377,128);
 vertex(384,122);
 vertex(414,151);//10
 vertex(427,136);
 vertex(436,140);
 vertex(440,135);
 vertex(450,145);//15
 vertex(449,156);
 vertex(455,149);
 vertex(486,177);
 vertex(477,186);
 vertex(495,202);//20
 vertex(505,192);
 vertex(532,217);
 vertex(495,256);
 vertex(488,250);
 vertex(453,285);//25
 vertex(433,266);
 vertex(419,281);
 vertex(411,276);
 vertex(404,286);
 vertex(390,276);
 vertex(388,279);
 vertex(355,248);
 vertex(361,240);
 vertex(382,259);
 vertex(389,254);
 vertex(327,196);
 vertex( 337,185);
 vertex(220,73);
 vertex(216,79);
 vertex(202,65);
 vertex(207,60);
 vertex(198,51);
 vertex(190,58);
 
 //end red shape
 
 



   
   

 
 

endShape();

fill(0);
//black shape bottom
quad(353,454,
    390,408,
    420,480,
    365,480);


//off blue shape
fill(49,79,115);
beginShape();
vertex(336,440);
vertex(406,395);
vertex(415,429);
vertex(345,462);
endShape();


fill(202,0, 22);
//red box small
quad(356,470,388,457,399,475,366,500);
//thin blue strip
fill(49,79,115);

beginShape();
endShape();

//small blue box
fill(51,54,6);
quad(358,476,371,473,376,480,359,480);

//lines 
stroke(63,89,124);
strokeWeight(6);
strokeJoin (SQUARE);
line(373,465,381,478);







//blue (31,41,110)
//red (202,0, 22)
//black (255)
//white (249,259,252)
//offblue (63,89,124)
//darkoffblue (49,79,115)
//darkred (49,64,98)




