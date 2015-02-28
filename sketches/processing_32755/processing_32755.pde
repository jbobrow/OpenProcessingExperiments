
//Elie Kahwaji
//N00188326
//Transverse Line by Kandinsky

size (800,550);
background (217,203,171);
smooth();

noStroke();
fill (250,220,130);
beginShape(); //big yellow triangle
  vertex(260,13); 
  vertex(350,490);
  vertex(652,260);
endShape(CLOSE);

fill (110,71,39);
ellipse (365,300,61,80); //brown ellipse
fill (202,31,19);
beginShape(); //red triangle in ellipse
  vertex(340.7,275.7); 
  vertex(395,292);
  vertex(350.4,335);
endShape(CLOSE);

fill (217,203,171);
ellipse (333,164,76.5,74.5); //concentric circles
fill (0);
ellipse (333,164,50,48);
fill (217,203,171);
ellipse (333,164,35,34);
fill (0);
ellipse (333,164,16,16); 

fill (47,46,89);
ellipse (134,166,100,90); //blue ellipse
fill(46,117,41);
ellipse(144,192,14,14);//small green circle
fill(240,59);
ellipse(167,165,8,8.5); //small red circle
fill(208,140,108);
ellipse(107,177,5.5,5.5); //small pink circle
fill(234,200,0);
ellipse(124,161,9.5,9.5); //small yellow circle
fill(119,147,110);
ellipse(104,149,6,5.5); //small gray circle
fill(131,134,163);
ellipse(149,147,5.5,5.5); //small lavender circle
fill(231,208,106);
ellipse(141,133,7,7); //small yellowish circle

fill (217,68,27); //orange triangle top center
beginShape(); 
  vertex(384,46); 
  vertex(377,100);
  vertex(442,94);
endShape(CLOSE);

fill (105,71,39);
beginShape(); //brown quadrilateral
  vertex(202,199); 
  vertex(21,285);
  vertex(102,528);
  vertex(348,227);
endShape(CLOSE);

fill (217,203,171);
beginShape(); //quadrilateral on top of brown one
  vertex(95,251); 
  vertex(49,371);
  vertex(177,436);
  vertex(253,254);
endShape(CLOSE);

strokeWeight(3);
stroke(235,110,20);
fill(39,73,50); //green ellipse inside quadrilateral
ellipse(134,338,48,73);

noFill();
noStroke();

fill (44,78,36);
beginShape(); //green quadrilateral in yellow triangle
  vertex(331,393); 
  vertex(297.5,416);
  vertex(322.5,489);
  vertex(344,462);
endShape(CLOSE);
fill (90,100,130);
beginShape(); //blue-gray quadrilateral in yellow triangle
  vertex(331,393); 
  vertex(360,372);
  vertex(392,404);
  vertex(344,462);
endShape(CLOSE);

fill (235,110,20);
ellipse (720,483,25,37); //small orange ellipse bottom right

fill (25,19,24);
ellipse (637,245,298,298); //big circle

fill (217,203,171);
ellipse (744,334,338,316); //semi circle in background color

noFill ();
strokeWeight (4);
stroke (25,19,24);
ellipse (637,245,298,298); //big circle outline

fill (217,203,171);
stroke(10);
strokeWeight(1.5);
beginShape(); //weird shape on top of circle
  vertex(512,358); 
  vertex(492,317);
  vertex(537,300);
  vertex(538,281);
  vertex(517,275);
  vertex(523,215);
  vertex(699,314);
  vertex(687,331);
endShape(CLOSE);

noStroke();
fill (235,110,20);
ellipse (720,483,25,37); //small orange ellipse bottom right

noStroke();
fill (235,110,20);
ellipse (650,30,40,40); //orange circle

stroke(0);

strokeWeight(2);
fill (245,230,200);
beginShape(); //white gridded trapeze
  vertex(143,43); 
  vertex(175,5);
  vertex(258,40);
  vertex(180,127);
endShape(CLOSE);
line(152.7,31.4,195.7,109.5);
line(160.9,21.7,211.4,91.9);
line(164.7,17.2,226,75.6);
line(170.4,10.4,244,55.5);
line(147.9,54,187.7,10.3);
line(153.7,67.3,200.5,15.7);
line(159.9,81.5,213.4,21);
line(165.4,94,226.8,26.8);
line(172,108.9,243,33.6);

noFill();
stroke(0);

line (276,66,305,96); //triple hashed line
line (273,69,302,99);
line (271,72,298,101);

strokeWeight(2);
line (230,103,298,14);

strokeWeight(3);
line (62,92,467,12);

strokeWeight(5);
line (74,230,208,115);

strokeWeight(1.5);
line (196,209,461,70);

strokeWeight(4.5);
line (67,535,685,5);

strokeWeight(7);
line (635,5,670,80);

strokeWeight(3); //zigzaz line
line (265,77,293,106);
line (293,106,244,135);
line (244,135,577,511);

strokeWeight(6);
stroke(216,63,6);
bezier(55,143,28,125,46,82,105,124);
bezier(105,124,163,166,175,181,197,233);

stroke(0);
bezier(264,77,165,139,298,448,412,496);

strokeWeight(3);
bezier(359,260,364,183,427,113,532,105);

strokeWeight(2);
bezier(382,372,383,326,420,190,484,150);

strokeWeight(6);
stroke(67,55,103);
bezier(484,366,471,436,486,461,536,474);
bezier(536,474,587,486,628,420,622,366);

strokeWeight(3);
stroke(0);
bezier(482,371,471,441,486,466,536,479);
bezier(536,479,587,491,628,425,624,366);

strokeWeight(1.8);
bezier(392,76,399,50,435.5,30.5,471,23.5);
bezier(396,77.5,413,39,459,27,480,32.5);
bezier(401,78.5,416,55,440,44,482,49);

strokeWeight(8);
stroke(235,110,20);
bezier(600.5,254.5,639.5,207,676.5,176,759,180);

strokeWeight(10);
stroke(0);
bezier(471.6,514.3,416.8,482.5,402,429.5,430.3,400.3);
bezier(430.3,400.3,466,363.5,501.6,424,536.3,424.6);
bezier(536.3,424.6,580.5,425.5,557.5,391,568.3,360.3);
bezier(568.3,360.3,580.5,326,734.5,332,783,420.3);

//my signature
fill(0);
PFont adobe;
adobe = loadFont("AdobeFanHeitiStdBold32.vlw");
textFont(adobe,13);
text("Kandinsky by Kahwaji",584,513);

