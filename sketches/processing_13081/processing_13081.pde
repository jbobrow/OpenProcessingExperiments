
size (640, 480);
background(200, 197, 166);
smooth();

//GRAY BAR
noStroke();
fill(44, 34, 43, 2);
quad(258.75, 484.167, 194.396, 388.176, 216.834, 388, 282.25, 482.537);

//WHITE BARS 2
noStroke();
fill(204, 209, 203);
quad(60, 73, 81, 70.5, 155.572, 109.424, 135.71, 112.783);
quad(270.5, -6.5, 361.5, 61, 379, 57.5, 288, -13.5);
quad(38, -2.5, 141.5, 61, 166, 60.5, 68.5, -3.5);

//BLUE SHAPES
PShape blue1;
blue1 = loadShape("blue1.svg");
shape(blue1, 215.5, 354.377);

//LINES
PShape lines;
lines = loadShape("lines.svg");
shape(lines, 128.5, 388.175);

//BLUE 2
noStroke();
fill(93, 121, 169);
rect(372, 16.5, 92.5, 18);

//FLAGS 2
noStroke();
{int flag1 = 0;
float j = 0;
  for (float i = 0; i < 120; i = i+38.5) {
    if (flag1 == 0)
      fill (194, 50, 52);
    else if (flag1 == 1 || flag1 == 3)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, 59 + j, 20 + i, 73 + j, 7 + i, 97.666 + j);
    
    flag1++;
    j = j + 14.5;
  }
}

{int flag2 = 0;
float j = 0;
  for (float i = 51.333; i < 167.5; i = i+38.5) {
    if (flag2 == 0)
      fill (194, 50, 52);
    else if (flag2 == 1 || flag2 == 3)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, -16.501 + j, 20 + i, -2.501 + j, 7 + i, 22.166 + j);
    
    flag2++;
    j = j + 14.5;
  }
}

{int flag4 = 0;
noStroke();
float j = 0;
  for (float i = 216.833; i < 270; i = i+38.5) {
    if (flag4 == 0)
      fill (194, 50, 52);
    else fill(204, 209, 203);
    
    triangle (i, 29.5 + j, 20 + i, 43.5 + j, 7 + i, 68.166 + j);
    
    flag4++;
    j = j + 14.5;
  }
}

{int flag5 = 0;
float j = 0;
  for (float i = 190.833; i < 310; i = i+38.5) {
    if (flag5 == 1)
      fill (36, 70, 50);
    else if (flag5 == 3)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, -20.501 + j, 20 + i, -6.501 + j, 7 + i, 18.166 + j);
    
    flag5++;
    j = j + 14.5;
  }
}


{int flag6 = 0;
float j = 0;
  for (float i = 347.334; i < 390; i = i+38.5) {
    if (flag6 == 1)
      fill (36, 70, 50, 90);
    else if (flag6 == 3)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, -20.501 + j, 20 + i, -6.501 + j, 7 + i, 18.166 + j);
    
    flag6++;
    j = j + 14.5;
  }
}



//LINES BLACK1
noFill();
stroke (0);
strokeJoin(MITER);
strokeWeight(1.75);
beginShape();
vertex(181.049, 131);
vertex(-33, 45);
vertex(-2.5, 39);
vertex(205.5, 122.5);
vertex(218.5, 116.5);
vertex(15, 32.89);
vertex(84.5, 32.89);
vertex(250, 108);
vertex(257.5, 102.5);
vertex(122.5, 32.89);
vertex(192, 32.89);
vertex(297.5, 94);
vertex(305, 90.5);
vertex(220, 35.5);
vertex(289, 32.89);
vertex(357.127, 78.5);
vertex(377, 73.5);
vertex(311, 32.89);
vertex(389, 32.89);
vertex(428.5, 65.5);
vertex(438, 59.5);
vertex(411.5, 38);
vertex(494.5, 40.5);
vertex(500.5, 50.5);
vertex(601, 44);
vertex(637, 106.5);
vertex(583, 109);
endShape();

//BIG YELLOW
stroke(0);
strokeWeight(.25);
fill(240, 182, 37);
beginShape();
vertex(276.75, 358.25);
vertex(132.73, 274.04);
vertex(165.74, 252.99);
vertex(54.26, 175.47);
bezierVertex(214.333, 84.333, 562.87, 32.89, 562.87, 32.89);
vertex(617.89, 123.32);
bezierVertex(636.332, 118.333, 660, 118.06, 660, 118.06);
vertex(660, 175.95);
bezierVertex(549.665, 189.667, 408.8, 242.46, 408.8, 242.46);
vertex(437.51, 263.03);
bezierVertex(315.665, 319.666, 276.75, 358.25, 276.75, 358.25);
endShape(CLOSE);




//BLUE 1
stroke(0);
strokeWeight(.25);
fill(93, 121, 169);
beginShape();
vertex(26.5, 298.44);
bezierVertex(141.665, 271.25, 181.05, 264.47, 181.05, 264.47);
vertex(181.05, 308.49);
bezierVertex(62.5, 336.5, 26.5, 347.72, 26.5, 347.72);
endShape(CLOSE);

//BIG YELLOW STROKE
stroke(0);
strokeWeight(.25);
noFill();
beginShape();
vertex(276.75, 358.25);
vertex(132.73, 274.04);
vertex(165.74, 252.99);
vertex(54.26, 175.47);
bezierVertex(214.333, 84.333, 562.87, 32.89, 562.87, 32.89);
vertex(617.89, 123.32);
bezierVertex(636.332, 118.333, 660, 118.06, 660, 118.06);
vertex(660, 175.95);
bezierVertex(549.665, 189.667, 408.8, 242.46, 408.8, 242.46);
vertex(437.51, 263.03);
bezierVertex(315.665, 319.666, 276.75, 358.25, 276.75, 358.25);
endShape();


//LINES BROWN (SET 1)
stroke(89, 49, 39);
strokeWeight(3);
bezier(-2.5, 273, 209, 229.667, 911, 208.333, 645.5, 217);
bezier(-5, 352, 212, 290, 1077, 240, 654, 265);
bezier(-6.5, 235.5, 198, 199, 1026, 178, 646, 187.5);

//AQUA LINE
stroke(94, 165, 188);
strokeWeight(2);
bezier(63.5, 457.168, 63.5, 457.168, 26.5, 443.835, 48.5, 404.168);
bezier(91.167, 424.5, 91.167, 424.5, 57.167, 389.833, 114.5, 317.834);
bezier(346.167, 308.835, 346.167, 308.835, 338.5, 243.168, 458.5, 194.835);


//YELLOW BAR
noStroke();
fill(240, 182, 37);
quad(-5, 231.993, 34.25, 231.993, 34.25, 238, -5, 238);

//BROWN SEMI CIRCLES
noStroke();
{
float j = 108;
for (float i = 150.75; i < 490; i = i+48) { 
    PShape brown1;
      brown1 = loadShape("brown1.svg");
      shape(brown1, i, j);
      
    j = j+1.25;

}


for (float k = 150.906; k < 154.906; k = k+1) {   
    PShape brown1;
      brown1 = loadShape("brown1.svg");
//      brown1.scale(1.1);
      shape(brown1, 536.25, k);

}

for (float l = 153.906; l < 157.906; l = l+1) {   
    PShape brown1;
      brown1 = loadShape("brown1.svg");
//      brown1.scale(1.1);
      shape(brown1, 585.042, l);

}}

//FLAG 3
{int flag3 = 0;
noStroke();
float j = 0;
  for (float i = 140.833; i < 260; i = i+38.5) {
    if (flag3 == 2)
      fill (36, 70, 50);
    else if (flag3 == 1 || flag3 == 3)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, 52.5 + j, 20 + i, 66.5 + j, 7 + i, 91.166 + j);
    
    flag3++;
    j = j + 14.5;
  }
}

{int flag4 = 0;
noStroke();
float j = 0;
  for (float i = 293.833; i < 350; i = i+38.5) {
    if (flag4 == 0)
      fill (36, 70, 50);
    else if (flag4 == 1)
      fill (0);
    else fill(204, 209, 203);
    
    triangle (i, 55 + j, 20 + i, 69 + j, 7 + i, 93.666 + j);
    
    flag4++;
    j = j + 14.5;
  }
}


//WHITE BARS
noStroke();
fill(204, 209, 203);
quad(-5, 189.033, 30, 184.54, 215.5, 253, 204.766, 253);
quad(-19.5, 88, 83, 144.349, 111, 140.749, -7.5, 75);
quad(120.5, 126.749, 135.5, 125, 190.644, 150.5, 168, 151);
quad(38, 88, 68.5, 3.5, 141.5, 61, 68.5, 3.5);
quad(228, 85, 334, 141.5, 349.5, 137.5, 255.5, 80);
quad(218.5, 204, 406.5, 264.47, 418.5, 260.315, 250, 202.249);
quad(364, 187, 496, 243.5, 509.5, 241, 389.5, 186.5);
quad(483.5, 20, 545.5, 103, 567.5, 102, 510, 17.5);
quad(557.5, 222.5, 656.5, 279.5, 646, 258, 586.5, 218.5);
quad(600, 125, 647, 185.5, 645, 149, 625, 122);
quad(408, 90.5, 481.5, 153.5, 498, 152, 435.5, 91);

//PUZZLES
    PShape brown2;
      brown2 = loadShape("brown2.svg");
      shape(brown2, 11.098, 89.083);

//LINES BLACK 2
noFill();
stroke(0);
strokeWeight(1.75);
ellipse(622.167, -2.17, 46, 30);
line(617.833, -7.5, 640, 39.833);
line(624.5, 13.167, 627.167, 33);
line(619.833, 24.5, 640, 45.833);
line(571.167, 27.833, 643.833, 29.833);
line(563.167, 32.5, 601.167, 75.167);
line(595.167, 53.833, 648.5, 53.833);
line(595.167, 53.833, 648.5, 53.833);
line(597.833, -8.167, 640, 77.833);
line(635.167, 51.833, 635.167, 88.5);
line(576.5, 54.5, 504.5, 54.5);
line(485.833, 53.167, 403.833, 53.167);
line(429.167, 35.167, 471.833, 78.5);
line(533.833, 75.167, 493.167, 32.5);
line(616.5, 99.5, 568.5, 113.5);
line(617.167, 91.167, 617.167, 122.5);
line(244.5, 145.166, 267.833, 205.833);
line(383.833, 151.833, 396.5, 201.833);
line(310.5, 225.166, 371.833, 223.833);
line(243.833, 291.834, 642.5, 277.167);
line(414.5, 58.5, 414.5, 99.166);
line(513.833, 63.833, 513.833, 110.5);
line(593.833,309.166,646.5,314.5);
line(589.167,339.166,658.5,340.5);
line(122.875,229.708,242.5,263.167);


beginShape();
vertex(555.833, -2.167);
vertex(589.167, 20.5);
vertex(643.167, 40.5);
endShape();

beginShape();
vertex(499.167, -5.5);
vertex(533.833, 18.5);
vertex(581.167, 42.5);
endShape();

beginShape();
vertex(644.5, 47.833);
vertex(620.5, 47.833);
vertex(640, 89.167);
endShape();

beginShape();
vertex(483.167, 25.167);
vertex(411.167, 9.833);
vertex(371.167, -11.5);
endShape();

beginShape();
vertex(555.833, 43.167);
vertex(397.833, 29.833);
vertex(307.833, -5.5);
endShape();

beginShape();
vertex(248.5, 135.166);
vertex(244.5, 103.166);
vertex(649.167, 116.5);
endShape();

beginShape();
vertex(218.833, 255.166);
vertex(165.167, 143.166);
vertex(640, 154.5);
endShape();

beginShape();
vertex(-4.5, 254.5);
vertex(142.125, 296.64);
vertex(332, 226.191);
endShape();

beginShape();
vertex(380.5, 69.166);
vertex(399.167, 69.166);
vertex(403.167, 79.833);
vertex(378.5, 79.833);
endShape();

beginShape();
vertex(537.167, 483.166);
vertex(553.833, 475.833);
vertex(557.167, 366.5);
endShape();

beginShape();
vertex(373.167, 487.833);
bezierVertex(293.5, 434.166, 397.833, 384.5, 397.833, 384.5);
vertex(592.5, 415.166);
bezierVertex(564.5, 443, 573.833, 480, 573.833, 480);
endShape();

beginShape();
vertex(580.5, 480);
bezierVertex(472.833, 416.5, 445.833, 377.833, 445.833, 377.833);
bezierVertex(412.5, 298.5, 477.167, 276.5, 477.167, 276.5);
vertex(447.833, 263.166);

endShape();

bezier(-2.167, 172.5, -2.167, 172.5, 532.5, 139, 658.5, 141.833);

//ELLIPSES
noFill();
stroke(0);
strokeWeight(1.75);
ellipse(280.5, 224, 61, 40);
ellipse(408.75, 219.75, 75.75, 38.5);
ellipse(531, 222.25, 61, 38.5);
ellipse(639.25, 219.5, 58.5, 31);

//GREEN DETAIL
//pushMatrix();
//scale(1.1);
PShape green1;
green1 = loadShape("green1.svg");
green1.scale(1.2);
shape(green1, 158, 285);
//popMatrix();




//RED DETAIL
PShape red1;
red1 = loadShape("red1.svg");
shape(red1, 34.25, 177);






//TRIANGLE LINES
smooth();
noStroke();
int count1 = 0;
  for (float i = 0; i < 182.394; i = i+18.056) {
    if (count1 == 0 || count1==3 || count1==4 || count1==6 || count1==7 || count1==9)
      fill (194, 50, 52);
    else if (count1 == 1 || count1==5 || count1==8)
      fill (36, 55, 112);
    else fill(204, 209, 203);
    
    triangle (i, 344.249, 5.495 + i, 372.249, 18.056 + i, 344.249);
    
    count1++;
  }
  
int count2 = 0;
  for (float i = -2.939; i < 159.728; i = i+18.056) {
    if (count2 == 2 || count2==3 || count2==5 || count2==6 || count2==8)
      fill (194, 50, 52);
    else if (count2 == 0 || count2==4 || count2==7)
      fill (36, 55, 112);
    else fill(204, 209, 203);
    
    triangle (i, 344.249+47.333, 5.495 + i, 372.249+47.333, 18.056 + i, 344.249+47.333);
    
    count2++;
  }

int count3 = 0;
  for (float i = 181.061; i < 375.728; i = i+18.056) {
    if (count3 == 0 || count3==1 || count3==4 || count3==5 || count3==7 || count3==8 || count3==10)
      fill (194, 50, 52);
    else if (count3 == 2 || count3==6 || count3==9)
      fill (36, 55, 112);
    else fill(204, 209, 203);
    
    triangle (i, 344.249+40.667, 5.495 + i, 372.249+40.667, 18.056 + i, 344.249+40.667);
    
    count3++;
  }
  

//RED LINE
noFill();
stroke(194, 50, 52);
strokeWeight(2);
bezier(195.417, 466.624, 195.417, 466.624, 207.567, 279.834, 339.167, 231.994);

//CORAL
PShape coral;
coral = loadShape("coral.svg");
shape(coral, 381.471, 108.33);

//BLUE CIRCLES
noStroke();
fill(34, 57, 113);
ellipse(62, 324, 18, 18);
ellipse(200.51, 474.58, 15.911, 15.911);
ellipse(276, 311.58, 15.911, 15.911);
ellipse(280.94, 260.315, 14.44, 14.44);
ellipse(408.32, 298.356, 14, 14);
ellipse(434.112, 365.033, 15.57, 15.57);
ellipse(533.819, 153.189, 16.316, 16.316);
ellipse(618.902, 137.105, 14.5, 14.5);
ellipse(618.9, 137.1, 14.5, 14.5);
ellipse(321, 388, 15.911, 15.911);
ellipse(627.409, 340.481, 16.483, 16.483);

//PURPLE CIRLCES
fill(75, 79, 111);
ellipse(214.25, 357.75, 9.5, 9.5);

//TURQOISE CIRLCES
fill(104, 142, 124);
ellipse(174.145, 397.809, 7.957, 7.957);
ellipse(303.167, 357.667, 7.333, 7.333);
ellipse(323.608, 232.641, 8.216, 8.216);
ellipse(492.5, 130.833, 8, 8);
ellipse(506.833, 105.167, 7.333, 7.333);
ellipse(509.667, 84.778, 7.666, 7.666);
ellipse(230.125 , 302.732, 8.75, 8.75);



//SEWAGE CIRLCES
fill(74, 86, 88);
ellipse(181.25, 383.75, 8.5, 8.5);
ellipse(204, 383.25, 12, 12);
ellipse(230.125, 338.124, 8.75, 8.75);
ellipse(258.75, 347.75, 12.5, 12.5);
ellipse(251.125, 315.624, 8.75, 8.75);
ellipse(269.5, 255.75, 7.25, 7.25);
ellipse(350.375, 277.874, 4.25, 4.25);
ellipse(345.125, 269.374, 4.25, 4.25);
ellipse(336.875, 261.874, 4.25, 4.25);
ellipse(342.875, 246.374, 8.25, 8.25);
ellipse(478.25, 141.25, 8.5, 8.5);
ellipse(349.5, 224.249, 9, 9);

//GREEN CIRCLES/BLOBS
fill(70, 99, 71);
PShape green2;
green2 = loadShape("green2.svg");
shape(green2, 284.448, 250.343);
ellipse(381.971, 241.166, 9.667, 9.667);
ellipse(387.304, 239.5, 9.667, 9.667);
ellipse(419.304, 224.165, 9.667, 9.667);
ellipse(423.385, 221.582, 9.667, 9.667);
ellipse(438.884, 228.581, 8.823, 8.823);
ellipse(454.217, 225.664, 8.823, 8.823);
ellipse(483.718, 187.582, 9.667, 9.667);

//LIGHT BLUE CIRCLES
fill(63,107,154);
ellipse(350.125, 146.124, 9.75, 9.75);
ellipse(390.25, 190.5, 7.875, 7.875);
ellipse(413.667, 134.749, 9.75, 9.75);
ellipse(531.125, 306.124, 9.75, 9.75);
ellipse(620.5, 291.5, 7.875, 7.875);
ellipse(631.5, 355, 7.875, 7.875);


//LINES BLUE (SET 2)
strokeWeight (3);
strokeCap(SQUARE);
stroke (36, 55, 112);
line (209.5, 287.499, 135.5, -6.001);
line (-1, 100.5, 13, 153);
line (428, 3.5, 561.5, 18);

noFill();
beginShape();
vertex(365, 35);
vertex(392.5, 166);
vertex(403.5, 84);
endShape();

beginShape();
vertex(592, -6);
vertex(598, 21);
vertex(604.5, -13.5);
endShape();


//LINES LIGHT BLUE (SET 3)
noFill();
strokeJoin(BEVEL);
strokeWeight(9);
stroke(74, 136, 193);
strokeCap (SQUARE);
beginShape();
vertex(71, -6);
vertex(125.5, 166);
vertex(158.5, -6);
endShape();

//RED DETAIL 2
PShape red2;
red2 = loadShape("red2.svg");
shape(red2, 381.74, 141.995);


//PURPLE LINE
stroke(53, 43, 80);
strokeWeight(2);
bezier(254.5, 480.167, 254.5, 480.167, 281.5, 439.167, 332.5, 453.167);

//STARS
{

float x = 0, y = 0;

for (float d = radians(198); d < radians(226); d = d+radians(1.65)) { 
    PShape star;
      star = loadShape("star.svg");

      x = sin(radians(270)-d)*206.98;
      y = cos(radians(270)-d)*206.98;

      shape(star, 436.888 - x, 330.684 + y);

}
}

//LINES 2
PShape lines2;
lines2 = loadShape("lines2.svg");
shape(lines2, 420.321, 99.5);

//BLUE LINE
strokeWeight(3);
stroke(61, 81, 105);
beginShape();
vertex(-8.167,437.168);
bezierVertex(5.5, 453.166, 140.833, 442.168, 140.833, 442.168);
bezierVertex(440.833, 399.5, 487.5, 384.5, 487.5, 384.5);
bezierVertex(565.5, 356.833, 577.5, 337.834, 577.5, 337.834);
endShape();

strokeWeight(2);
bezier(106.5, 242.501, 106.5, 242.501, 189.833, 264.168, 282.5, 234.5);


//Y
PShape y;
y = loadShape("y.svg");
shape(y, 371.75, 262);

//RED LINE THICK
stroke(194, 50, 52);
strokeWeight(5);
bezier(561.5, 483.167, 561.5, 483.167, 579.5, 465.5, 642.5, 453.5);

//RED CAPSULES
strokeCap(ROUND);
strokeWeight(15);
line(449.5, 323, 479.25, 334.5);
line(628.75, 397, 650.75, 397);

//ORANGE LINE
strokeCap(SQUARE);
strokeWeight(3);
stroke(222, 95, 57);
beginShape();
vertex(225.25, 132.416);
vertex(237, 150.867);
vertex(237, 177.906);
endShape();

beginShape();
vertex(260.705, 132.416);
vertex(248.955, 150.867);
vertex(248.955, 177.906);
endShape();

//FIRE
PShape fire;
fire = loadShape("fire.svg");
shape(fire, 488.276, -5.34);


