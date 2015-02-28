
void setup(){
  size(500,600);
  background(238,233,233);
 // background tried to do something with the red in the backgroun
//but i think it made it look worse
/*
noSmooth();
 int counter2 = 0;
  while (counter2 < 800) {
    strokeWeight(1);
    stroke(244-random(20), 164-random(15), 96-random(15));
   fill(244-random(20), 164-random(15), 96-random(15));
    float r = random(3);
    ellipse(random(0,500), random(0,600), r, r);
    rect(random(0,500),random(0,600),r,r);
   

    counter2 = counter2+1;
  }
  noFill();
   int counter = 0;
  while (counter < 40) {
    strokeWeight(random(3));
    stroke(244-random(-10,10), 164-random(-30,30), 96-random(-30,30));
    arc(344,0,random(30,200),random(0,125), 0, PI);
    
    
   counter=counter+1;
  }
  smooth();*/
 

 stroke(0);
 strokeWeight(1);
 fill(0);
 triangle(0,0,0,180,180,0);
 
 //sun and moon
 fill(0,0,128);
 stroke(0);
 strokeWeight(14);
 ellipse(103,107,162,162);
 
 fill(255,140,0);
 strokeWeight(1);
 beginShape();
 curveVertex(36,132);
 curveVertex(36,132);
 curveVertex(32,95);
 curveVertex(53,56);
 curveVertex(90,34);
 curveVertex(132,32);
 curveVertex(136,38);
 curveVertex(134,43);
 endShape();

 
 
 fill(0);
 triangle(360,231,389,104,321,104);
 triangle(398,94,483,34,483,12);
 
//flying comb
noStroke();
fill(45,170,154);
beginShape();
vertex(218,175);
vertex(205,163);
vertex(135,212);
vertex(139,220);
vertex(159,205);
vertex(177,199);
vertex(173,194);
vertex(176,191);
vertex(180,197);
vertex(183,194);
vertex(180,190);
vertex(183,193);
vertex(189,190);
vertex(186,186);
vertex(189,184);
vertex(192,189);
vertex(193,189);
vertex(196,188);
vertex(192,183);
vertex(195,181);
vertex(199,185);
vertex(201,185);
vertex(198,179);
vertex(201,177);
vertex(205,182);
vertex(209,180);
vertex(205,172);
vertex(206,172);
vertex(210,178);
endShape();
 
 //wave at bottom
  //1st black
 fill(0);
 stroke(0);
 strokeWeight(15);
 beginShape();
 vertex(0,548);
 vertex(0,530);
 vertex(32,506);
 vertex(96,576);
 endShape();
 triangle(59,572,126,532,178,584);
 triangle(123,593,214,540,321,600);
 //white triangle
 fill(255);
 stroke(255);
 strokeWeight(4);
 beginShape();
 vertex(0,575);
 vertex(0,552);
 vertex(32,527);
 vertex(100,598);
 endShape();

 
 triangle(39,600,124,552,187,600);
 triangle(126,600,215,562,295,600);
 //second black
 fill(0);
 stroke(0);
 strokeWeight(1);
 beginShape();
 vertex(0,600);
 vertex(0,573);
 vertex(31,548);
 vertex(76,600);
 endShape();
 triangle(73,600,120,571,171,600);
 triangle(170,600,209,578,262,599);
 //blue
 strokeWeight(1);
 fill(176,196,222);
 triangle(0,600,33,571,56,600);
 triangle(91,600,122,584,152,600);
 triangle(195,600,214,589,235,600);
 
 //sunflower looking thing
noStroke();
 translate(399,400);
rotate(-PI/14);
fill(255,153,0);
ellipse(0,0,156,120);
strokeWeight(15);
fill(0);
ellipse(0,0,130,94);
  rotate(PI/14);
  translate(-399,-400);
//no fill triangle
noFill();
stroke(0);
strokeWeight(1);
triangle(348,379,302,337,360,366);
triangle(449,371,485,356,457,383);
  
  //23.6 and 26 checkerboard
  strokeWeight(1);
  fill(0);
 rect(382,417,118,104);
 fill(255);
 rect(382,417,23.6,26);
 rect(382,469,23.6,26);
 rect(405.6,443,23.6,26);
 rect(405.6,495,23.6,26);
 rect(429.2,417,23.6,26);
 rect(429.2,469,23.6,26);
 rect(452.8,443,23.6,26);
 rect(452.8,495,23.6,26);
 rect(476.4,417,23.6,26);
 rect(476.4,469,23.6,26);
 
 //redness nex tto long rectangle
 fill(223,112,153);
 noStroke();
 arc(250,306,96,36,0,PI/2);
 triangle(299,236,299,306,171,304);
 
//stupid long rectangle under sun
stroke(0);
fill(255);
rect(0,265,251,64);
//rect under sun 1st section
fill(176,196,222);
rect(0,265,53,18);
fill(95,158,160);
triangle(10,299,23,329,37,299);
//rect under sun 2nd section
rect(53,283,15,16);
fill(255);
line(53,330,53,265);

fill(220,82,0);
rect(68,265,15,18);
rect(68,299,15,30);
//light green square
fill(153,255,153);
rect(83,265,14,18);
//dark red square
fill(204,0,0);
rect(83,283,14,16);
//brown square
fill(102,51,0);
rect(83,299,14,30);
//deep aqua square
fill(51,255,153);
rect(97,283,19,16);
fill(255);
line(116,330,116,265);

//rect under sun 3rd section
//light blue
fill(176,196,222);
rect(116,265,108,18);
//deep aqua
fill(51,255,153);
rect(224,265,27,18);
//brown
fill(102,51,0);
rect(192,283,32,47);
//light blue
fill(153,255,153);
rect(116,299,49,31);
//dark red
fill(204,0,0);
rect(105,309,44,21);
//tan
fill(204,204,102);
rect(105,330,22,31);
//brown
fill(102,51,0);
rect(127,330,22,31);

//lines under long rectangle
fill(0);
stroke(0);
strokeWeight(2);
line(128,328,128,442);
line(114,377,140,391);
strokeWeight(3);
line(120,394,133,400);

//trapezoid looking
fill(45,164,164);
noStroke();
rect(199,387,10,35);
stroke(0);
strokeWeight(1);
fill(178,34,34);
beginShape();
vertex(143,417);
vertex(168,394);
vertex(223,423);
vertex(170,445);
endShape();

beginShape();
fill(255,140,0);
vertex(142,446);
vertex(136,431);
vertex(148,425);
vertex(160,436);
endShape();

fill(139,0,0);
beginShape();
vertex(148,425);
vertex(171,415);
vertex(170,429);
vertex(160,436);
endShape();

//heart looking section/////////////
fill(200,0,0);
noStroke();
ellipse(204,206,28,30);

fill(110,0,0);
arc(268,236,144,153,9*PI/8,3*PI/2);
fill(94,149,181);
translate(226,225);
rotate(PI/8);
ellipse(0,0,60,38);
rotate(-PI/8);
translate(-226,-225);

fill(110,0,0);
ellipse(295,192,78,85);
//red shape and circle on top
beginShape();
vertex(270,138);
vertex(277,133);
vertex(294,157);
vertex(270,162);
endShape();
//white rectangle
fill(255);
rect(263,149,9,78);
//weird red shovel looking
fill(200,0,0);
beginShape();
vertex(261,163);
vertex(257,145);
vertex(266,138);
vertex(265,112);
vertex(271,112);
vertex(272,139);
vertex(279,148);
endShape();
//red ellipse
ellipse(298,191,20,20);


//yellow half circele
stroke(0);
fill(255,153,0);
beginShape();
curveVertex(214,265);
curveVertex(214,265);
curveVertex(226,238);
curveVertex(255,222);
curveVertex(284,226);
curveVertex(297,235);
curveVertex(297,235);
endShape();

noStroke();
triangle(214,265,245,265,289,237);

//red trapezoid
noStroke();
fill(130,0,0);
beginShape();
vertex(95,243);
vertex(108,225);
vertex(126,231);
vertex(118,254);
endShape();

 //arc black line
 noFill();
 stroke(0);
 strokeWeight(3);
 arc(231,202,358,92,PI/2,7*PI/8);
 arc(90,247,30,78,PI,3*PI/2);
//random blue rectangle
noStroke();
fill(95,158,160);
rect(465,290,17,20);
//random blue circle
ellipse(249,364,27,27);
//random line going diagonally in the middle of this freaking painting
stroke(0);
strokeWeight(7);
 line(0,396,329,220);
strokeWeight(4);
line(311,232,401,232);
strokeWeight(2);
line(401,232,401,317);

//watermelon looking flower thing
strokeWeight(13);
fill(0);
arc(132,459,70,70,PI/6,4*PI/3);
strokeWeight(3);
stroke(130,10,0);
fill(130,10,0);
arc(128,463,50,50,PI/6,4*PI/3);

strokeWeight(1);
stroke(0);
fill(0);
triangle(68,538,122,475,80,550);
line(122,475,142,446);

translate(112,478);
rotate(PI/4);
strokeWeight(5);
fill(45,164,164);
ellipse(0,0,35,15);
rotate(-PI/4);
translate(-112,-478);

//arc
noFill();
strokeWeight(6);
arc(73,490,90,80,7*PI/6,11*PI/6);
strokeWeight(5);
arc(200,475,180,70,PI/4,5*PI/6);
strokeWeight(3);
line(43,415,60,465);
line(64,410,67,459);
line(85,412,75,462);
strokeWeight(4);
line(194,491,195,522);
line(233,494,238,519);  

stroke(220,43,67);
strokeWeight(2);
fill(220,43,67);
beginShape();
vertex(165,450);
vertex(165,484);
vertex(170,484);
vertex(170,452);
endShape();
rect(288,405,12,12);


  
}

