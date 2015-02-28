
size(480,480);
smooth();
stroke(0);
//LARGE ROBOT - PART ONE
//Detached head
fill(180,148,148,200);
strokeWeight(15);
rect(19,-10,76,57);
//Mouth of detached head
fill(255,231,150,200);
strokeWeight(3);
rect(45,25,35,9);
strokeWeight(1);
line(48,25,48,34);
line(50,25,50,34);
line(52,25,52,34);
line(54,25,54,34);
line(56,25,56,34);
line(58,25,58,34);
line(60,25,60,34);
line(66,25,66,34);
line(68,25,68,34);
line(70,25,70,34);
line(72,25,72,34);
line(74,25,74,34);
line(76,25,76,34);
line(78,25,78,34);
//left "eye"
strokeWeight(1.7);
fill(239,56,252,50);
rect(35,5, 15,6);
//right "eye"
rect(70,5,15,6);
//Neck on detached head
strokeWeight(3);
rect(40,55,40,10);
rect(40,65,40,10);
//Detached wires on detached head (from left to right)
noSmooth();
strokeWeight(0.5);
stroke(252,20,20,255);
//1st wire
line(48,56,33,77);
line(33,77,39,90);
line(39,90,30,93);
//2nd wire
line(63,56,67,58);
line(67,58,63,82);
line(63,82,70,84);
//3rd wire
line(78,56,75,70);
line(75,70,75,94);
line(75,94,70,97);
line(70,97,72,99);

//LARGE ROBOT - PART TWO
//Headless body
smooth();
stroke(0);
strokeWeight(33);
fill(180,148,148,200);
rect(303,160,250,380);
//Neck on headless body
strokeWeight(10);
fill(239,56,252,50);
rect(440,120,70,30);
rect(440,90,70,30);
//Detached wires on detached body (from left to right)
noSmooth();
strokeWeight(1.5);
stroke(252,20,20,150);
//1st wire
line(450,144,442,130);
line(442,130,457,120);
line(457,120,455,88);
line(455,88,433,60);
//2nd wire
line(465,144,465,115);
line(465,115,470,84);
line(470,84,472,75);
line(472,75,457,76);
line(457,76,458,65);
//3rd wire
line(490,120,473,100);
//Arm
smooth();
strokeWeight(19);
stroke(0);
line(444,231,403,475);

////Epulet (turned off for now)
//strokeWeight(9);
//stroke(114,127,83,255);
//fill(114,127,83,125);    //same color as task06
//triangle(297,154,403,1,295,367);

//REPAIR UNIT
//repair unit - left claw
strokeWeight(5);
strokeJoin(ROUND);
stroke(193,181,183,200);
fill(31,29,31,255);
beginShape();
vertex(60,100);
vertex(50,120);
vertex(75,120);
vertex(70,100);
endShape();
//repair unit - left arm
strokeWeight(3);
fill(31,29,31,255);
ellipse(62.5,128,30,9);
ellipse(62.5,128,29,8);
ellipse(63,137,30,9);
ellipse(63.5,146,30,9);
ellipse(64,155,30,9);
ellipse(64.5,164,30,9);
ellipse(65,173,30,9);
ellipse(70,182,30,9);
ellipse(75.5,191,30,9);
ellipse(80,200,30,9);
ellipse(80.5,209,30,9);
ellipse(81,218,30,9);
ellipse(81.5,227,30,9);
ellipse(88,236,30,9);
ellipse(88.5,245,30,9);
ellipse(89,254,30,9);
ellipse(95,263,30,9);
ellipse(95.5,272,30,9);
//repair unit - right claw
strokeWeight(7);
strokeJoin(ROUND);
stroke(193,181,183,200);
beginShape();
vertex(430,110);
vertex(400,85);
vertex(400,126);
vertex(425,127);
endShape();
//repair unit - right arm
strokeWeight(4);
fill(31,29,31,255);
ellipse(390,107,10,44);
ellipse(380,107,9,43);
ellipse(370,107,8.5,42.5);
ellipse(360,107,8,42);
ellipse(350,107,7.5,41.5);
ellipse(340,107,7,41);
ellipse(330,107,6.5,40.5);
ellipse(320,107,6,40);
ellipse(315,107,5.5,39.5);
ellipse(310,107,5.5,39.5);
//ellipse(300,107,6,40);
//ellipse(290,107,6.5,40.5);
//ellipse(280,107,7,41);
//ellipse(270,117,7,41);
strokeWeight(3);
ellipse(235,200,30,9);
ellipse(234,209,30,9);
ellipse(233,218,30,9);
ellipse(226,227,30,9);
ellipse(225,236,30,9);
ellipse(224,245,30,9);
ellipse(223,254,30,9);
ellipse(220.5,263,30,9);
ellipse(220,272,30,9);  
//hose connector
fill(52,75,36,200);
beginShape();
vertex(220,200);
vertex(220,87);
vertex(310,87);
vertex(310,117);
vertex(250,127);
vertex(250,200);
endShape(CLOSE);
//repair unit body
stroke(133,152,120,150);
//noStroke();
fill(31,29,31,255);
ellipse(160,290,145,70);
ellipse(160,330,140,65);
ellipse(160,370,135,60);
strokeWeight(1);
stroke(130);
ellipse(62.5,129,28,8);
//red cross
strokeWeight(35);
stroke(252,3,40,255);
line(160,295,160,355);
line(115,325,202,325);
//belt
strokeWeight(15);
strokeCap(ROUND);
stroke(133,152,120,150);
line(87,325,232.5,325);

