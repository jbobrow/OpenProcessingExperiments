
size (640,480);
background (221,218,185);
smooth();

//background curve
noStroke();
fill(189,201,168);
beginShape();
vertex(511.666,22.999);
bezierVertex(511.666,22.999,457.666,6.999,323.666,8.999);
vertex(322.333,88.332);
bezierVertex(322.333,88.332,327.666,82.999,451,99.666);
endShape();

//background lines
noFill();
stroke(0);
strokeWeight(4);
bezier(280,480,280,480,283.5,478.5,286.5,470.75);
strokeWeight(1.7);
bezier(293,479.969,293,479.969,296.115,475.375,295.042,465.436);
strokeWeight(3.5);
bezier(313,474,313,474,303,474,301,465.436);
strokeWeight(2);
bezier(321,464.5,321,464.5,315,471.5,308.5,462);
strokeWeight(.25);
line(485,0, 481.125,60.875);
line(444,0,444.5,102);
line(464.25,79.75,410,92);
line(404.5,0,408,144);
line(389,0,370.5,32.5);
line(366.5,0,367.5,171.5 );
line(361,0,362,151);
line(323.5,27.5,367.5,52.25);
bezier(436,112.75,436,112.75,417.5,93.25,360.5,55.75);
line(326.5,75.5,347.5,84.5);
line(326.5,152.5,363,154);
bezier(338.5,202.5,338.5,202.5,373,200.5,363,154);
line(258,166,258,188.333);
line(212.5,197.5,212,311);
line(152,207.5,188.5,207);
line(188.5,207,188.5,326);
line(175.5,222.5,175,319);
line(175,319,133.5,319);
line(136.5,225,137.5,269.5);
line(137.5,269.5,187.5,268.5);
line(124.333,236.333,229.5,236.5);
line(148.5,281,148.5,325.5);
line(386,152,386.25,166);
line(334,455,334.5,height);
line(616.5,370.5,616.5,313);
line(446.5,415,582.5,414.5);
line(582.5,414.5,583,335.5);
line(467.5,403.5,510.5,408);
line(510.5,408,499.5,386.5);
line(503.5,425.5,580,423.5);
line(590.5,423,width,423);
line(width,467,625.5,height);
line(550,371.5,616.5,370.5);
line(576.5,340.5,604.5,349);
line(604.5,349,602.5,322);
line(606.5,322,626.5,330);
bezier(452,0,452,0,470,7,520,12);
strokeWeight(2.5);
line(605,403.5,591,416.584);
//bezier(594,413,594,413,604,409.5,605,401.5);

//sunburst
strokeCap(ROUND);
stroke(0,80);
strokeWeight(2);
line(91.5,267.5,94,280.5);
line(133,263.5,124.5,280);
line(160,241.5,130,280);
strokeWeight(2);
stroke(0,159);
line(118.5,258.5,110.5,280.);
line(129,257.5,116.5,279);
stroke(0,187);
strokeWeight(3.5);
line(166.333,248.334,130.333,287.667);
bezier(170.333,223,170.333,223,179,209.667,179,198);
line(107,255, 105.5,279.5);
strokeWeight(7);
bezier(521.5,0,521.5,0,513.5,4.5,513.5,19.5);

//right black squiggles
noStroke();
fill(0,187);
beginShape();
vertex(460.5,50);
bezierVertex(460.5,50,461.5,44.5,464.25,50);
bezierVertex(464.25,50,468.25,58,478.5,61.938);
vertex(475.25,66.25);
bezierVertex(475.25,66.25,461,60.5,460.5,50);
endShape(CLOSE);

beginShape();
curveVertex(498.5,46.25);
curveVertex(491.667,42.417);
curveVertex(488.25,35.25);
curveVertex(488.25,29.25);
curveVertex(491.667,23.5);
curveVertex(495.5,19.5);
curveVertex(500.5,19.5);
curveVertex(504.5,20.75);
curveVertex(508.75,23.5);
curveVertex(506.5,28.25);
curveVertex(502,26);
curveVertex(498.5,27.125);
curveVertex(495.5,30.75);
curveVertex(495.5,36.5);
curveVertex(499.915,43.46);
curveVertex(498.5,46.25);
endShape(CLOSE);



//brushstroke
noStroke();
fill(0,100);
beginShape();
curveVertex(333,159);
curveVertex(336,157.5);
curveVertex(340,158);
curveVertex(345,156);
curveVertex(346.667,152.667);
curveVertex(349,149.667);
curveVertex(351.5,147.5);
curveVertex(355.333,144.333);
curveVertex(360,142);
curveVertex(365.667,141.333);
curveVertex(370.667,139.667);
curveVertex(373,136);
curveVertex(377.667,131);
curveVertex(381.667,129);
curveVertex(381.667,131.667);
curveVertex(379,136.333);
curveVertex(377,141);
curveVertex(373,145.667);
curveVertex(367,149);
curveVertex(359,150.333);
curveVertex(354.333,153);
curveVertex(350.333,157);
curveVertex(347,160.333);
curveVertex(343,161.667);
curveVertex(337,161);
curveVertex(333,159);
endShape();

//black center quad
fill(38,39,41);
stroke(0);
strokeWeight(2);
quad(231.333,184.667,336.667,184,337.333,211.333,230.333,299.333);

//left gray curve
noStroke();
fill(180,187,178);
beginShape();
vertex(310,0);
bezierVertex(310,0,166,207,84.50,280.50);
vertex(0,276);
vertex(0,0);
endShape();

//middle gray curve
noStroke();
fill(180,187,178);
beginShape();
vertex(0,415.5);
bezierVertex(0,415.5,310.5,319,523.5,0);
vertex(width, 0);
vertex(width,297.50);
bezierVertex(width, 297.50, 476,426, 259, height);
vertex(0, height);
endShape();




//right gray curve
noStroke();
fill(180,187,178);
beginShape();
vertex(width,380.50);
bezierVertex(width, 380.50,581.50,433.50,499.50,461.50);
vertex(487.50,height);
vertex(width,height);
endShape();


// black quad top
fill(38,39,41);
stroke(0);
beginShape();
vertex(310,0);
vertex(326,0);
vertex(326,180);
vertex(251,166);
vertex(251,59);
endShape(CLOSE);

//top black diagonal
stroke(0);
strokeWeight(4);
line(0,145,width,80);

//blue quad
fill(42,71,132);
noStroke();
quad(154,55,318,62,228,201,90,195);

//bottom left graybrown
fill(160,154,135);
noStroke();
quad(25,325,156,325,153,435,21,431);

//red rect
noStroke();
fill(200,47,49);
quad(89,348,240,352,238,396,88,393);


//bottom black horizontal
noFill();
stroke(0);
strokeWeight(4);
bezier(575,450,575,450,261,462,0,458);

//bottom left blue
noStroke();
fill(42,95,167);
quad(82,419,97,441,97,height,82,height);
quad(110,439,124,419,124,height,110,height);


//left red Lshape
noStroke();
fill(199,47,49);
beginShape();
vertex(0,276);
vertex(133,280);
vertex(133,330);
vertex(46,330);
vertex(45,400);
vertex(0,399);
endShape(CLOSE);


//left ladder
stroke(4);
line(10,220,5,407);
line(54,214,50,409);
line(9,247,53,249);

//middle ladder
stroke(4);
line(250,198,245,411);
line(295,202,291,399);


//middle green triangle
noStroke();
fill(1,146,111);
triangle(264,228,316,191,317,262);

//right red Lshape
noStroke();
fill(202,47,50);
beginShape();
vertex(314,307);
vertex(459,310);
vertex(459,346);
vertex(355,341);
vertex(353,416);
vertex(313,415);
endShape(CLOSE);

//right ladder
stroke(4);
line(501,223,494,385);
line(549,232,545,384);

//big green triangle
noStroke();
fill(45,78,56);
triangle(448,223,525,53,563,230);

//yellowellipse
noStroke();
fill(243,206,55);
ellipseMode(RADIUS);
ellipse(606,225,63,30);



//white rect
noStroke();
fill(218,230,219,244);
quad(523,190,width,187,width,212,523,214);

//blue line
noFill();
stroke(15,67,155);
strokeWeight(6);
bezier(453.50,0, 453.50,0,289.50,90,0,178.50);


//black horizontal 2
noFill();
stroke(0);
strokeWeight(4);
bezier(347,269,347,269,295,278,0,281);

//black horizontal 3
bezier(width,252,width,252,588,248,471,261);

//black horizontal 4
bezier(width,340,width,340,413,363,0,367);

//blue rect
noStroke();
fill(87,120,174,244);
quad(524,239,width,237,width,260,524,263);

//orange circle left
noStroke();
fill(254,104,52);
ellipse(428,height,78,70);


//orange circle right
noStroke();
ellipse(width,height, 81,81);


//black lines over circle
noFill();
stroke(0);
strokeWeight(.25);
line(373,450,373,height);
line(390,420,389,height);
line(495.5,390,445.667,height);
line(411.5,height,616.5,370.5);
line(563.5,348.5,629, height);
line(583,423,width,423);
line(625.5,height,width,467);
line(550.75,355,628,389);

//right gray rect
noStroke();
fill(156,154,134);
quad(624,282,width,282,width,413,624,413);

//blue rect bottom right
noStroke();
fill(77,121,180);
quad(353,428,443,428,427,450,371,451);

//black dot 2
fill(0);
stroke(0);
ellipse(496.5,478.5,15,15);

//brown curve
noFill();
stroke(113,42,34);
strokeWeight(21);
strokeCap(ROUND);
bezier(455,494,455,494,537,466,533,358);
bezier(533,358,533,358,540,221,345.5,277.5);

//black vertical
noFill();
stroke(0);
strokeWeight(7);
bezier(269.50,height, 269.50, height, 444.50,249.50,424.50,0);

//yellow awk shape
noStroke();
fill(240,174,66);
beginShape();
curveVertex(92.5,344.5);
curveVertex(93,342);
curveVertex(93.5,337.5);
curveVertex(94.25,334.5);
curveVertex(96.5,331.5);
curveVertex(99.5,329);
curveVertex(102.5,334);
curveVertex(102,337.5);
curveVertex(100.5,341.5);
curveVertex(104,339.5);
curveVertex(109 ,339.5);
curveVertex(114,342.5);
curveVertex(117.5,348.5);
curveVertex(119,352);
curveVertex(119,354.75);
curveVertex(117.5,357.5);
curveVertex(120.5,362.5);
curveVertex(122.5,371);
curveVertex(123,376.5);
curveVertex(122,381.5);
curveVertex(117.5,384.5);
curveVertex(113.5,383.5);
curveVertex(118.5,380.5);
curveVertex(119.5,377);
curveVertex(120,372.5);
curveVertex(116.5,376);
curveVertex(113.5,377.5);
curveVertex(109,376);
curveVertex(115,371.5);
curveVertex(117,364);
curveVertex(113,359);
curveVertex(108,358);
curveVertex(105 ,360);
curveVertex(108,369.5);
curveVertex(104.5,368);
curveVertex(101.5,366.25);
curveVertex(99.25,364.75);
curveVertex(97.25,365);
curveVertex(94,364);
curveVertex(91.25,362.25);
curveVertex(89.5,358.5);
curveVertex(88.5,354.5);
curveVertex(74.5 ,355.5);
curveVertex(81.5 ,347.5);
curveVertex(89.5,348.5);
curveVertex(85.5,343.5);
curveVertex(88,342);
curveVertex(92.5,344.5 );
endShape(CLOSE);

//pink points
noFill();
stroke(187,107,104);
strokeWeight(5.25);
point(586,219.667);
point(586,231.333);
point(596,225);
point(607.667,219.667);
point(607.667,230.333);

//left black curve
strokeCap(SQUARE);
noFill();
stroke(0);
strokeWeight(8);
bezier(-3.5,151,0,140.333,15,79.667,0,0);

//red line
noFill();
strokeWeight(4.75);
stroke(180,50,50);
bezier(width,250, width,250,391.25,159,0,122.5);

//red star
noStroke();
fill(213,28,47);
beginShape();
vertex(103.5,412.5);
vertex(109.167,406.5);
vertex(109,414);
vertex(116.333,417);
vertex(109,419);
vertex(109.667,  426.667);
vertex(103.667,420.667);
vertex(94.667,422.333);
vertex(100.667,416);
vertex(96,409);
endShape(CLOSE);

//white stars
noStroke();
fill(255);
beginShape();
vertex(34.5,351);
vertex(36.5,354.5);
vertex(40.5,355);
vertex(37.5,358.5);
vertex(39.25,362.5);
vertex(34.5,360.5);
vertex(30.5,362.5);
vertex(31.5,358);
vertex(28.5,355.5);
vertex(32.5,355);
endShape(CLOSE);

beginShape();
vertex(22.003,371.333);
vertex(23.336,374.666);
vertex(27.336,374.666);
vertex(24.336,377.333);
vertex(25.5,381.25);
vertex(21.75,379);
vertex(18.336,380.999);
vertex(19.336,377.333);
vertex(16.003,374.999);
vertex(19.75,374.75);
endShape(CLOSE);

beginShape();
vertex(47.5,368);
vertex(49.25,371.75);
vertex(52.75,371.75);
vertex(50,373.75);
vertex(51.5,377.7);
vertex(47.75,375.75);
vertex(44,377.5);
vertex(45.25,374);
vertex(42.5,372);
vertex(46,371.5);
endShape(CLOSE);

beginShape();
vertex(37.336,397.999);
vertex(38.75,402);
vertex(42.75,402.5);
vertex(39.25,405);
vertex(41,409);
vertex(36.75,406.25);
vertex(32.75,408.5);
vertex(34.25,404.5);
vertex(31.25,402.25);
vertex(35.5,402);
endShape(CLOSE);

//black dot bottom
fill(0);
stroke(0);
ellipse(448.667,height,6.5,5.5);






