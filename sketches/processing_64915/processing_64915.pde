
size(640,360);
background(237,228,208);
smooth();

//black,1
noStroke();
fill(35,24,24);
beginShape();
vertex(174,19);
vertex(263,0);
vertex(313,0);
vertex(318,21);
vertex(181,51);
endShape();

//blue,2,3
noStroke();
fill(33,35,59);
quad(7,185,112,161,131,232,26,256);

stroke(170,170,170);
strokeWeight(0.5); 
strokeJoin(BEVEL);
fill(227,215,196);
quad(41,136,146,114,112,161,7,185);


//black ,4
fill(99,81,73);
quad(324,234,370,265,377,312,332,277);

fill(233,222,194);
quad(370,265,377,312,382,309,375,264);

//5
fill(233,222,194);
quad(291,295,407,252,407,244,291,284);

fill(70,62,57);
quad(291,295,291,284,240,247,238,254);


fill(217,191,179);
quad(291,284,407,244,363,211,240,248);

//6
noFill();
stroke(101,165,204);
strokeWeight(49);
strokeCap(SQUARE);
arc(155,-93,520,520,0.06*PI,0.24*PI);



//7
noFill();
stroke(209,201,179);
strokeWeight(40);
strokeCap(SQUARE);
arc(155,-93,500,500,0.04*PI,0.22*PI);



//light blue,8
noStroke();
fill(101,165,204);
quad(67,65,296,10,351,242,123,298);

//red,9
noStroke();
fill(241,22,22);
quad(0,211,199,159,213,217,0,269);

//10
noFill();
stroke(241,22,22);
strokeWeight(35);
strokeCap(SQUARE);
arc(131,-103,510,510,0.15*PI,0.42*PI);


//circle,11
fill(32,30,31);
noStroke();
ellipse(140,292,156,156);


//12
fill(232,201,147);
noStroke();
quad(640,158,640,193,456,40,481,28);

fill(111,96,69);
noStroke();
quad(456,40,481,28,480,22,457,33);


fill(180,135,69);
noStroke();
quad(481,28,480,22,640,153,640,158);


//13
fill(44,39,36);
noStroke();
quad(423,121,423,112,428,116,428,124);

fill(226,230,203);
stroke(170,170,170);
strokeWeight(0.5);
quad(423,112,428,116,638,82,633,78);

fill(241,22,22);
noStroke();
quad(428,116,638,82,640,90,428,124);

//14
fill(79,70,63);
noStroke();
beginShape();
vertex(242,193);
vertex(244,200);
vertex(640,108);
vertex(640,101);
endShape();

//15
fill(237,228,208);
stroke(170,170,170);
strokeWeight(0.3);
quad(138,232,140,240,485,160,483,153);

fill(241,22,22);
noStroke();
quad(140,240,485,160,484,164,143,243);


//16
fill(241,237,223);
noStroke();
quad(363,229,367,232,367,235,364,234);

fill(241,22,22);
noStroke();
quad(367,232,367,235,441,217,441,214);


fill(241,237,223);
stroke(170,170,170);
strokeWeight(0.5);
quad(367,232,441,214,438,212,363,229);

//18
fill(241,22,22);
noStroke();
quad(97,250,109,255,66,360,55,360);

fill(226,230,203);
stroke(170,170,170);
strokeWeight(0.5);
quad(97,250,109,255,131,246,120,241);

fill(226,230,203);
stroke(170,170,170);
strokeWeight(0.5);
quad(109,255,66,360,87,360,131,246);



//red triangle,17
fill(241,22,22);
noStroke();
beginShape();
vertex(409,290);
vertex(447,360);
vertex(490,360);
vertex(640,267);
vertex(640,258);
endShape();


//18
fill(191,194,189);
noStroke();
quad(30,328,34,343,178,310,175,295);


//19
fill(232,194,93);
noStroke();
beginShape();
vertex(54,323);
vertex(124,308);
vertex(128,328);
vertex(148,323);
vertex(139,285);
vertex(51,302);
endShape();

