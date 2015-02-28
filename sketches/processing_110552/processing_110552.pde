
size(253,309);
background(239,231,214);

////-------------------//-------------------red rect.

noStroke();
fill(217,52,5);
rect(0,78,309,110);

////-------------------//-------------------red rect. white design

stroke(239,231,214);
strokeWeight(1);

line(7,79,12,94);
line(12,94,30,80);
line(30,80,39,92);
line(42,86,46,92);
strokeWeight(1.5);
line(52,90,67,75);
strokeWeight(1);
line(163,95,177,78); 
line(179,76,194,96); 
line(198,95,240,50); 
line(217,82,229,100); 
line(232,99,247,82);
line(248,86,253,108);
line(177,93,177,100);
line(196,80,196,85);
line(199,78,199,87);
line(211,92,211,100);
line(217,91,217,100);
line(230,80,230,94);
line(24,90,26,100);
line(28,90,30,99);


////-------------------//-------------------green rectangle

noStroke();
fill(120,185, 152);
rect(0,105,253,309);

////-------------------//-------------------pointed red shape 

fill(217,52,5);
noStroke();
beginShape();
vertex(11,0);
vertex(23,38);
vertex(30,0);
endShape();
fill(217,52,5);
beginShape();
vertex(35,0);
vertex(45,60);
vertex(59,20);

vertex(70,84);
vertex(85,40);
vertex(93,71);

vertex(106,38);
vertex(113,38);
vertex(117,54);
vertex(122,54);

vertex(134,20);
vertex(147,47);
vertex(160,12);

vertex(177,47);
vertex(190,30);
vertex(203,69);

vertex(212,50);
vertex(226,80);
vertex(241,37);

vertex(252,55);
vertex(width, 0);
endShape();

////-------------------//-------------------white lines on red pointed shape 

strokeWeight(1);
stroke(239,231,214);
line(44,0,46,31);
line(60,1,60,13);
line(68,1,71,58);
line(71,58,76,18);
line(92,18,92,54);
line(94,59,100,19);
line(118,27,119,43);
line(121,26,121,34);
line(143,17,144,27);
line(146,17,147,29);
line(171,11,177,29);
line(177,8,179,30);
line(199,15,200,45);
line(205,18,206,47);
line(218,39,219,62);
line(225,32,226,62);
line(210,0,210,7);
line(218,0,218,11);
line(234,0,234,14);
line(241,0,241,11);
line(237,7,237,15);
line(247,15,252,45);

////-------------------//-------------------lines on green rect. #1

noStroke(); //dots in between lines
fill(20);
ellipse(230,193,9,10);
ellipse(246,193,9,10);

stroke(0); //horizontal/decorative lines on green rect. #1
strokeWeight(3);
line(242,222,252,222);
line(234,205,252,205);
line(219,182,252,181);
line(230,158,252,158);
line(216,140,232,140);

strokeWeight(4);
stroke(0);
line(238,139,251,138);
line(204,132,227,133);

strokeWeight(4);
stroke(0);
line(234,131,252,131);

strokeWeight(4);
stroke(0);
line(0,128,18,128);
line(3,137,19,136);
line(4,145,7,152);

////-------------------//-------------------red rect. black line

strokeWeight(6);
stroke(0);
line(0,101,252,105);


////-------------------//-------------------green shape #2
fill(104,173, 145);
strokeWeight(2.5);
stroke(54,102,74);
beginShape();
vertex(0,163);
vertex(80,88);
vertex(110,86);
vertex(140,61);
vertex(168,113);
vertex(219,183);
vertex(253,239);
vertex(253,309);
vertex(0,309);
endShape();

stroke(4);
line(219,181,252,239); //diagonal line hugging rect. #2

//-------------------//------------------- book 

fill(231,231,214);
stroke(45,68,42);
strokeWeight(2.5);
beginShape();
curveVertex(1,308);
curveVertex(1,308);
curveVertex(0,258);
curveVertex(12,223);
curveVertex(15,217);
curveVertex(19,214);
curveVertex(22,203);
curveVertex(27,200);
curveVertex(30,179);
curveVertex(46,148);
curveVertex(61,131);
curveVertex(78,99);
curveVertex(83,86);
curveVertex(85,71);
curveVertex(93,72);
curveVertex(98,77);
curveVertex(126,87);
curveVertex(155,105);
curveVertex(187,126);
curveVertex(214,143);
curveVertex(229,154);
curveVertex(230,161);
curveVertex(217,185);
curveVertex(204,208);
curveVertex(180,260);
curveVertex(170,272);
curveVertex(165,283);
curveVertex(165,296);
curveVertex(157,308);
curveVertex(161,302);
endShape();

//-------------------//------------------- crease line

strokeWeight(1);
stroke(99,96,63);
line(28,201,167,271);

//-------------------//------------------- music lines

strokeWeight(1);
stroke(116,123,93);
line(198,160,157,243);
line(192,149,148,239);
line(186,145,140,240); // right page bottom set 

line(156,124,115,214);
line(145,123,104,211);
line(138,119,96,206); //right page middle set 

line(116,115,75,202);
line(111,108,71,190);
line(108,101,61,193); //right page top set 

line(143,296,136,308); 
line(132,288,121,309);
line(127,279,112,308); //left page bottom set

line(95,270,78,308);
line(79,287,70,308);
line(85,262,62,308); //left page middle set 

line(53,251,29,301);
line(47,243,22,302);
line(39,245,17,293); //left page top set 


//-------------------//------------------- music notes



//-------------------//-------------------white circle around orange

noStroke();
fill(235,217,170);
ellipse(208,240,63,59);

//-------------------//-------------------red circle

noStroke();
fill(217,52,5);
ellipse(208,240,57,52);
noStroke();
fill(0,0,0);
ellipse(209,225,4,4);
